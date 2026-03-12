# Inline SVG Tag Plugin for Jekyll
# Reads SVG files and inlines them for better theme support
#
# Usage: {% inline_svg path/to/icon.svg %}

module Jekyll
  class InlineSvgTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input.strip
    end

    def render(context)
      site = context.registers[:site]

      # Evaluate the input as a Liquid variable or use it as a literal string
      path = context[@input] || @input

      # Remove quotes if present
      path = path.gsub(/['"]/, '')

      svg_path = File.join(site.source, path)

      # Check if file exists
      unless File.exist?(svg_path)
        return "<!-- SVG not found: #{path} (resolved from: #{@input}) -->"
      end

      # Read and return the SVG content
      File.read(svg_path).strip
    end
  end
end

Liquid::Template.register_tag('inline_svg', Jekyll::InlineSvgTag)
