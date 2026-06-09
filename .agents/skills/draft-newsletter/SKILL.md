---
name: draft-newsletter
description: Draft the weekly Buttondown newsletter issue. Use this skill whenever Damian wants to write, draft, or prepare the next newsletter, weekly email, or Buttondown issue. Also use when he mentions "newsletter," "this week's email," "Wednesday email," "Buttondown draft," or anything about preparing the weekly send. This skill handles the full workflow — determining whether the issue should lead with a video or blog post, checking open-source repos for updates, gathering curated links, selecting the right CTA, and writing the draft.
---

# Draft Newsletter

Guide Damian through drafting the weekly Buttondown newsletter issue. The newsletter publishes on Wednesdays and alternates between video-led and blog-post-led weeks.

This is an interactive, multi-step process. You are a collaborator, not an autonomous writer. Gather inputs, surface relevant material, and then draft.

## Before Starting

Read these files to load context:

1. `~/vault/2-Areas/Content Creation/Creator Voice and Positioning.md` — compact creator voice and positioning (required, read every time)
2. `~/vault/2-Areas/Content Creation/Newsletter/References/Voice Profile.md` — newsletter-specific writing voice
3. `~/vault/2-Areas/Content Creation/Newsletter/References/Newsletter Charter.md` — newsletter charter, structure, template
4. `~/vault/2-Areas/Content Creation/Newsletter/References/Content Cadence.md` — the alternating video/blog rhythm
5. `~/vault/2-Areas/Content Creation/Newsletter/References/Lead Generation.md` — available lead magnets and funnels

Also read the two most recent newsletters in `~/vault/2-Areas/Content Creation/Newsletter/Published/` (sort by filename or `publish_date` in frontmatter) to calibrate tone and see what was covered last. Check `~/vault/2-Areas/Content Creation/Newsletter/Backlog.md` for curated links, quick hits, and issue candidates.

## Current Source of Truth

- Newsletter drafts, published issues, backlog, and newsletter-specific references live in `~/vault/2-Areas/Content Creation/Newsletter/`.
- Current YouTube video packages, titles, publish state, descriptions, resources, CTAs, and related child pages live in the Notion `YouTube Production OS` Videos database. Do not use the Obsidian YouTube pipeline as the source of truth for current video context.
- Blog posts, site pages, and publish-ready blog metadata live in the `dgalarza.github.io` repo. On Damian's machine this is usually `~/Code/dgalarza.github.io`; in Emma's runtime use `~/Code/emmav2/workspace/repos/dgalarza.github.io`.
- Vault notes can provide supporting context, prior thinking, and newsletter archive history, but the current video package comes from Notion and the current blog package comes from the website repo.

## Step 1: Determine the Lead Type

Check the most recent newsletter in `~/vault/2-Areas/Content Creation/Newsletter/Published/`. If it led with a YouTube video, this week should lead with a blog post (and vice versa). The alternating pattern from `~/vault/2-Areas/Content Creation/Newsletter/References/Content Cadence.md`:

| Week | Newsletter Lead | Notes |
|------|----------------|-------|
| 1 | YouTube video | Video is the headline, no blog post that week |
| 2 | Blog post | Video still publishes, gets a mention but isn't the headline |

Look at the structure of the last issue — did it open with a `## This week's video` section as the primary content, or did a blog post take the lead? Then alternate.

Tell Damian what you've determined: "Based on the last issue, this week should be **[video-led / blog-post-led]**."

Then collect the current lead material from the right source:

- **If video-led**: Search or fetch the relevant Notion `YouTube Production OS` Videos database record. Use its title, YouTube URL, description/package notes, resources, CTA, and linked child pages when available. If multiple records match or Notion access is unavailable, ask Damian for the exact Notion page or YouTube URL instead of falling back to the Obsidian YouTube pipeline.
- **If blog-post-led**: Locate the leading blog post in the `dgalarza.github.io` repo (`content/posts/`) or ask Damian for the URL/filename if it is not clear. The video still gets a mention, so fetch the current video from the Notion Videos database or ask for the exact Notion page/YouTube URL.

Confirm the lead type and the source records before drafting. If Notion and the repo disagree, treat Notion as authoritative for video details and the repo as authoritative for blog details, then surface the mismatch.

## Step 2: Check Open-Source Repos for Updates

Review recent git activity in both repos to surface anything worth mentioning:

```bash
# Check claude-code-workflows for recent activity
cd ~/Code/claude-code-workflows
git log --oneline --since="7 days ago"
git tag --sort=-creatordate | head -5

# Check agent-skills for recent activity
cd ~/Code/agent-skills
git log --oneline --since="7 days ago"
git tag --sort=-creatordate | head -5
```

