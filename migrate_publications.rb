#!/usr/bin/env ruby
# encoding: UTF-8
# Publications Migration Script
# Migrates publication files from dmcwo to dmcwo-3 with front-matter transformation

require 'yaml'
require 'fileutils'

# Force UTF-8 encoding
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# Configuration
SOURCE_DIR = File.expand_path('../dmcwo/_publications', __dir__)
DEST_DIR = File.expand_path('_publications', __dir__)
LOG_FILE = 'migration_log.txt'

# Initialize log
File.open(LOG_FILE, 'w') do |log|
  log.puts "Publications Migration Log"
  log.puts "=" * 50
  log.puts "Started at: #{Time.now}"
  log.puts ""
end

def log_message(message)
  puts message
  File.open(LOG_FILE, 'a') { |log| log.puts message }
end

def transform_front_matter(old_fm)
  new_fm = {}

  # Direct copies
  new_fm['title'] = old_fm['title']
  new_fm['authors'] = old_fm['authors']

  # Rename pubname to publication_name
  new_fm['publication_name'] = old_fm['pubname']

  # Handle volume, issue, pages - convert nil/"pages-tbd" to empty string
  new_fm['volume'] = (old_fm['volume'].nil? || old_fm['volume'].to_s.strip.empty?) ? "" : old_fm['volume'].to_s
  new_fm['issue'] = (old_fm['issue'].nil? || old_fm['issue'].to_s.strip.empty?) ? "" : old_fm['issue'].to_s
  pages_value = old_fm['pages'].to_s.strip
  new_fm['pages'] = (pages_value.empty? || pages_value == 'pages-tbd') ? "" : pages_value

  # Extract year from date, keep full date as sort_date
  if old_fm['date']
    date = old_fm['date'].is_a?(Date) ? old_fm['date'] : Date.parse(old_fm['date'].to_s)
    new_fm['year'] = date.year
    new_fm['sort_date'] = date.strftime('%Y-%m-%d')
  end

  # Split DOI field - check if it's actually a DOI link
  # Use 'external_url' to avoid conflicts with Jekyll's built-in url/permalink
  if old_fm['doi']
    doi_value = old_fm['doi'].to_s.strip
    if doi_value.match?(%r{^https?://(dx\.)?doi\.org})
      new_fm['doi'] = doi_value
      new_fm['external_url'] = ""
    else
      new_fm['doi'] = ""
      new_fm['external_url'] = doi_value
    end
  else
    new_fm['doi'] = ""
    new_fm['external_url'] = ""
  end

  # Handle abstract - preserve multi-line format
  new_fm['abstract'] = old_fm['abstract'] if old_fm['abstract']

  # Handle category - convert "book chapter" to "article"
  category = old_fm['category'].to_s.strip
  new_fm['category'] = (category == 'book chapter') ? 'article' : category

  new_fm
end

def extract_filename_slug(original_filename)
  # Remove date prefix and extension
  # Example: 2017-02-23-acrl-students-lead-the-library.md -> acrl-students-lead-the-library
  basename = File.basename(original_filename, '.*')
  basename.sub(/^\d{4}-\d{2}-\d{2}-/, '')
end

def migrate_file(source_path)
  log_message "\nProcessing: #{File.basename(source_path)}"

  # Read file with UTF-8 encoding
  content = File.read(source_path, encoding: 'UTF-8')

  # Split front-matter and content
  if content =~ /\A---\s*\n(.*?)\n---\s*\n(.*)/m
    front_matter_text = $1
    markdown_content = $2

    # Parse YAML front-matter
    old_fm = YAML.safe_load(front_matter_text, permitted_classes: [Date, Time])

    # Transform front-matter
    new_fm = transform_front_matter(old_fm)

    # Generate new filename
    slug = extract_filename_slug(File.basename(source_path))
    new_filename = "#{slug}.md"
    new_path = File.join(DEST_DIR, new_filename)

    # Build new file content
    new_content = "---\n"
    new_content += YAML.dump(new_fm).sub(/^---\n/, '')
    new_content += "---\n"
    new_content += markdown_content

    # Write to destination
    File.write(new_path, new_content)

    log_message "  ✓ Migrated to: #{new_filename}"
    log_message "    Year: #{new_fm['year']}, Category: #{new_fm['category']}"

    return { success: true, filename: new_filename }
  else
    log_message "  ✗ ERROR: Could not parse front-matter"
    return { success: false, error: "Invalid front-matter format" }
  end
rescue => e
  log_message "  ✗ ERROR: #{e.message}"
  log_message "    #{e.backtrace.first}"
  return { success: false, error: e.message }
end

# Main execution
begin
  log_message "Source directory: #{SOURCE_DIR}"
  log_message "Destination directory: #{DEST_DIR}"
  log_message ""

  # Check source directory exists
  unless Dir.exist?(SOURCE_DIR)
    log_message "ERROR: Source directory not found: #{SOURCE_DIR}"
    exit 1
  end

  # Create destination directory if needed
  FileUtils.mkdir_p(DEST_DIR)

  # Get all publication files
  source_files = Dir.glob(File.join(SOURCE_DIR, '*.{md,markdown}')).sort

  log_message "Found #{source_files.length} publication files to migrate"
  log_message "=" * 50

  # Migrate each file
  results = source_files.map { |file| migrate_file(file) }

  # Summary
  log_message ""
  log_message "=" * 50
  log_message "Migration Summary"
  log_message "=" * 50
  successful = results.count { |r| r[:success] }
  failed = results.count { |r| !r[:success] }

  log_message "Total files: #{source_files.length}"
  log_message "Successful: #{successful}"
  log_message "Failed: #{failed}"
  log_message ""
  log_message "Completed at: #{Time.now}"

  if failed > 0
    log_message ""
    log_message "WARNING: Some files failed to migrate. Check log above for details."
    exit 1
  else
    log_message ""
    log_message "✓ All publications migrated successfully!"
  end

rescue => e
  log_message ""
  log_message "FATAL ERROR: #{e.message}"
  log_message e.backtrace.join("\n")
  exit 1
end
