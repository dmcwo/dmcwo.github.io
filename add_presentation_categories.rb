#!/usr/bin/env ruby
# frozen_string_literal: true

# Assigns `category` field to presentation front matter.
# Categories derived from CSV data (mapped manually below).

require 'yaml'

PRESENTATIONS_DIR = File.join(__dir__, '_presentations')

# Mapping: filename => category
# Derived from CSV "Presentation Type" field, collapsed to 5 categories:
#   keynote, workshop, panel, presentation, poster, conference organizing
FILENAME_TO_CATEGORY = {
  # --- Keynotes ---
  'Same-But-Different.md'                                      => 'keynote',

  # --- Workshops ---
  'educause-personal-authoring-technologies.md'                => 'workshop',  # Pre-conference Workshop (EDUCAUSE 2007)
  'lets-build-something-instructional-design-workshop.md'      => 'workshop',  # Pre-conference Workshop
  'presentation-tls-wikis-foster-collaboration.md'             => 'workshop',  # Symposia & Workshops
  'presentation-tls-social-networking-remix-culture.md'        => 'workshop',  # Symposia & Workshops
  'presentation-thatcampsocal-drupal-starter-kit.md'           => 'workshop',  # Symposia & Workshops (THATCamp)
  'presentation-stle-moving-toward-student-centered-learning.md' => 'workshop', # Symposia & Workshops
  'presentation-tls-improving-class-discussions-online-chats.md' => 'workshop', # Symposia & Workshops
  'healthy-discontent-about-assessment.md'                     => 'workshop',  # Symposia & Workshops
  'presentation-tls-wisconsin-idea-podcasting.md'              => 'workshop',  # Symposia & Workshops
  'presentation-sfsu-matesol-unrehearsed-communication.md'     => 'workshop',  # Symposia & Workshops
  'presentation-tls-collaborative-learning-lab.md'             => 'workshop',  # Symposia & Workshops
  'exploring-your-options-with-online-research-skills-instruction.md' => 'workshop', # Symposia & Workshops
  'lilac-research-notebook.md'                                 => 'workshop',  # Symposia & Workshops (LILAC workshop)
  'lj-data-assessment-participatory-design.md'                 => 'workshop',  # Symposia & Workshops (LJ Webinar)
  'presentation-iallt-participatory-design-and-evaluation.md'  => 'workshop',  # Symposia & Workshops (IALLT Webinar)
  'presentation-tls-ls-lessonshare.md'                         => 'workshop',  # Symposia & Workshops
  'presentation-eli-collaborative-conundrum.md'                => 'workshop',  # Symposia & Workshops

  # --- Panels ---
  'high-impact-librarianship.md'                               => 'panel',     # Panel Presentations
  'lj-data-assessment-participatory-design.md'                 => 'panel',     # Panel Presentations (LJ webinar panel)

  # --- Presentations ---
  'presentation-fleat-making-wikis-work.md'                    => 'presentation',
  'presentation-mwallt-evaluating-professor-podcast.md'        => 'presentation',
  'presentation-iallt-collaborative-sites.md'                  => 'presentation',
  'presentation-tesol-instant-documentaries.md'                => 'presentation',
  'presentation-cicltg-podcast-polyglots.md'                   => 'presentation',
  'presentation-tls-ls-lessonshare.md'                         => 'presentation',
  'presentation-c2es-meet-professor-podcast.md'                => 'presentation',
  'presentation-carl-dig-research-support-beyond-a-desk.md'    => 'presentation',
  'presentation-carl-dig-leading-the-way.md'                   => 'presentation',
  'presentation-swallt-participatory-design.md'                => 'presentation',
  'presentation-LOEX-Writing-Thinking-Learning.md'             => 'presentation',
  'presentation-liw-digital-research-notebook.md'              => 'presentation',
  'presentation-liw-learning-theories.md'                      => 'presentation',
  'presentation-nmc-knowledge-building-for-dh.md'              => 'presentation',
  'presentation-tesol-feedback-on-student-presentations.md'    => 'presentation',
  'presentation-tesol-lessonbuilder.md'                        => 'presentation',
  'presentation-iallt-wikis-audience-authorship-assessment.md' => 'presentation',
  'presentation-educause-creating-custom-learning-environments.md' => 'presentation', # Poster in CSV but listed as EDUCAUSE session
  'flipping-engineering-information-literacy-instruction.md'   => 'presentation', # Lightning Talk -> presentation
  'presentation-eli-collaborative-conundrum.md'                => 'presentation',
  'scenarios-for-success.md'                                   => 'presentation', # AAC&U invited
  'sample-conference-talk.md'                                  => 'presentation',

  # --- Posters ---
  'can-librarians-wear-plaid.md'                               => 'poster',
  'DIY-spaces-in-an-age-of-change.md'                          => 'poster',
  'library-based-curriculum-students-into-scholars.md'         => 'poster',
  'future-of-reference.md'                                     => 'poster',
  'presentation-educause-creating-custom-learning-environments.md' => 'poster',

  # --- Conference Organizing ---
  'wiscwiki-conference.md'                                      => 'conference organizing',
  # Note: ALA Undergraduate Librarians Discussion Group files also Professional Org Roles
  # but we don't have distinct files for those — they appear to be in the same files above
}.freeze

