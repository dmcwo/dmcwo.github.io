# Professional Portfolio — Jekyll Theme

A lightweight, accessible professional portfolio and CV website built with [Jekyll](https://jekyllrb.com/). Designed for academics, educators, designers, and other professionals who want a clean, readable online presence with support for presentations, publications, projects, and notes.

---

## Design Philosophy

This site is built around a small number of core values that shape every decision:

**Accessibility first.** The site uses [Atkinson Hyperlegible](https://brailleinstitute.org/freefont), a typeface designed by the Braille Institute for maximum legibility. Color contrast is maintained across all five themes. Skip links, ARIA labels, semantic HTML, and visible focus indicators are built in throughout. The site is navigable by keyboard and screen reader.

**Sustainability and efficiency.** Pages are static HTML — no JavaScript framework, no database, no heavy build pipeline. Icons are individual SVG files (~300–450 bytes each) loaded inline only when used. Each page loads only what it needs. The result is fast page loads, low server overhead, and a site that is easy to host anywhere.

**Consistent listing style.** Presentations, publications, projects, and notes share a unified listing philosophy: each item is a titled entry with metadata, optional abstract, and action links. Items group into meaningful categories (article types, presentation formats, etc.) using the same visual language. This parallelism makes the site easy to scan and easy to maintain — the same mental model applies everywhere.

**Light iconography.** Icons are used sparingly as visual anchors, not decoration. A small set of [Lucide Icons](https://lucide.dev/) supports content-type labeling, action links (slides, recordings, handouts), and metadata (categories, tags, dates). Icons inherit text color and scale cleanly at any size.

**Flexibility within consistency.** Collections share a common listing structure but each can be configured independently — publications group by type (articles, book chapters, interviews), presentations group by format (keynotes, workshops, panels), projects group by thematic category (learning design, service design, organizational design, team building), while notes use a flat chronological list. Grouping and icons are defined in a single configuration file.

---

## Features

- **Five color themes** switchable from the header: Mocha (warm cream), Cloud (minimal blue), Deep Focus (dark mode), Archival (academic/vintage), Verdant (fresh green)
- **Ten content collections**: experience, education, publications, presentations, awards, grants, teaching, service, projects, notes
- **Individual detail pages** for presentations, publications, projects, and notes — with action links (slides, recordings, handouts, external links) and previous/next navigation
- **Featured images** on individual detail pages (notes, presentations, projects) — full-width hero between the header and content body
- **Featured content system** — add `featured: true` to any presentation, publication, or project to surface it in the homepage featured sections
- **Project tile cards** — the homepage and `/projects/` listing page display projects as responsive text-forward tile cards (1 column mobile → 2 columns at 480px → 3 columns at 1024px)
- **CV page** assembling all collections into a single printable curriculum vitae with table of contents
- **Configurable grouping** per collection via `_data/collection-config.yml`
- **Inline SVG icons** with a simple Liquid include tag
- **Callout components** for highlighting key information in content
- **Image grid utility** (`.image-grid--2`, `.image-grid--3`) for responsive multi-column photo layouts in note and presentation body content
- **Responsive navigation** with hamburger/drawer menu on mobile
- **Print stylesheet** optimized for PDF/print output
- **SEO, sitemap, and RSS feed** via Jekyll plugins
- **Style guide** at `/styleguide/` for previewing all components and themes

---

## Quick Start

### Prerequisites

- Ruby (2.7+)
- Bundler

### Install and run

```bash
bundle install
```

For local development (site serves at `http://localhost:4000/`):

```bash
bundle exec jekyll serve --config _config.yml,_config_dev.yml
```

The `_config_dev.yml` override sets `baseurl: ""` so navigation works cleanly at the root. For a custom port, add `--port 4001`.

To serve with the production `baseurl` (site serves at `http://localhost:4000/dmcwo/`):

```bash
bundle exec jekyll serve
```

To build for production:

```bash
bundle exec jekyll build
```

The built site is output to `_site/`.

---

## Site Configuration

Edit `_config.yml` to set your name, bio, and social links:

```yaml
title: "Your Name"
description: "Brief site description."
author:
  name: "Your Name"
  email: "you@example.com"
  bio: "A sentence or two about you."
  linkedin: "https://www.linkedin.com/in/yourprofile"
  github: "https://github.com/yourusername"
  orcid: "https://orcid.org/0000-0000-0000-0000"
```

---

## Content Collections

The site uses Jekyll collections to organize professional content. Each collection has a corresponding directory (`_publications/`, `_presentations/`, etc.) containing individual Markdown files.

| Collection | Directory | Has Detail Pages | Groups By |
|---|---|---|---|
| Experience | `_experience/` | No | Organization |
| Education | `_education/` | No | Category |
| Publications | `_publications/` | No | Category (article, book chapter, interview) |
| Presentations | `_presentations/` | Yes | Category (keynote, workshop, panel, etc.) |
| Awards | `_awards/` | No | — |
| Grants | `_grants/` | No | — |
| Teaching | `_teaching/` | No | Category |
| Service | `_service/` | No | Organization |
| Projects | `_projects/` | Yes | Category (learning-design, service-design, organizational-design, team-building) |
| Notes | `_notes/` | Yes | — (flat list) |

Collections are sorted by `sort_date` in descending order (newest first).

---

## How to Add Content

### Adding a Presentation

Create a new `.md` file in `_presentations/`. Use a descriptive filename (e.g., `2024-acrl-my-talk.md`).

```yaml
---
category: presentation        # keynote | workshop | panel | presentation | poster | conference organizing
title: "Your Talk Title"
subtitle: ""
presenters: "Last, First."
meeting_name: "Full Conference Name"
meeting_short_name: "CONF"
meeting_url: "https://conference-url.org"
location: "City, State"
date: 2024-05-15
sort_date: 2024-05-15
abstract: |
  A brief description of the presentation. Can be multi-line.
slide_url: "https://link-to-slides.com"
handout_url: ""
recording_url: ""
banner: "/assets/images/features/my-banner.jpg"  # optional hero image
banner_alt: "Describe what the image shows"
---

Optional extended content about the presentation goes here in Markdown.
```

The `category` field controls which group the presentation appears under on the presentations listing page. Available categories are defined in `_data/collection-config.yml`.

The `banner` field is optional. When set, the image appears as a full-width hero on the presentation detail page and as a small landscape thumbnail on the listing card. Use `banner_alt` to describe what the image shows (not the presentation topic).

**Tip:** Set `published: false` to draft a presentation without it appearing on the site.

---

### Adding a Publication

Create a new `.md` file in `_publications/`.

```yaml
---
category: article             # article | book chapter | interview
title: "Article or Chapter Title"
authors: "Last, First., & Last, First."
publication_name: "Journal or Book Title"
volume: "5"
issue: "1"
pages: "1–20"
year: 2024
sort_date: "2024-01-01"
doi: "https://doi.org/10.xxxx/xxxxx"
external_url: ""
cover_image: "/assets/images/covers/my-cover.jpg"  # optional book/journal cover
cover_image_alt: "Describe the cover image"
abstract: |
  Optional abstract text.
---
```

Publications do not generate individual detail pages by default. To enable them, set `output: true` for the `publications` collection in `_config.yml`.

The `cover_image` field is optional. When set, a portrait-ratio cover thumbnail appears to the left of the entry on the publications listing page. It does not appear on the CV page. Place cover images in `assets/images/covers/`.

---

### Adding a Project

Create a new `.md` file in `_projects/`.

```yaml
---
title: "Project Title"
subtitle: ""                          # optional tagline
category: "learning-design"           # learning-design | service-design | organizational-design | team-building
institution: "Your Institution"
collaborators: ""                     # comma-separated names if applicable
project_url: ""                       # live URL if available
start_date: 2020-01-01
end_date: 2024-06-01                  # leave blank for ongoing
sort_date: 2024-06-01                 # use end_date or most recent activity
date: 2024-06-01                      # keep in sync with sort_date
impact: |
  One sentence: what changed or became possible because this project existed.
role: |
  One sentence: your specific contribution and what you built or led.
skill_themes:
  - "Theme one"
  - "Theme two"
  - "Theme three"
featured_image: "/assets/images/projects/project-slug.jpg"  # optional hero on detail page only
featured_image_alt: "Describe what the image shows, not what the project is"
abstract: |
  2–3 sentence description for the meta description and detail page header.
tags: ["tag-one", "tag-two"]
published: true
featured: true                         # optional — surfaces this project in the homepage featured section
---

Extended project description in Markdown. Include background, approach, outcomes, and lessons learned.
```

The `category` field controls which group the project appears under on the listing page. The four categories are defined in `_data/collection-config.yml`.

**Project detail page structure:**

| Area | What renders |
|---|---|
| Header | `title` as H1; `subtitle` as a styled lead paragraph; `institution · date range` as a compact byline |
| Hero | `featured_image` full-width between header and meta box |
| Meta box | `abstract` → "Summary"; `collaborators` → "With"; `role` → "My role"; `skill_themes` → "Core capabilities" (joined with " · "); `tags` → "Tags" (joined with " · ") |
| Action link | `project_url` → "View Project" button, if set |
| Body | Markdown content |

The meta box uses a two-column label/value grid on screens ≥ 480px and stacks to a single column on smaller screens. Any meta box row whose field is empty or absent is silently omitted.

The `impact` field is defined in front matter but is not currently rendered on the detail page or on listing tiles.

On listing pages (homepage tiles and `/projects/` tiles), projects display only `title`, `subtitle`, and `institution`. The meta box fields do not appear in tiles.

For ongoing projects, leave `end_date` blank; the date range will display as "2020–present".

---

### Drafts and Unpublished Content

Set `published: false` in any item's front matter to suppress it across the entire site:

```yaml
published: false
```

This works for every collection — presentations, publications, projects, notes, and all CV-only collections (experience, education, awards, grants, teaching, service).

**What `published: false` does:**
- Prevents Jekyll from generating a detail page for the item
- Excludes the item from all listing pages (`/presentations/`, `/projects/`, etc.)
- Excludes the item from the CV page and its table of contents
- Omitting the field (or setting `published: true`) has no effect — items are published by default

**To preview unpublished items locally** without removing the flag:

```bash
bundle exec jekyll serve --unpublished
```

This causes Jekyll to generate pages for unpublished items so you can review them. Remove the flag before publishing to production.

**Note:** The `_drafts/` folder mechanism is specific to posts and does not work for custom collections. Use `published: false` instead.

---

### Adding a Note

Notes are the most flexible content type — suitable for essays, reflections, research notes, or anything that doesn't fit the other categories.

```yaml
---
title: "Note Title"
icon: "lightbulb"             # Optional: any icon name from assets/icons/
date: 2024-02-01
sort_date: 2024-02-01
abstract: "A one or two sentence summary."
categories:
  - category-name
tags:
  - tag-one
  - tag-two
featured_image: "/assets/images/features/my-image.jpg"  # optional
featured_image_alt: "Describe what the image shows"
---

Note content in Markdown.
```

The `icon` field places an icon next to the note title in listings and on the detail page. See the [Icons](#icons) section for available options.

The `featured_image` field is optional. When set, the image appears as a full-width hero on the note detail page and as a small landscape thumbnail on the listing card. Use `featured_image_alt` to describe what the image shows.

**For multi-column photo grids in note body content**, use the `.image-grid` utility classes — see [Image Grid](#image-grid) below.

---

### Adding CV-Only Content

Experience, education, awards, grants, teaching, and service entries appear only on the CV page — they don't generate individual detail pages.

**Experience (`_experience/`):**

```yaml
---
title: "Job Title"
organization: "Organization Name"
organization_url: ""
location: "City, State"
start_date: 2021-04-01
end_date:                     # Leave blank for current position
sort_date: 2021-04-01
highlights:
  - "Key accomplishment or responsibility."
  - "Another highlight."
---
```

**Education (`_education/`):**

```yaml
---
title: "Degree or Credential Name"
institution: "Institution Name"
category: "degree"            # degree | certificate | etc.
year: 2002
sort_date: "2002-01-01"
credential_url: ""
---
```

---

## Themes

The site includes five color schemes, selectable from the theme switcher in the header. Themes are defined in `_sass/_themes.scss` using CSS custom properties.

| Theme | Character | Background | Accent |
|---|---|---|---|
| Mocha | Warm, welcoming (default) | Cream `#fdfaf8` | Taupe `#a47864` |
| Cloud | Minimal, professional | Light gray `#f0eee9` | Blue `#3d5a80` |
| Deep Focus | Dark mode, extended reading | Dark `#1b1f23` | Gold `#d4a574` |
| Archival | Academic, vintage | Aged paper `#f7f3ed` | Rust `#8c4a2f` |
| Verdant | Fresh, contemporary | Off-white `#f8faf8` | Green `#3a7d44` |

To set a different default theme, edit `_includes/theme-switcher.html` and update the initial `data-theme` value on the `<html>` element in `_layouts/default.html`.

### CSS Custom Properties

All theme colors are available as custom properties throughout the stylesheets:

```
--color-bg          Primary background
--color-bg-alt      Alternate background
--color-text        Primary text
--color-text-muted  Secondary text
--color-accent      Primary accent
--color-accent-dark Darker accent variant
--color-border      Border color
--color-link        Link color
--color-link-hover  Link hover state
--color-focus-ring  Keyboard focus indicator
```

---

## Icons

The site uses [Lucide Icons](https://lucide.dev/) — clean, open-source line icons. Icons are loaded as individual inline SVGs for optimal performance: each page loads only the icons it uses.

### Using Icons in Content

```liquid
{% include icon.html name="lightbulb" %}
{% include icon.html name="video" size="24" %}
{% include icon.html name="external-link" class="custom-class" %}
{% include icon.html name="info" aria-label="Important information" %}
```

Parameters:
- `name` (required): Icon filename without `.svg` extension
- `size` (optional, default `20`): Pixel dimensions
- `class` (optional): Additional CSS class
- `aria-label` (optional): Accessible label (icon is hidden from screen readers by default)

### Icon Size Guidelines

| Size | Use case |
|---|---|
| 14px | Small metadata (tags, categories, dates) |
| 16px | Inline with text, action link buttons |
| 18px | Larger action buttons, section labels |
| 20px | List page titles, standalone use |
| 24px+ | Detail page headings |

### Available Icons

**Action & Navigation:** `external-link`, `link`, `file-down`

**Content Types:** `file-text`, `video`, `presentation`, `book-open`, `clipboard-list`, `clipboard-pen-line`

**Organization:** `folder`, `tag`, `calendar`

**Callouts:** `info`, `circle-check`, `triangle-alert`, `circle-alert`

**Notes & Metadata:** `lightbulb`, `align-left`, `mic`, `brain`, `messages-square`, `shuffle`, `search-alert`, `octagon-alert`

### Adding a New Icon

1. Browse [lucide.dev/icons](https://lucide.dev/icons/)
2. Download the SVG file
3. Save it to `assets/icons/` using the icon's Lucide name (e.g., `bookmark.svg`)
4. Use it with `{% include icon.html name="bookmark" %}`

---

## Configuring Collection Grouping and Icons

`_data/collection-config.yml` controls how collections are grouped, which icon represents each category, and the order groups appear on listing pages. It is the single place to add, rename, reorder, or remove a category.

```yaml
publications:
  grouping:
    enabled: true
    field: "category"
    categories:
      - name: "article"         # matches front matter category value
        icon: "file-text"       # icon name from assets/icons/
        display: "Articles"     # label shown in listings
        description: "Peer-reviewed journal articles"
```

**Category order** is determined by the order of entries in the `categories` list. To change the display order, cut and paste category blocks within the list — no template changes needed. Categories with no matching content items are automatically skipped, so unused categories never produce empty headings.

To add a new presentation category (e.g., "invited talk"):

1. Add an entry under `presentations.grouping.categories` in `collection-config.yml`, in the position where you want it to appear
2. Use the new category name in the `category` front matter field of your presentation files

---

## Callouts

Use callouts in any Markdown page or note to highlight important information:

```html
<aside class="callout callout--info">
<strong>Note:</strong> Helpful context or additional details.
</aside>

<aside class="callout callout--success">
<strong>Tip:</strong> A recommended approach or best practice.
</aside>

<aside class="callout callout--warning">
<strong>Caution:</strong> Something to watch out for.
</aside>

<aside class="callout callout--danger">
<strong>Important:</strong> Critical information.
</aside>
```

In Jekyll Markdown files you can also use the Kramdown attribute syntax:

```markdown
Key insight: this approach works better.
{: .callout}
```

Available modifiers: `callout--info`, `callout--note`, `callout--success`, `callout--warning`, `callout--danger`

---

## Image Grid {#image-grid}

Use `.image-grid` utility classes to lay out multiple images in a responsive multi-column grid inside note or presentation body content. Images fill their cell and maintain aspect ratio via `object-fit: cover`.

```html
<!-- Two-column grid -->
<div class="image-grid image-grid--2">
  <img src="/assets/images/photo-a.jpg" alt="Description of photo A" />
  <img src="/assets/images/photo-b.jpg" alt="Description of photo B" />
</div>

<!-- Three-column grid (collapses to two columns on small screens) -->
<div class="image-grid image-grid--3">
  <img src="/assets/images/photo-a.jpg" alt="Description" />
  <img src="/assets/images/photo-b.jpg" alt="Description" />
  <img src="/assets/images/photo-c.jpg" alt="Description" />
</div>
```

Available modifiers: `image-grid--2` (two columns), `image-grid--3` (three columns, collapses to two below 480px). Images must have meaningful `alt` text.

---

## Style Guide

A live style guide is available at `/styleguide/` on the running site. It renders every HTML element and component in the current theme, making it easy to preview how content will look and to test theme changes. Use the theme switcher in the header while viewing the style guide to see all five themes applied live.

---

## Repository Structure

```
.
├── _awards/              # Awards and recognition
├── _data/
│   └── collection-config.yml   # Grouping and icon config for collections
├── _education/           # Education and credentials
├── _experience/          # Professional experience
├── _grants/              # Research grants
├── _includes/
│   ├── components/       # Entry components (one per collection type)
│   ├── cv/               # CV section includes
│   ├── icon.html         # Icon include system
│   ├── header.html
│   ├── footer.html
│   ├── head.html
│   ├── skip-link.html    # Accessibility skip navigation
│   └── theme-switcher.html
├── _layouts/             # Page templates
├── _notes/               # Notes and essays
├── _plugins/
│   └── inline_svg.rb     # Jekyll plugin for inlining SVG icons
├── _presentations/       # Conference talks, workshops, panels
├── _projects/            # Portfolio projects
├── _publications/        # Journal articles, book chapters, interviews
├── _sass/                # Stylesheets (13 SCSS partials)
├── _service/             # Service and leadership
├── _teaching/            # Courses and teaching materials
├── assets/
│   ├── fonts/            # Atkinson Hyperlegible (woff2)
│   ├── icons/            # Lucide SVG icons
│   └── images/
│       ├── covers/       # Publication cover images (portrait ratio)
│       ├── features/     # Full-width feature/banner images
│       ├── figures/      # Inline figures referenced in content
│       ├── liw16/        # Conference photo set (Library Instruction West 2016)
│       └── projects/     # Project featured images (SVG placeholders + real images)
├── notes/                # Notes collection index page
├── presentations/        # Presentations collection index page
├── projects/             # Projects collection index page
├── publications/         # Publications collection index page
├── _config.yml           # Jekyll configuration
├── Gemfile
├── about.md
├── index.md
└── styleguide.md         # Component and theme reference
```

---

## Accessibility

Accessibility is a first-class concern, not an afterthought:

- **Typography:** Atkinson Hyperlegible typeface, designed for low-vision readers, with disambiguated characters (`1`, `l`, `I`; `0`, `O`)
- **Skip link:** Allows keyboard users to skip directly to main content
- **Focus indicators:** Visible focus ring on all interactive elements, using `--color-focus-ring`
- **Semantic HTML:** Proper heading hierarchy, `<article>`, `<nav>`, `<aside>`, `<main>` elements throughout
- **ARIA:** `aria-label` on navigation landmarks, `aria-hidden` on decorative icons
- **Color independence:** All themes maintain sufficient contrast; information is never conveyed by color alone
- **Print:** Dedicated print stylesheet for clean PDF output of the CV

---

## Notes for AI Assistants

This section summarizes key conventions to help AI tools work accurately with this codebase.

**Stack:** Jekyll 4.x, kramdown, SCSS. No JavaScript framework. Static output only.

**Content model:** Each professional item is a Markdown file with YAML front matter in its collection directory. The `sort_date` field controls ordering (ISO 8601 date string). The `category` field controls grouping on listing pages.

**Icon system:** Icons are referenced by filename (without `.svg`) via `{% include icon.html name="..." %}`. The SVG files live in `assets/icons/`. The `_plugins/inline_svg.rb` plugin inlines SVG content at build time.

**Theme system:** Five themes in `_sass/_themes.scss`, selected via `data-theme` attribute on `<html>`. All colors are CSS custom properties. No theme-specific classes elsewhere in the SCSS — use the custom properties.

**Collection configuration:** `_data/collection-config.yml` is the single source of truth for grouping behavior, category-to-icon mapping, and group display order. The listing template iterates the `categories` list in config-defined order, so YAML list position controls render order — there is no separate sort field. Adding a new category requires an entry here and a matching `category` value in the front matter. Categories with no matching items are silently skipped.

**Published filtering:** `published: false` in front matter suppresses an item site-wide. Jekyll does not auto-filter custom collection arrays in Liquid the way it does for `site.posts` — the filter is applied explicitly in every template. The pattern used throughout is `| where_exp: "item", "item.published != false"`, which correctly passes items where `published` is `true` or absent. Never access a collection array directly via `site.collection_name` in a template without this filter.

**Image field conventions:** Images appear only on individual detail pages, not on collection listing pages.
- **Notes:** `featured_image` + `featured_image_alt` — full-width hero on the note detail page
- **Presentations:** `banner` + `banner_alt` — full-width hero on the presentation detail page; `banner` is the existing field name used in presentation front matter
- **Projects:** `featured_image` + `featured_image_alt` — full-width hero on the project detail page only; project tile listings (homepage and `/projects/` page) show no image — title, subtitle, and institution only
- **Publications:** `cover_image` + `cover_image_alt` — stored in front matter but not currently rendered (publications have no detail pages by default)
- Images are always optional; entries without an image field (or with an empty value) render without any image element
- Detail page hero images use the `_alt` field as the `alt` attribute, falling back to the page title if absent

**Project detail page layout (`_layouts/project.html`):** The page renders in this order: (1) `<header>` with `title` as H1, `subtitle` as a `.collection-detail__subtitle` paragraph, and a `.collection-detail__byline` paragraph of `institution · date range` (built from available date fields); (2) `featured_image` hero; (3) `.project-meta` definition list with labeled rows — Summary (`abstract`), With (`collaborators`), My role (`role`), Core capabilities (`skill_themes` joined by " · "), Tags (`tags` joined by " · ") — any row whose field is absent is silently omitted; (4) "View Project" `.cv-action-link` button if `project_url` is set; (5) `.collection-detail__body.prose` for markdown content; (6) pager. The `.project-meta` block uses `display: block` (stacked, label above value) below `$bp-sm` (480px) and `display: grid; grid-template-columns: auto 1fr` above. The `impact` field is present in some project front matter but is not rendered anywhere in the current templates.

**Listing philosophy:** All four public-facing collections (presentations, publications, projects, notes) use the same `collection-list.html` layout. For presentations, publications, and notes, each item renders as a `collection-item` div with the relevant component include. For projects, items render as `project-tile` cards — a deliberate exception: a responsive text-forward grid (title, subtitle, institution only) instead of the cv-entry list row used by the other three collections. This projects-specific branch is established in `collection-list.html`. Per-item detail pages use collection-specific layouts (`presentation.html`, `publication.html`, `project.html`, `note.html`).

**Do not:**
- Add JavaScript dependencies for functionality achievable with static HTML/CSS
- Add new collection-specific rendering branches to `collection-list.html` without following the existing projects tile branch as a model — any collection-specific logic should be as deliberate and documented as that established exception
- Use `grep` or `find` — use the Jekyll collection system instead
- Modify `_site/` directly — it is overwritten on every build

**Safe to change:**
- Any file in `_sass/` for visual adjustments
- `_data/collection-config.yml` for grouping and icons
- `_config.yml` for site metadata and collection settings
- Any file in a collection directory (`_presentations/`, `_notes/`, etc.)
- `_includes/` components for markup changes

---

## License

Content is copyright the site owner. Theme code may be reused freely — attribution appreciated.
