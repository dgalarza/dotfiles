# Damian Galarza — Global Context

## Who I Am

Fractional CTO, AI engineering consultant, and coach with 15+ years of production software experience. I help experienced engineers and teams ship better software with AI, smarter workflows, and real-world decision-making.

## Source of truth

- YouTube production and pipeline: Notion
- Newsletter drafts and production: a private repository (do not infer or expose its path)
- Newsletter subscribers and scheduling: Buttondown
- Product marketing context: the current project or repository context, when available

Do not assume that old Obsidian paths or notes represent current business state.
Use live systems and the relevant project repository as the source of truth.

## How to work with me

I am a staff-level engineer, fractional CTO, and coach. I value precision,
evidence, and directness over reassurance.

- Lead with the answer, then the reasoning. Be concise; cut filler, hype, and praise.
- Back claims with evidence. Name sources and tradeoffs; clearly label inference or uncertainty.
- Assume technical depth. Skip introductory explanations and be specific.
- Surface risks and tradeoffs openly. Do not hide uncertainty or quietly cut corners.
- For new tools, approaches, or changes, provide evidence and a staged rollout plan.
- Structure the output and check the work before presenting it.
- Push back when I am wrong, factually and with evidence. Do not agree merely to be agreeable.

## Content Strategy

- 3 pillars: Claude Code & AI Dev (~40%), AI Agent Architecture (~30%), Production AI Engineering (~30%)
- Blog cadence: 2 posts/month, publish Monday/Tuesday
- YouTube planning and production: Notion
- Newsletter production: private repository; do not expose or infer its path
- Newsletter delivery and scheduling: Buttondown
- Distribution: Rule of Five — every piece gets 5 distribution touches before the next one ships

## Agent workflow conventions

### Linear

When working on a Linear issue, keep progress and implementation details in the
agent session unless I explicitly ask you to post them to Linear. Do not add a
comment for every action, update, discovery, or intermediate result. Only post
a Linear comment after I confirm that something should be recorded there, or
when I explicitly request a comment.

### Herdr

Use Herdr as the default interface for agent-oriented terminal actions. When I
say to spin up, create, or use a new worktree, assume I mean a Herdr worktree
unless I explicitly say otherwise. Prefer Herdr panes and agent commands for
starting or coordinating other agents when the request involves agent-oriented
terminal work.

Follow Herdr's safety requirements: verify `HERDR_ENV=1` before issuing Herdr
control commands, use the installed CLI as the authority for syntax, preserve
my focus with `--no-focus` unless asked otherwise, and use returned IDs rather
than guessing them.

## Conventions

- All written content follows the voice profile
- Use Notion for YouTube planning and production
- Blog posts live in the Hugo repo (`dgalarza.github.io`)
- Newsletter production lives in a private repository; Buttondown is the live delivery system
- Calm, direct, precise tone — no hype, no beginner framing
