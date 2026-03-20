---
name: obsidian-vault-manager
description: This skill should be used when working with files in the Obsidian vault to ensure proper organization, naming, frontmatter, and linking according to the PARA + Zettelkasten methodology. It provides comprehensive guidance on the vault structure (151 files, 17MB), folder organization (0-Capture & Process, 1-Projects, 2-Areas, 3-Resources, 4-Archives, Knowledge Network, Daily Notes, Blog Posts), file naming conventions, frontmatter patterns for different content types (investment research, blog posts, zettelkasten notes), and workflows for processing new notes and maintaining the knowledge system.
---

# Obsidian Vault Manager

Use this skill when working with files in the Obsidian vault to ensure proper organization, naming, frontmatter, and linking according to the PARA + Zettelkasten methodology.

## Vault Overview

**Location:** `~/vault` (symlink to actual vault path on each machine)

**Total Files:** 151 markdown files, 17MB total size

**Methodology:** PARA method integrated with Zettelkasten

**Owner:** Damian Galarza - Software engineering leader, entrepreneur, CTO experience, currently building Tracewell AI

## Folder Structure (PARA + Zettelkasten)

### 0-Capture & Process/ (7 files)
**Purpose:** Universal inbox for new notes and fleeting thoughts

**When to use:**
- Quick captures that need processing later
- Fleeting thoughts from daily work
- Ideas that don't yet have a clear home
- New file default location (configured in Obsidian)

**File naming:** Descriptive, no specific format required

**Processing workflow:**
- Review weekly
- Move to appropriate PARA folder based on actionability
- Or convert to atomic note in Knowledge Network/

---

### 1-Projects/ (25 files)
**Purpose:** Time-bound endeavors with specific outcomes

**Active Projects:**
- 3D Printing
- AI
- Business Ideas
- FCDS
- Investing
- Pool

**When to use:**
- Has a deadline or completion state
- Requires multiple actions
- Specific outcome/deliverable
- Will eventually be "done"

**File naming:** `[Project Name] - [Specific Topic].md`

**Frontmatter (optional but recommended):**
```yaml
---
project: [project-name]
status: [active/on-hold/completed]
start_date: [YYYY-MM-DD]
target_date: [YYYY-MM-DD]
tags: #project/[name]
---
```

**Archive when:** Project completes → move to `4-Archives/`

---

### 2-Areas/ (28 files)
**Purpose:** Ongoing responsibilities requiring maintenance (no end date)

**Active Areas:**
- AI
- AI Prompts
- Book notes
- Family & Parenting
- Health & Fitness
- Personal Finance
- Professional Development
- Software Engineering

**When to use:**
- Ongoing responsibility (no completion state)
- Requires regular attention
- Standards to maintain
- Part of life/work identity

**File naming:** `[Area Name] - [Topic].md`

**Frontmatter (optional but recommended):**
```yaml
---
area: [area-name]
tags: #area/[name]
---
```

**Never archive:** Areas persist indefinitely (unless you exit that area of life)

---

### 3-Resources/ (3 files + subfolders)
**Purpose:** Reference materials for future use

