---
layout: styleguide
title: Style Guide
description: "A reference of every HTML element and custom component supported by this theme. Useful for checking how content will render and for testing colour schemes."
permalink: /styleguide/
---

<nav class="cv-toc" aria-label="Style guide sections">
  <p class="cv-toc__title">On this page</p>
  <ul class="cv-toc__list">
    <li><a href="#typography" class="cv-toc__link">Typography</a></li>
    <li><a href="#links" class="cv-toc__link">Links</a></li>
    <li><a href="#lists" class="cv-toc__link">Lists</a></li>
    <li><a href="#blockquotes" class="cv-toc__link">Blockquotes</a></li>
    <li><a href="#callouts" class="cv-toc__link">Callouts</a></li>
    <li><a href="#icons" class="cv-toc__link">Icons</a></li>
    <li><a href="#code" class="cv-toc__link">Code</a></li>
    <li><a href="#tables" class="cv-toc__link">Tables</a></li>
    <li><a href="#horizontal-rules" class="cv-toc__link">Horizontal Rules</a></li>
    <li><a href="#images" class="cv-toc__link">Images</a></li>
    <li><a href="#image-grid" class="cv-toc__link">Image Grid</a></li>
    <li><a href="#featured-images" class="cv-toc__link">Featured Images</a></li>
    <li><a href="#project-tiles" class="cv-toc__link">Project Tiles</a></li>
    <li><a href="#project-detail" class="cv-toc__link">Project Detail Page</a></li>
    <li><a href="#buttons" class="cv-toc__link">Buttons</a></li>
    <li><a href="#badges-tags" class="cv-toc__link">Badges & Tags</a></li>
    <li><a href="#cv-components" class="cv-toc__link">CV Components</a></li>
    <li><a href="#colour-tokens" class="cv-toc__link">Colour Tokens</a></li>
  </ul>
</nav>

<div class="prose" markdown="1">

## Typography {#typography}

### Headings

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

### Heading with <small class="text-muted">muted secondary text</small>

### Body text

This is a standard paragraph. The theme uses **Atkinson Hyperlegible**, a typeface designed for maximum legibility by the Braille Institute. Body text is set at 1rem (16px) with a line-height of 1.7 for comfortable reading. The maximum prose width is 42rem (~672px) to maintain an optimal line length of roughly 60–75 characters.

This is a second paragraph showing the vertical rhythm between elements. Notice how **bold text** and *italic text* and ***bold italic text*** each render clearly. The typeface was specifically designed so that characters like `1`, `l`, `I` and `0`, `O` are unambiguous.

<small>This is small text, useful for fine print, captions, and supplementary information.</small>

<span class="text-muted">This is muted text, rendered in the theme's secondary colour.</span>

### Inline elements

