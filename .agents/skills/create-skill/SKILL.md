---
name: create-skill
description: Create a new agent skill in .agents/skills. Use when the user wants to add a reusable workflow, instruction pack, or tool-specific capability for agents.
allowed-tools: Read, Write, Edit, Bash(ls:*), Bash(mkdir:*), Bash(find:*)
---

# Create New Agent Skill

Help the user create a new agent skill under `.agents/skills`.

## Process

1. Understand the reusable workflow
   - What should the skill help the agent do?
   - When should the skill be used?
   - Does it need scripts, references, templates, assets, or evals?

2. Design the skill structure
   - Use a kebab-case skill directory name.
   - Create `.agents/skills/<skill-name>/SKILL.md`.
   - Add optional supporting folders only when they are useful.

3. Write the skill
   - Include YAML frontmatter with `name` and `description`.
   - Make the description trigger-oriented, so the agent knows when to use it.
   - Keep instructions operational and specific.
   - Put bulky reference material in `references/` and link to it from `SKILL.md`.

## Skill Template

```markdown
---
name: skill-name
description: Use this skill when...
allowed-tools: Read, Write, Edit
---

# Skill Name

Briefly state what this skill enables.

## Workflow

1. First step
2. Second step
3. Third step

## Output

Describe what the agent should produce or do.
```

## Best Practices

- Keep each skill focused on one reusable capability.
- Prefer concrete workflows over broad advice.
- Store long examples, API references, or playbooks in `references/`.
- Add scripts when repeatable work is safer as executable code.
- Include evals when the skill has a quality bar that can be checked repeatedly.