**Subfolders:**
- **Investment Research/** - Stock/ETF analyses (66+ files)
- **Digital Asset Research/** - Crypto research
- **Agents/** - Claude agent documentation
- **AI Conversations/** - Notable AI chat logs
- **Clippings/** - Web clippings, saved articles
- **Notes/** - General reference notes
- **Social Media/** - Social media content ideas

**When to use:**
- Reference material (not actionable)
- Research and analysis
- Templates and frameworks
- Saved content for later

**File naming:** Varies by subfolder (see subfolder-specific guidelines below)

**Frontmatter:** Varies by content type

---

### Knowledge Network/ (33 files)
**Purpose:** Atomic knowledge notes using Zettelkasten methodology

**Key Principles:**
- **Atomic:** One concept per note
- **Permanent:** Well-developed ideas (not fleeting)
- **Linked:** Connected to other notes bidirectionally
- **Context-tagged:** Use `#project/`, `#area/`, `#resource/` to show where note applies

**File naming:** `YYYYMMDDHHmm [Title].md`
- Use `zk-prefixer` plugin or generate manually
- Example: `202510181430 AI Reduces Software Development Time.md`

**Frontmatter:**
```yaml
---
id: YYYYMMDDHHmm
tags: [#zettelkasten, #project/ai, #area/software-engineering]
created: YYYY-MM-DD
---
```

**Linking conventions:**
- Use `[[note name]]` wiki-links to connect ideas
- Link to PARA notes: `[[1-Projects/Investing/Portfolio Strategy]]`
- Create bidirectional links (if A links to B, consider B linking to A)

**When to create:**
- You've learned something worth remembering
- An idea connects multiple concepts
- You want to develop a thought over time
- A fleeting note becomes a permanent insight

**Workflow:**
1. Capture fleeting thought in Daily Notes or 0-Capture & Process
2. Develop into atomic note when ready
3. Create with timestamped ID using zk-prefixer
4. Add context tags linking to PARA areas/projects
5. Link to related zettelkasten notes

---

### Daily Notes/ (13 files)
**Purpose:** Daily journal entries and fleeting thoughts

**File naming:** `YYYY-MM-DD.md`
- Automatically created by Obsidian daily notes plugin
- Example: `2025-10-18.md`

**Template:** (Configured in Obsidian)
```markdown
# [Day of Week], [Month DD, YYYY]

## Captures
- Quick thoughts
- Ideas
- Tasks

## Notes
[Longer reflections]

## Gratitude
-
```

**Processing workflow:**
- Review weekly
- Extract permanent notes → Knowledge Network/
- Extract action items → Projects/
- Extract reference material → Resources/

---

### Blog Posts/ (31 files)
**Purpose:** Publication pipeline content

**File naming:** `[Title] - [YYYY-MM-DD].md` or `[Title].md`

**Frontmatter:**
```yaml
---
title: [Blog Post Title]
date: [YYYY-MM-DD]
status: [draft/review/published]
tags: [#blog, #topic1, #topic2]
published_url: [URL] # if published
---
```

**Workflow:**
- Draft → Review → Published
- Published posts may reference Knowledge Network notes

---

### Media/ & Attachments/
**Purpose:** Supporting files (images, PDFs, videos)

**File organization:**
- Images: `Media/Images/`
- PDFs: `Attachments/` or `Media/PDFs/`
- Other: Organized as needed

**Linking:** `![[filename.png]]` for images, `[[filename.pdf]]` for PDFs

---

## Frontmatter Patterns by Content Type

### Investment Research (3-Resources/Investment Research/)

**Stocks:**
```yaml
---
ticker: NVDA
company: NVIDIA Corporation
sector: Technology
industry: Semiconductors
date_analyzed: 2025-10-18
current_price: $145.78
market_cap: $3.58T
recommendation: Buy
conviction: High
---
```

**ETFs:**
```yaml
---
ticker: QQQ
fund_name: Invesco QQQ Trust Series 1
issuer: Invesco
category: Large-Cap Growth
date_analyzed: 2025-10-18
expense_ratio: 0.20%
aum: $390.54B
recommendation: Buy
conviction: High
---
```

### Blog Posts
```yaml
---
title: How AI is Changing Software Development
date: 2025-10-18
status: draft
tags: [#blog, #ai, #software-engineering]
excerpt: [Brief description]
---
```

### Knowledge Network (Zettelkasten)
```yaml
---
id: 202510181430
created: 2025-10-18
tags: [#zettelkasten, #project/ai, #area/software-engineering]
---
```

### Project Notes
```yaml
---
project: pool
status: active
tags: #project/pool
---
```

### Area Notes
```yaml
---
area: personal-finance
tags: #area/personal-finance
---
```

---

## File Naming Conventions

### General Rules
- **Use spaces, not underscores or dashes** (except for zettelkasten IDs)
- **Use Title Case** for descriptive names
- **Be specific and descriptive**

### By Folder

| Folder | Naming Pattern | Example |
|---|---|---|
| **Knowledge Network/** | `YYYYMMDDHHmm [Title].md` | `202510181430 Compound Interest Formula.md` |
| **Daily Notes/** | `YYYY-MM-DD.md` | `2025-10-18.md` |
| **Blog Posts/** | `[Title].md` | `AI and the Future of Work.md` |
| **Investment Research/** | `[TICKER] - [Name] - Analysis.md` | `QQQ - Invesco QQQ Trust - ETF Analysis.md` |
| **Projects/** | `[Project] - [Topic].md` | `Pool - Chemical Balance Guide.md` |
| **Areas/** | `[Area] - [Topic].md` | `Personal Finance - Emergency Fund Strategy.md` |
| **Resources/** | `[Descriptive Title].md` | `SaMD Regulatory Framework.md` |

---

## Linking Conventions

### Wiki-Style Links
```markdown
[[Note Name]]  # Links to note with that title
[[Folder/Note Name]]  # Links to note in specific folder
[[Note Name|Display Text]]  # Custom display text
```

### Context Tags
Use tags to show PARA context:
```markdown
#project/pool
#project/investing
#area/ai
#area/personal-finance
#area/software-engineering
#resource/investing
#zettelkasten
```

### Bidirectional Linking
- If Note A discusses concept in Note B → link A → B
- Consider also linking B → A for discoverability
- Use graph view to identify isolated notes

---

## Workflow: Processing a New Note

**Step 1: Capture**
- Create in `0-Capture & Process/` or Daily Notes
- Write freely, don't worry about structure yet

**Step 2: Determine Actionability**
- **Time-bound + outcome?** → `1-Projects/`
- **Ongoing responsibility?** → `2-Areas/`
- **Reference material?** → `3-Resources/`
- **Atomic knowledge?** → `Knowledge Network/`

**Step 3: Structure**
- Add appropriate frontmatter
- Use correct file naming convention
- Move to appropriate folder

**Step 4: Link**
- Add wiki-links to related notes
- Add context tags (`#project/`, `#area/`, etc.)
- Create backlinks if needed

**Step 5: Maintain**
- Update `INDEX.md` if in Investment Research
- Review periodically (weekly for projects/areas)
- Archive completed projects to `4-Archives/`

---

## Special Folders: Investment Research

**Location:** `3-Resources/Investment Research/`

**File Naming:**
- Stocks: `[TICKER] - [Company Name] - Investment Analysis.md`
- ETFs: `[TICKER] - [Fund Name] - ETF Analysis.md`
- Updates: `[TICKER] - [Name] - Investment Analysis - [YYYY-MM-DD].md`

**Required Frontmatter:** See "Frontmatter Patterns" above

**Always Update INDEX.md:**
After creating new investment research, add entry to:
`3-Resources/Investment Research/INDEX.md`

**Categories in INDEX.md:**
- Tech & AI
- Defense & Government Tech
- Fintech & Payments
- Energy & Utilities
- Autonomous Vehicles & Robotaxis
- Pharmaceuticals & Healthcare
- Robotics & Automation
- Space & Satellites
- ETFs

---

## Special Folders: Digital Asset Research

**Location:** `3-Resources/Digital Asset Research/`

**Similar structure to Investment Research but for crypto assets**

**Always Update INDEX.md:**
`3-Resources/Digital Asset Research/INDEX.md`

---

## Tools and Plugins

**Enabled Obsidian Plugins:**
- **Vim mode:** For navigation
- **Daily notes:** Automatic daily note creation
- **Templates:** For consistent note formatting
- **Zk-prefixer:** Generates unique timestamped IDs (YYYYMMDDHHmm format)
- **Graph view:** Visual representation of note connections
- **File auto-linking:** Automatically updates links when files are renamed/moved

**Using zk-prefixer:**
- Generates timestamp IDs for zettelkasten notes
- Format: YYYYMMDDHHmm (year, month, day, hour, minute)
- Ensures uniqueness and chronological ordering

---

## Common Operations

### Create a New Investment Analysis
1. Research completed (via agent or manual)
2. Create file in `3-Resources/Investment Research/`
3. Name: `[TICKER] - [Name] - ETF Analysis.md` or `Investment Analysis.md`
4. Add frontmatter with ticker, recommendation, conviction
5. Write structured analysis (use investment-research-writer skill)
6. Update `3-Resources/Investment Research/INDEX.md`
7. Add to appropriate category section

### Create a Zettelkasten Note
1. Identify atomic concept worth capturing
2. Generate timestamp ID (YYYYMMDDHHmm)
3. Create file: `Knowledge Network/YYYYMMDDHHmm [Title].md`
4. Add frontmatter with ID and context tags
5. Write note (one concept, well-developed)
6. Link to related zettelkasten notes
7. Link from PARA notes if relevant

### Process Daily Notes
1. Review daily note at end of day/week
2. Extract action items → Projects
3. Extract reference material → Resources
4. Extract permanent insights → Knowledge Network
5. Leave journal-style content in daily note

### Archive a Completed Project
1. Confirm project is complete
2. Move file(s) from `1-Projects/[Project]/` to `4-Archives/`
3. Update any links in other notes
4. Optionally: Extract lessons learned to Knowledge Network

---

## About the Vault Owner

**Damian Galarza:**
- Software engineering leader with 15+ years experience
- Former CTO at Buoy Software (SaMD/FDA-cleared medical devices)
- Staff Engineer at Shopify
- Building Tracewell AI (compliance platform for SaMD teams)
- Interests: AI, 3D printing, personal finance, investing
- Family: Wife Erin (DOB: 1986-08-06), Son Damian Jr (DOB: 2017-06-28)
- Mothers: Iris (DOB: 1953-10-08), Cheryl (DOB: 1954-09-02)

**Key Interests:**
- Engineering, product, and regulation intersection
- AI-powered tools
- 3D printing projects
- Personal finance and investing
- Family time and work-life balance

---

## Quick Reference Checklist

When working with any file in the vault:

- [ ] Is it in the correct PARA folder?
- [ ] Does it have appropriate frontmatter?
- [ ] Is the file name correct for that folder?
- [ ] Are context tags added (`#project/`, `#area/`)?
- [ ] Are wiki-links to related notes included?
- [ ] If in Investment Research, is INDEX.md updated?
- [ ] If zettelkasten note, does it have timestamp ID?
- [ ] If zettelkasten, is concept atomic (one idea per note)?

---

## Tips for Maintaining the Vault

1. **Review weekly**: Process 0-Capture & Process and Daily Notes
2. **Link generously**: More links = more connections = more insights
3. **Keep notes atomic**: One concept per note in Knowledge Network
4. **Use graph view**: Identify isolated notes that need linking
5. **Archive regularly**: Move completed projects to 4-Archives/
6. **Update indexes**: Keep INDEX.md files current in Resources
7. **Be consistent**: Follow naming and frontmatter conventions
8. **Context tag**: Always add PARA context tags to zettelkasten notes

---

**Remember:** The goal is to create a second brain that helps you think, not just store information. Link ideas, process captures regularly, and develop atomic notes over time.