This text contains **strong emphasis** and *regular emphasis* and a [hyperlink to an example page](#) and `inline code` and <mark>highlighted text</mark> and <abbr title="abbreviation">abbr</abbr> and <del>deleted text</del> and <ins>inserted text</ins> and H<sub>2</sub>O and x<sup>2</sup>.

---

## Links {#links}

- [Internal link to the CV page](/cv/)
- [External link to GitHub](https://github.com) — note the external link indicator arrow
- [Link with title attribute](# "This is the title text")
- <a href="mailto:example@example.com">Email link</a>

---

## Lists {#lists}

### Unordered list

- First item in the list
- Second item with a bit more text to show how wrapping looks when the content extends beyond a single line on smaller viewports
- Third item
  - Nested item one
  - Nested item two
    - Deeply nested item
- Fourth item

### Ordered list

1. First step in the process
2. Second step with additional context to demonstrate line wrapping behaviour across different screen widths
3. Third step
   1. Sub-step one
   2. Sub-step two
4. Fourth step

### Definition list

<dl>
  <dt>Term one</dt>
  <dd>Definition for term one, providing context and explanation.</dd>
  <dt>Term two</dt>
  <dd>Definition for term two. Definitions can be longer and may contain <a href="#">links</a> or <strong>emphasis</strong>.</dd>
  <dt>Term three</dt>
  <dd>A shorter definition.</dd>
</dl>

---

## Blockquotes {#blockquotes}

Blockquotes are for citing content from other sources.

> This is a blockquote. It is styled with a left border accent, subtle background, and italicized text. Blockquotes are commonly used in Markdown with the `>` prefix.

> Multi-paragraph blockquotes work too.
>
> This is the second paragraph within the same blockquote, separated by a blank `>` line.
>
> — Attribution line

---

## Callouts {#callouts}

Callouts highlight important information or key insights. They use larger text and optional icons to draw attention.

### Basic Callout

Use the Kramdown attribute syntax:

**Key insight:** Solution-focused approaches outperform problem-focused ones across five dimensions.
{: .callout}

Or use HTML:

<aside class="callout">
<strong>Important:</strong> This is a basic callout without an icon. It's perfect for highlighting key takeaways or important notes.
</aside>

### Callout with Icons

Add modifier classes for different callout types with icons:

<aside class="callout callout--info">
<strong>Info:</strong> This is an informational callout. Use it for helpful context or additional details.
</aside>

<aside class="callout callout--success">
<strong>Success:</strong> This indicates a positive outcome, best practice, or recommended approach.
</aside>

<aside class="callout callout--warning">
<strong>Warning:</strong> This alerts readers to potential pitfalls or things to watch out for.
</aside>

<aside class="callout callout--danger">
<strong>Danger:</strong> This warns about critical issues or things that could go seriously wrong.
</aside>

### Usage

**HTML approach (works everywhere):**
```html
<aside class="callout">
Your callout text here
</aside>

<aside class="callout callout--info">
Informational callout with icon
</aside>
```

**Kramdown approach (Jekyll only):**
```markdown
Your callout text here
{: .callout}
```

**Available modifiers:** `callout--info`, `callout--note`, `callout--success`, `callout--warning`, `callout--danger`

---

## Icons {#icons}

This site uses [Lucide Icons](https://lucide.dev/) - a beautiful, open-source icon library. Icons are loaded individually as SVG files for optimal performance and sustainability.

### Icon System Overview

**Sustainability:** Each icon is ~300-450 bytes and loaded only when used. Pages only load the icons they need, keeping the site fast and efficient.

**Design:** Clean line icons that inherit text color and scale perfectly at any size.

### Using Icons

Icons are used automatically throughout the site in various contexts:

#### Action Links (Presentations, Publications, Projects)

<div class="cv-actions">
  <a href="#" class="cv-action-link">
    {% include icon.html name="presentation" size="16" %}
    <span>Slides</span>
  </a>
  <a href="#" class="cv-action-link">
    {% include icon.html name="video" size="16" %}
    <span>Recording</span>
  </a>
  <a href="#" class="cv-action-link">
    {% include icon.html name="file-text" size="16" %}
    <span>Handout</span>
  </a>
  <a href="#" class="cv-action-link">
    {% include icon.html name="external-link" size="16" %}
    <span>Event Page</span>
  </a>
</div>

#### Metadata Icons (Tags & Categories)

Icons appear inline with metadata:

<div class="cv-entry__meta">
  <span>
    {% include icon.html name="folder" size="14" %}
    thoughts, design
  </span>
  <span>
    {% include icon.html name="tag" size="14" %}
    learning, research
  </span>
  <span>
    {% include icon.html name="calendar" size="14" %}
    February 2024
  </span>
</div>

#### Note Title Icons

Notes can have optional icons in their front matter:

```yaml
---
title: "My Brilliant Idea"
icon: "lightbulb"
---
```

Common note icons: {% include icon.html name="lightbulb" size="20" %} `lightbulb`, {% include icon.html name="book-open" size="20" %} `book-open`, {% include icon.html name="calendar" size="20" %} `calendar`

#### Callout Icons

Callouts automatically include icons based on their type:

- **Info/Note:** {% include icon.html name="info" size="20" %} Information icon
- **Success:** {% include icon.html name="circle-check" size="20" %} Check circle
- **Warning:** {% include icon.html name="triangle-alert" size="20" %} Triangle alert
- **Danger:** {% include icon.html name="circle-alert" size="20" %} Circle alert

### Available Icons

**Action & Navigation:**
{% include icon.html name="external-link" size="18" %} external-link,
{% include icon.html name="link" size="18" %} link,
{% include icon.html name="file-down" size="18" %} file-down

**Content Types:**
{% include icon.html name="file-text" size="18" %} file-text,
{% include icon.html name="video" size="18" %} video,
{% include icon.html name="presentation" size="18" %} presentation,
{% include icon.html name="book-open" size="18" %} book-open,
{% include icon.html name="clipboard-list" size="18" %} clipboard-list

**Organization:**
{% include icon.html name="folder" size="18" %} folder,
{% include icon.html name="tag" size="18" %} tag,
{% include icon.html name="calendar" size="18" %} calendar

**Callouts:**
{% include icon.html name="info" size="18" %} info,
{% include icon.html name="circle-check" size="18" %} circle-check,
{% include icon.html name="triangle-alert" size="18" %} triangle-alert,
{% include icon.html name="circle-alert" size="18" %} circle-alert

**Note Icons:**
{% include icon.html name="lightbulb" size="18" %} lightbulb

### Size Guidelines

- **14px** - Small metadata (tags, categories, dates)
- **16px** - Inline with text, action buttons
- **18px** - Larger action buttons, summary labels
- **20px** - List page titles, standalone usage
- **24px+** - Detail page headings

### Adding New Icons

1. Visit [lucide.dev/icons](https://lucide.dev/icons/)
2. Find the icon you want
3. Download the SVG file
4. Save to `assets/icons/`
5. Use with `{% raw %}{% include icon.html name="icon-name" %}{% endraw %}`

### Manual Usage

To use icons in your content:

```liquid
{% raw %}{% include icon.html name="lightbulb" %}{% endraw %}
{% raw %}{% include icon.html name="video" size="24" %}{% endraw %}
{% raw %}{% include icon.html name="external-link" class="custom-class" %}{% endraw %}
{% raw %}{% include icon.html name="info" aria-label="Important information" %}{% endraw %}
```

---

## Code {#code}

### Inline code

Use `bundle exec jekyll serve` to start the development server. The `--port` flag lets you specify a custom port like `4001`.

### Code block

```yaml
# Example front matter for a presentation
---
title: "Scaling Student Success Through Learner-Led Design"
presenters: "Worsham, D."
meeting_name: "LOEX Conference"
meeting_short_name: "LOEX"
location: "Houston, TX"
date: 2019-05-10
sort_date: 2019-05-10
abstract: |
  This presentation explores the WI+RE model
  for learner-led design.
slide_url: "https://example.com/slides"
---
```

```css
/* Example CSS showing theme custom properties */
:root {
  --color-bg: #fdfaf8;
  --color-text: #2c1810;
  --color-accent: #a47864;
  --color-link: #8b5e3c;
}
```

```html
<!-- Example HTML structure -->
<article class="cv-entry">
  <h3 class="cv-entry__title">Position Title</h3>
  <div class="cv-entry__meta">
    <span>Organization</span>
    <span class="cv-entry__date">2021 – Present</span>
  </div>
</article>
```

---

## Tables {#tables}

| Year | Award | Organization |
|------|-------|-------------|
| 2018 | Librarian of the Year | LAUC-Los Angeles |
| 2017 | Top Twenty Article | ALA-LIRT |
| 2011 | Staff Excellence Award | UW-Madison L&S |

### Wide table

| Collection | Output | Sort Field | Grouped By | Component Include |
|-----------|--------|-----------|-----------|------------------|
| `_experience` | No | `sort_date` | Organization | `experience-entry.html` |
| `_education` | No | `sort_date` | Category | `education-entry.html` |
| `_publications` | Yes | `sort_date` | — | `publication-entry.html` |
| `_presentations` | Yes | `sort_date` | — | `presentation-entry.html` |
| `_awards` | No | `sort_date` | — | `award-entry.html` |
| `_grants` | No | `sort_date` | — | `grant-entry.html` |
| `_teaching` | No | `sort_date` | Category | `teaching-entry.html` |
| `_service` | No | `sort_date` | Organization | `service-entry.html` |

---

## Horizontal Rules {#horizontal-rules}

Content above the rule.

---

Content below the rule.

---

## Images {#images}

Standard images in markdown or HTML are rendered responsively with `max-width: 100%` and a subtle border-radius.

```markdown
![Alt text describing the image](/assets/images/photo.jpg)
```

```html
<img src="/assets/images/photo.jpg" alt="Alt text describing the image" />
```

---

## Image Grid {#image-grid}

Use `.image-grid` utility classes for responsive multi-column photo layouts in note and presentation body content. Images fill their cell with `object-fit: cover`.

### Two-column grid

```html
<div class="image-grid image-grid--2">
  <img src="/assets/images/photo-a.jpg" alt="Description of photo A" />
  <img src="/assets/images/photo-b.jpg" alt="Description of photo B" />
</div>
```

</div>

<div class="image-grid image-grid--2" style="margin: 1.5rem 0;">
  <div style="background: var(--color-bg-alt); border: 1px solid var(--color-border); border-radius: 2px; height: 120px; display: flex; align-items: center; justify-content: center; color: var(--color-text-muted); font-size: 0.85rem;">Image A</div>
  <div style="background: var(--color-bg-alt); border: 1px solid var(--color-border); border-radius: 2px; height: 120px; display: flex; align-items: center; justify-content: center; color: var(--color-text-muted); font-size: 0.85rem;">Image B</div>
</div>

<div class="prose" markdown="1">

### Three-column grid

```html
<div class="image-grid image-grid--3">
  <img src="/assets/images/photo-a.jpg" alt="Description" />
  <img src="/assets/images/photo-b.jpg" alt="Description" />
  <img src="/assets/images/photo-c.jpg" alt="Description" />
</div>
```

</div>

<div class="image-grid image-grid--3" style="margin: 1.5rem 0;">
  <div style="background: var(--color-bg-alt); border: 1px solid var(--color-border); border-radius: 2px; height: 100px; display: flex; align-items: center; justify-content: center; color: var(--color-text-muted); font-size: 0.85rem;">Image A</div>
  <div style="background: var(--color-bg-alt); border: 1px solid var(--color-border); border-radius: 2px; height: 100px; display: flex; align-items: center; justify-content: center; color: var(--color-text-muted); font-size: 0.85rem;">Image B</div>
  <div style="background: var(--color-bg-alt); border: 1px solid var(--color-border); border-radius: 2px; height: 100px; display: flex; align-items: center; justify-content: center; color: var(--color-text-muted); font-size: 0.85rem;">Image C</div>
</div>

<div class="prose" markdown="1">

The three-column grid collapses to two columns below 480px. All images should have meaningful `alt` text.

---

## Featured Images {#featured-images}

Featured images appear on individual content detail pages as a full-width hero — they do not appear on collection listing pages.

### Detail page hero (`collection-detail__feature-image`)

Used on note, presentation, and project detail pages when the relevant image field is set in front matter. The image renders between the page header and the abstract/body content, full-width within the prose container, capped at 480px height with `object-fit: cover`.

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; overflow: hidden; margin: 1.5rem 0;">
  <div class="collection-detail__feature-image" style="margin: 0;">
    <div style="width: 100%; height: 200px; background: linear-gradient(135deg, var(--color-accent) 0%, var(--color-accent-dark) 100%); display: flex; align-items: center; justify-content: center; color: var(--color-bg); font-size: 0.9rem; letter-spacing: 0.05em;">Feature image — max-height 480px, object-fit: cover</div>
  </div>
</div>

<div class="prose" markdown="1">

**Front matter fields by collection:**
- Notes & Projects: `featured_image: "/assets/images/..."` + `featured_image_alt: "..."`
- Presentations: `banner: "/assets/images/..."` + `banner_alt: "..."`

The alt field falls back to the page title if absent. Images are always optional — entries without the field (or with an empty value) render without any image.

---

## Project Tiles {#project-tiles}

Project tile cards display projects on the homepage (featured projects section) and on the `/projects/` listing page. They are text-forward — no image zone. The whole card is clickable via the stretched-link technique applied to the title `<a>` element.

**Card structure:** category label (homepage only, omitted on listing page) → title (linked, stretched to full card) → subtitle → institution

</div>

<div class="project-tiles" style="margin: 1.5rem 0; max-width: none;">
  <article class="project-tile">
    <div class="project-tile__body">
      <p class="project-tile__category">Learning Design</p>
      <h3 class="project-tile__title">
        <a href="#">Example Project Title</a>
      </h3>
      <p class="project-tile__subtitle">A concise tagline or subtitle describing what this project is about and what makes it distinct.</p>
      <p class="project-tile__institution">Example University Library</p>
    </div>
  </article>
  <article class="project-tile">
    <div class="project-tile__body">
      <p class="project-tile__category">Service Design</p>
      <h3 class="project-tile__title">
        <a href="#">Another Project Example</a>
      </h3>
      <p class="project-tile__subtitle">Subtitle text showing how longer content wraps within the card body at various viewport widths.</p>
      <p class="project-tile__institution">Another Institution</p>
    </div>
  </article>
  <article class="project-tile">
    <div class="project-tile__body">
      <p class="project-tile__category">Organizational Design</p>
      <h3 class="project-tile__title">
        <a href="#">Third Project Card</a>
      </h3>
      <p class="project-tile__institution">Third Institution</p>
    </div>
  </article>
</div>

<div class="prose" markdown="1">

**Classes:**
- `.project-tiles` — CSS grid container: 1 column → 2 columns at 480px → 3 columns at 1024px, `gap: $space-6`
- `.project-tile` — bordered card with border-radius and hover shadow; `position: relative` required for the stretched link
- `.project-tile__body` — padded flex column with `gap: $space-3`
- `.project-tile__category` — uppercase accent-colored label; used on homepage tiles (ungrouped context), omitted on `/projects/` listing page tiles (the `cv-section__heading` already provides the category)
- `.project-tile__title` — bold title; the `a::after { inset: 0; position: absolute }` stretched link makes the entire card surface clickable while keeping the accessible label to the title text only
- `.project-tile__subtitle` — muted smaller text; `flex: 1` pushes the institution line to the bottom of the card
- `.project-tile__institution` — smallest muted text, pinned to card bottom with `margin-top: auto` and a top border

**Front matter fields rendered in tiles:** `title`, `subtitle`, `institution`, `category` (homepage only). Fields like `abstract`, `role`, `skill_themes`, `tags`, and `collaborators` render on the project detail page inside the `.project-meta` box. The `impact` field is defined in front matter but is not currently rendered in tiles or on detail pages.

---

## Project Detail Page {#project-detail}

The project detail page (`_layouts/project.html`) uses three components not used elsewhere: `.collection-detail__subtitle`, `.collection-detail__byline`, and `.project-meta`.

### Subtitle and Byline

The page `title` renders as H1 (`.collection-detail__title`). The `subtitle` field renders as a separate paragraph below it. The `institution` and date range render as a compact `.collection-detail__byline` beneath the subtitle.

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <h1 class="collection-detail__title" style="font-size: 1.75rem;">Example Project Title</h1>
  <p class="collection-detail__subtitle">A concise tagline that provides context for the project without repeating the title.</p>
  <p class="collection-detail__byline">Example University Library · 2020–2024</p>
</div>

<div class="prose" markdown="1">

**Classes:**
- `.collection-detail__title` — project H1; same class used on all detail pages (notes, presentations, projects)
- `.collection-detail__subtitle` — lead paragraph below H1: `clamp(1.05rem, 1rem + 0.3vw, 1.2rem)`, `font-weight: 400`, `color: var(--color-text-muted)`
- `.collection-detail__byline` — institution and date range joined by " · ": `0.85rem`, `color: var(--color-text-muted)`; built from `institution`, `start_date`/`end_date` (or `date` as fallback)

### Project Meta Box

The `.project-meta` definition list renders summary, collaborators, role, capabilities, and tags as labeled rows. It is responsive: two-column grid (label | value) on screens ≥ 480px, single-column stacked (label above value) below.

</div>

<dl class="project-meta" style="margin: 1.5rem 0;">
  <dt class="project-meta__label">Summary</dt>
  <dd class="project-meta__value">A 2–3 sentence description of the project, its goals, and its outcomes. This is the most prominent field and should stand alone as an elevator pitch for the work.</dd>
  <dt class="project-meta__label">With</dt>
  <dd class="project-meta__value">Co-designer Jane Smith and the Example Team</dd>
  <dt class="project-meta__label">My role</dt>
  <dd class="project-meta__value">Lead designer and program architect: established the service model, built the team, and embedded the work into ongoing organizational practice.</dd>
  <dt class="project-meta__label">Core capabilities</dt>
  <dd class="project-meta__value">Participatory design · Service design · Community partnership development · Organizational culture change</dd>
  <dt class="project-meta__label">Tags</dt>
  <dd class="project-meta__value">accessibility · inclusive design · service design · student employment</dd>
</dl>

<div class="prose" markdown="1">

**Classes:**
- `.project-meta` — `display: block` (stacked) below `$bp-sm` (480px); `display: grid; grid-template-columns: auto 1fr; gap: $space-2 $space-5; align-items: baseline` above; `background-color: var(--color-bg-alt)`, `padding: $space-5`, `border-radius: 4px`
- `.project-meta__label` — `0.8rem`, uppercase, `font-weight: 700`, `letter-spacing: 0.05em`, `color: var(--color-text-muted)`; `white-space: nowrap`
- `.project-meta__value` — `0.95rem`, `line-height: 1.6`; `margin-top: $space-1` on mobile (stacked gap), `margin-top: 0` on grid; `margin-left: 0` resets `<dd>` browser default indent

**Front matter → label mapping:**

| Front matter field | Label in meta box |
|---|---|
| `abstract` | Summary |
| `collaborators` | With |
| `role` | My role |
| `skill_themes` (array) | Core capabilities (joined with " · ") |
| `tags` (array) | Tags (joined with " · ") |

Any row whose field is absent or empty is silently omitted.

---

## Buttons {#buttons}

<div class="cluster" style="--cluster-gap: 0.75rem; margin-bottom: 1.5rem;">
  <a href="#" class="btn btn--primary">Primary Button</a>
  <a href="#" class="btn">Default Button</a>
</div>

---

## Badges & Tags {#badges-tags}

<div class="cluster" style="--cluster-gap: 0.5rem; margin-bottom: 1.5rem;">
  <span class="tag">Article</span>
  <span class="tag">Book Chapter</span>
  <span class="tag">Interview</span>
</div>

<div class="cluster" style="--cluster-gap: 0.5rem;">
  <span class="cv-badge">Submitted</span>
  <span class="cv-badge cv-badge--funded">Funded</span>
</div>

---

## CV Components {#cv-components}

These are the custom components used throughout the CV page and collection listings. They demonstrate how structured content renders.

### Experience Entry

</div>

<div class="cv-section" style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <div class="cv-org-group">
    <h4 class="cv-org-group__heading">
      <a href="#" class="cv-entry__org-link">Example University Library</a>
    </h4>
    <div class="cv-org-group__entries">
      <article class="cv-entry">
        <div class="cv-entry__header">
          <h5 class="cv-entry__title">Senior Designer</h5>
          <div class="cv-entry__meta">
            <span class="cv-entry__location">San Diego, CA</span>
            <span class="cv-entry__date">2021 &ndash; Present</span>
          </div>
        </div>
        <ul class="cv-entry__highlights">
          <li>Lead a team of designers creating inclusive digital experiences for a diverse academic community.</li>
          <li>Develop and maintain the institution's design system and web component library.</li>
          <li>Facilitate participatory design workshops with students, staff, and faculty stakeholders.</li>
        </ul>
      </article>
    </div>
  </div>
</div>

<div class="prose" markdown="1">

### Education Entry

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <article class="cv-entry">
    <div class="cv-entry__header">
      <h5 class="cv-entry__title">M.A. English - Teaching English to Speakers of Other Languages</h5>
      <div class="cv-entry__meta">
        <span>San Francisco State University</span>
        <span class="cv-entry__date">2002</span>
      </div>
    </div>
  </article>
</div>

<div class="prose" markdown="1">

### Publication Entry

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <article class="cv-entry">
    <div class="cv-entry__header">
      <h5 class="cv-entry__title">The WI+RE Way: A manifesto and a process for learner-led design</h5>
      <div class="cv-entry__meta">
        <span>Harper, T., Mody, N., Ravaei, K., Romero, R., & Worsham, D.</span>
        <span>Journal of New Librarianship, 5(1)</span>
        <span class="cv-entry__date">2020</span>
      </div>
    </div>
  </article>
</div>

<div class="prose" markdown="1">

### Presentation Entry

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <article class="cv-entry">
    <div class="cv-entry__header">
      <h5 class="cv-entry__title">
        <a href="#">Scaling Student Success Through Learner-Led Design</a>
      </h5>
      <div class="cv-entry__meta">
        <span>Worsham, D.</span>
        <span>LOEX</span>
        <span class="cv-entry__location">Houston, TX</span>
        <span class="cv-entry__date">May 2019</span>
      </div>
    </div>
    <div class="cv-actions">
      <a href="#" class="cv-action-link">Slides</a>
      <a href="#" class="cv-action-link">Handout</a>
      <a href="#" class="cv-action-link">Recording</a>
    </div>
  </article>
</div>

<div class="prose" markdown="1">

### Grant Entry with Status Badge

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <article class="cv-entry">
    <div class="cv-entry__header">
      <h5 class="cv-entry__title">Learning Assistants and Learner-Led Design</h5>
      <div class="cv-entry__meta">
        <span>UCLA Center for the Advancement of Teaching</span>
        <span class="cv-entry__date">2019</span>
        <span class="cv-badge cv-badge--funded">funded</span>
      </div>
    </div>
    <p class="cv-entry__body text-muted text-small">Co-authored with Shanna Shaked, Renee Romero</p>
  </article>
</div>

<div class="prose" markdown="1">

### Service Entry

</div>

<div style="border: 1px solid var(--color-border); border-radius: 4px; padding: 1.5rem; margin: 1.5rem 0;">
  <article class="cv-entry">
    <div class="cv-entry__header">
      <h5 class="cv-entry__title">WI+RE - Writing Instruction + Research Education</h5>
      <div class="cv-entry__meta">
        <span>Co-founder and Co-Lead</span>
        <span class="cv-entry__date">2015 &ndash; 2021</span>
      </div>
    </div>
  </article>
</div>

<div class="prose" markdown="1">

### CV Table of Contents

</div>

<nav class="cv-toc" aria-label="Example CV navigation" style="margin: 1.5rem 0;">
  <p class="cv-toc__title">Sections</p>
  <ul class="cv-toc__list">
    <li><a href="#" class="cv-toc__link">Experience</a></li>
    <li><a href="#" class="cv-toc__link">Education</a></li>
    <li><a href="#" class="cv-toc__link">Awards</a></li>
    <li><a href="#" class="cv-toc__link">Publications</a></li>
    <li><a href="#" class="cv-toc__link">Presentations</a></li>
    <li><a href="#" class="cv-toc__link">Teaching</a></li>
    <li><a href="#" class="cv-toc__link">Grants</a></li>
    <li><a href="#" class="cv-toc__link">Service & Leadership</a></li>
  </ul>
</nav>

<div class="prose" markdown="1">

### Action Links

</div>

<div class="cv-actions" style="margin: 1.5rem 0;">
  <a href="#" class="cv-action-link">Slides</a>
  <a href="#" class="cv-action-link">Handout</a>
  <a href="#" class="cv-action-link">Recording</a>
  <a href="#" class="cv-action-link">Event Page</a>
</div>

<div class="prose" markdown="1">

### Previous / Next Navigation

</div>

<nav class="pager" aria-label="Example pagination" style="margin: 1.5rem 0;">
  <a href="#" class="pager__link">
    <span class="pager__label">&larr; Newer</span>
    Example Previous Item Title
  </a>
  <a href="#" class="pager__link pager__link--next">
    <span class="pager__label">Older &rarr;</span>
    Example Next Item Title
  </a>
</nav>

<div class="prose" markdown="1">

---

## Colour Tokens {#colour-tokens}

Use the theme switcher in the header to preview how these tokens change across all five colour schemes.

</div>

<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); gap: 0.75rem; margin: 1.5rem 0;">
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-bg); border: 1px solid var(--color-border); border-radius: 4px;"></div>
    <small class="text-muted">--color-bg</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-bg-alt); border: 1px solid var(--color-border); border-radius: 4px;"></div>
    <small class="text-muted">--color-bg-alt</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-text); border-radius: 4px;"></div>
    <small class="text-muted">--color-text</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-text-muted); border-radius: 4px;"></div>
    <small class="text-muted">--color-text-muted</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-accent); border-radius: 4px;"></div>
    <small class="text-muted">--color-accent</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-accent-dark); border-radius: 4px;"></div>
    <small class="text-muted">--color-accent-dark</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-border); border-radius: 4px;"></div>
    <small class="text-muted">--color-border</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-link); border-radius: 4px;"></div>
    <small class="text-muted">--color-link</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-link-hover); border-radius: 4px;"></div>
    <small class="text-muted">--color-link-hover</small>
  </div>
  <div style="text-align: center;">
    <div style="width: 100%; height: 4rem; background: var(--color-focus-ring); border-radius: 4px;"></div>
    <small class="text-muted">--color-focus-ring</small>
  </div>
</div>