If there are noteworthy changes (new releases, new plugins/skills, significant updates), summarize them for Damian. These can go in an "Open Source Updates" section or under "Quick Hits."

If nothing significant happened in the last week, that's fine — skip this section in the newsletter. Don't manufacture updates.

## Step 3: Ask About Curated Links

Use `AskUserQuestion` to ask Damian:

> Do you have any interesting links to share this week? These could be from X/Twitter, Hacker News, blog posts, tool releases, or anything relevant to the audience. Each one gets 2-4 sentences of your take on why it matters.
>
> If you have links, share them and I'll help write the context. If not, we can skip this section.

If Damian provides links, write 2-4 sentences of context for each one following the newsletter voice. These go in the "Curated Links & Tools" section. The context should explain why the link matters to the audience (developers using AI coding tools), not just describe what it is.

## Step 4: Ask About Livestream

Use `AskUserQuestion` to ask:

> Are you doing a livestream this week? If so, what's the date/time, what will you be building, and do you have the stream link?

If yes, include a "Live Stream" section. If no, skip it.

## Step 5: Select the CTA

Every issue needs a call to action. Pick one based on the week's content theme:

| Lead Magnet | Best When... | URL Segment |
|-------------|-------------|-------------|
| Codebase Readiness Assessment | Content touches codebase quality, agent workflows, team adoption | `codebase-readiness` |
| Terminal Cheat Sheet | Content is beginner-friendly or about terminal/CLI | `terminal-cheat-sheet` |
| Coaching/Services | Content shows consulting-level thinking, architecture decisions | Link to `/coaching/` or `/services/` |

The coaching/services soft CTA should **always** appear as the closing line regardless of whether another lead magnet is featured. It's a gentle sign-off, not a hard sell.

If featuring a lead magnet, weave it naturally into the relevant section (not as a separate "ad" block). Use recognizable URL segments so Buttondown automations can tag subscribers who click.

Present the CTA choice to Damian and confirm before drafting.

## Step 6: Draft the Newsletter

Write the draft following this structure. Not every section appears every week — only include what's relevant.

### Structure

1. **Lead section** — Video or blog post (whichever is the headline this week)
2. **Secondary mention** — The other one (video gets a brief mention in blog-post-led weeks, and vice versa)
3. **Livestream announcement** — Only if applicable
4. **Original commentary** — 1-2 sections of exclusive value: behind the scenes, what you're building, open source updates, deeper context
5. **Curated Links & Tools** — 1-3 items with context (only if Damian provided links)
6. **Quick Hits** — Optional 1-3 bullet items for small announcements
7. **Closing CTA** — Reply prompt + soft coaching/services link + "Damian"

### Formatting Rules

- Use `---` horizontal rules between major sections
- YouTube thumbnails use: `[![TITLE](https://img.youtube.com/vi/VIDEO_ID/maxresdefault.jpg)](https://youtu.be/VIDEO_ID)`
- Blog post links should use the full damiangalarza.com URL
- Keep to 500-1000 words total
- Sign off as "Damian" (just the name, no "Best," or "Cheers,")

### Frontmatter

```yaml
---
subject: ""
description: ""
status: draft
---
```

The **subject line** should be specific and concrete — what the reader will learn or see. Not clickbait, not vague. Look at past issues for calibration.

The **description** is the email preview text (the snippet readers see in their inbox before opening). Keep it to 1-2 sentences that tease the key topics covered in the issue. Look at the `description` field in recent newsletters for examples.

### Voice Reminders

- First person ("I built", "I found", "I've been using")
- Direct and concise — no filler
- Professional but conversational
- No hype, no fluff, no excessive enthusiasm
- Honest about what didn't work
- No em dashes — use commas, parentheses, or separate sentences

### Save Location

Save the draft to `~/vault/2-Areas/Content Creation/Newsletter/Drafts/<slug>.md` where the slug is derived from the subject line (lowercase, hyphens, no special characters).

Use the Buttondown API skill to create or update the Buttondown draft after Damian approves the local draft. After the issue is sent, update Buttondown metadata in the vault file and move it to `~/vault/2-Areas/Content Creation/Newsletter/Published/YYYY/`.

## Step 7: Review with Damian

After writing the draft, ask Damian to review it. Call out:

- The lead type and why
- Which CTA you chose and why
- Any sections you skipped and why
- Anything you weren't sure about

Be ready to revise based on feedback. The goal is a draft Damian can publish with minimal edits, not a perfect first pass.
