# Icon System

This site uses [Lucide Icons](https://lucide.dev/) - a beautiful, open-source icon library licensed under ISC.

## Sustainability Note

Each icon is ~300-450 bytes and loaded individually as needed. This means pages only load the icons they actually use, keeping the site fast and sustainable.

## Usage

### Basic Icon
```liquid
{% include icon.html name="external-link" %}
```

### With Custom Size
```liquid
{% include icon.html name="video" size="24" %}
```

### With Accessibility Label
```liquid
{% include icon.html name="presentation" aria-label="View slides" %}
```

### In a Link
```html
<a href="https://example.com">
  Visit site {% include icon.html name="external-link" size="16" %}
</a>
```

### With Custom Class
```liquid
{% include icon.html name="file-text" class="custom-style" %}
```

## Available Icons

### Action & Navigation
- `external-link` - For external URLs
- `link` - For general links
- `file-down` - For downloads

### Content Types
- `file-text` - For documents/PDFs
- `video` - For recordings
- `presentation` - For slides/presentations
- `book-open` - For publications/reading materials
- `clipboard-list` - For summaries/overviews
- `clipboard-pen-line` - For notes/annotations (alternative)

### Organization
- `folder` - For categories
- `tag` - For tags
- `calendar` - For dates/events

### Callout Icons (automatic in CSS)
- `info` - Information/note callouts
- `circle-check` - Success callouts
- `triangle-alert` - Warning callouts
- `circle-alert` - Danger/error callouts

### Note Icons (use in front matter)
- `lightbulb` - Ideas, insights
- More available at https://lucide.dev/icons/

## Adding More Icons

1. Visit https://lucide.dev/icons/
2. Find the icon you want
3. Download the SVG file
4. Save it to `assets/icons/`
5. Add the filename (without .svg) to the list above
6. Use it with `{% include icon.html name="icon-name" %}`

## Size Guidelines

- **14px**: Small metadata (tags, categories)
- **16px**: Inline with text, action buttons
- **18px**: Larger action buttons, summary labels
- **20px**: List page titles
- **24px+**: Detail page headings

## Notes Front Matter

Add an optional icon to any note:

```yaml
---
title: "My Brilliant Idea"
icon: "lightbulb"
---
```

Available note icons: `lightbulb`, `book-open`, `calendar`, or any icon from https://lucide.dev/icons/

## Styling

Icons inherit the current text color by default. You can style them with CSS:

```css
.custom-icon {
  color: var(--link-color);
  opacity: 0.8;
}
```