# Correct the duplicate keys — last one wins in Ruby hash literal above.
# Let's define the final authoritative mapping cleanly:
CATEGORY_MAP = {
  'Same-But-Different.md'                                             => 'keynote',
  'educause-personal-authoring-technologies.md'                      => 'workshop',
  'lets-build-something-instructional-design-workshop.md'            => 'workshop',
  'presentation-tls-wikis-foster-collaboration.md'                   => 'workshop',
  'presentation-tls-social-networking-remix-culture.md'              => 'workshop',
  'presentation-thatcampsocal-drupal-starter-kit.md'                 => 'workshop',
  'presentation-stle-moving-toward-student-centered-learning.md'     => 'workshop',
  'presentation-tls-improving-class-discussions-online-chats.md'     => 'workshop',
  'healthy-discontent-about-assessment.md'                           => 'workshop',
  'presentation-tls-wisconsin-idea-podcasting.md'                    => 'workshop',
  'presentation-sfsu-matesol-unrehearsed-communication.md'           => 'workshop',
  'presentation-tls-collaborative-learning-lab.md'                   => 'workshop',
  'exploring-your-options-with-online-research-skills-instruction.md'=> 'workshop',
  'lilac-research-notebook.md'                                       => 'workshop',
  'lj-data-assessment-participatory-design.md'                       => 'workshop',
  'presentation-iallt-participatory-design-and-evaluation.md'        => 'workshop',
  'presentation-tls-ls-lessonshare.md'                               => 'workshop',
  'high-impact-librarianship.md'                                     => 'panel',
  'presentation-fleat-making-wikis-work.md'                          => 'presentation',
  'presentation-mwallt-evaluating-professor-podcast.md'              => 'presentation',
  'presentation-iallt-collaborative-sites.md'                        => 'presentation',
  'presentation-tesol-instant-documentaries.md'                      => 'presentation',
  'presentation-cicltg-podcast-polyglots.md'                         => 'presentation',
  'presentation-c2es-meet-professor-podcast.md'                      => 'presentation',
  'presentation-carl-dig-research-support-beyond-a-desk.md'          => 'presentation',
  'presentation-carl-dig-leading-the-way.md'                         => 'presentation',
  'presentation-swallt-participatory-design.md'                      => 'presentation',
  'presentation-LOEX-Writing-Thinking-Learning.md'                   => 'presentation',
  'presentation-liw-digital-research-notebook.md'                    => 'presentation',
  'presentation-liw-learning-theories.md'                            => 'presentation',
  'presentation-nmc-knowledge-building-for-dh.md'                    => 'presentation',
  'presentation-tesol-feedback-on-student-presentations.md'          => 'presentation',
  'presentation-tesol-lessonbuilder.md'                              => 'presentation',
  'presentation-iallt-wikis-audience-authorship-assessment.md'       => 'presentation',
  'flipping-engineering-information-literacy-instruction.md'         => 'presentation',
  'presentation-eli-collaborative-conundrum.md'                      => 'presentation',
  'scenarios-for-success.md'                                         => 'presentation',
  'sample-conference-talk.md'                                        => 'presentation',
  'can-librarians-wear-plaid.md'                                     => 'poster',
  'DIY-spaces-in-an-age-of-change.md'                                => 'poster',
  'library-based-curriculum-students-into-scholars.md'               => 'poster',
  'future-of-reference.md'                                           => 'poster',
  'presentation-educause-creating-custom-learning-environments.md'   => 'poster',
  'wiscwiki-conference.md'                                           => 'conference organizing',
}.freeze

# Additional CSV "Professional Organization Roles" entries:
# - Undergraduate Librarians Discussion Group (two entries)
# These don't appear to have dedicated files — they were likely skipped in migration
# or folded into other files. We'll note them if we find them.

results = { assigned: [], skipped: [], unmatched: [] }

Dir.glob(File.join(PRESENTATIONS_DIR, '*.md')).sort.each do |path|
  filename = File.basename(path)
  content  = File.read(path, encoding: 'utf-8')

  # Extract front matter
  unless content =~ /\A---\s*\n(.*?)\n---\s*\n/m
    puts "SKIP (no front matter): #{filename}"
    results[:skipped] << filename
    next
  end

  fm_str = $1
  body   = $'

  # Parse without safe_load restrictions — permit Date
  fm = YAML.load(fm_str, permitted_classes: [Date, Time, Symbol]) || {}

  # Already has a non-empty category?
  if fm['category'] && !fm['category'].to_s.strip.empty?
    puts "SKIP (already set to '#{fm['category']}'): #{filename}"
    results[:skipped] << filename
    next
  end

  # Blank/example file?
  if filename == 'presentation-example.md'
    puts "SKIP (example file): #{filename}"
    results[:skipped] << filename
    next
  end

  category = CATEGORY_MAP[filename]

  if category.nil?
    puts "UNMATCHED: #{filename}  (title: #{fm['title'].to_s[0..60]})"
    results[:unmatched] << filename
    next
  end

  # Insert `category` before the `title:` line (avoids multi-line title issues)
  if fm_str =~ /^title:/
    new_fm_str = fm_str.sub(/^(title:)/, "category: #{category}\n\\1")
  else
    new_fm_str = "category: #{category}\n" + fm_str
  end

  new_content = "---\n#{new_fm_str}\n---\n#{body}"
  File.write(path, new_content, encoding: 'utf-8')

  puts "OK [#{category.ljust(22)}] #{filename}"
  results[:assigned] << filename
end

puts "\n#{'='*60}"
puts "Assigned:  #{results[:assigned].size}"
puts "Skipped:   #{results[:skipped].size}"
puts "Unmatched: #{results[:unmatched].size}"
unless results[:unmatched].empty?
  puts results[:unmatched].map { |f| "  - #{f}" }.join("\n")
end
