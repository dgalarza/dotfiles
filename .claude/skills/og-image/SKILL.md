---
name: og-image
description: Provide the text content and visual spec for OG images (1200x630) on damiangalarza.com. Use when the user wants to create or update an Open Graph social sharing image. Also use when the user mentions "og image," "social image," "share image," "og-image," "Twitter card image," or "preview image." This skill defines the exact visual spec and provides the text for each tier so the user can create the image in Adobe Express or similar tools.
metadata:
  version: 1.0.0
---

# OG Image Spec

You provide the text content and visual specifications for Open Graph images (1200x630px) on damiangalarza.com. The user creates the actual PNG in Adobe Express or a similar design tool. Your job is to give them the exact text for each tier and remind them of the visual rules.

## Visual Spec

### Canvas
- **Dimensions:** 1200 x 630 pixels
- **Background:** `#0f172a` (dark navy)
- **Layout:** All text left-aligned with generous left padding (~80px). Text block vertically centered, biased slightly toward the top third.
- **No logos, photos, avatars, icons, gradients, patterns, borders, or decorative elements.** Text only on solid background.

### Three Text Tiers

#### 1. Category Label (top)
- **Color:** `#20D0BC` (teal)
- **Font:** Monospace (e.g., Courier New, SF Mono)
- **Weight:** Regular
- **Size:** Small (~18-22px)
- **Style:** UPPERCASE with wide letter-spacing
- **Optional** — omit if the page doesn't have a clear category

#### 2. Main Headline (middle)
- **Color:** `#ffffff` (white)
- **Font:** Inter or similar sans-serif
- **Weight:** Extra Bold / Black (800-900)
- **Size:** Large (~48-64px, scale down for longer text)
- **Line height:** Tight (1.1)
- **This is the dominant element.** 3-12 words, can wrap to 2-3 lines.

#### 3. Subtitle (bottom)
- **Color:** `#64748b` (muted slate gray)
- **Font:** Inter or similar sans-serif
- **Weight:** Regular
- **Size:** Medium (~22-28px)
- **Line height:** Relaxed (1.5)
- **1-3 short sentences.** Concrete deliverables or outcomes.

### Spacing
- Category to headline: ~12-16px gap
- Headline to subtitle: ~20-28px gap
- Generous bottom margin — don't crowd the bottom edge

## How to Provide the Text

When asked to create an OG image for a page:

1. Read the page's content (frontmatter + layout template)
2. Provide three text blocks ready to copy-paste:

```
CATEGORY: [category label]
HEADLINE: [main headline]
SUBTITLE: [subtitle text]
```

### Text Rules

**Category:** Use the page's eyebrow text or service type.

**Headline:**
- If the page H1 is under ~40 chars, use it directly
- If longer, write a shorter version capturing the same value prop
- Questions and direct/imperative tone both work well

**Subtitle:**
- Concrete over abstract — mention deliverables, formats, outcomes
- Can include starting price if relevant
- 1-3 short sentences, not a paragraph

## After Creation

Remind the user to:
1. Save as `static/images/og-{page-slug}.png`
2. Verify frontmatter references it:
```yaml
og_image: "images/og-{page-slug}.png"
og_image_alt: "Damian Galarza - {Page Title}"
```

## Existing OG Images (Reference)

| Page | Category | Headline | Subtitle |
|------|----------|----------|----------|
| Coaching | Coaching | Stuck? Let's work through it together. | Technical coaching for engineers and leaders. Architecture decisions, AI workflows, career transitions, team scaling. |
| AI Agents | AI Agents | You've seen what AI agents can do. Let's build one for your work. | Persistent memory, agentic architecture, autonomous workflows... |
| Services | Services | AI Consulting From Someone Still Building | Production-tested guidance for engineering teams and technical leaders. |
| Fractional CTO | Fractional CTO | Senior Technical Leadership Without the Full-Time Hire | From $6k/month. Architecture, strategy, and hiring guidance. |
| AI Enablement | AI Workflow Enablement | Get Your Engineering Team Actually Using Claude Code | A structured 3-8 week engagement... |
| Claude Code | *(none)* | Claude Code is powerful. Getting productive with it takes more than installing it. | 1:1 coaching, workflow design, and practical guidance... |
| Codebase Readiness | Free Assessment | Is Your Codebase Ready for AI Agents? | Score your repo across 8 dimensions. Get a prioritized roadmap. |
