# Global Instructions

## Agent Development Workflow

When working with specialised agents (TPO, architect, developer, reviewer), follow this handoff workflow. The orchestrator (main agent) coordinates between agents — never skip steps or combine roles.

### Feature Flow

```
1. TPO creates parent story with full context
2. Architect reviews and adds technical input
3. TPO slices into unambiguous sub-issues
4. Architect briefs each slice with exact changes
5. Developer implements, commits, and pushes each slice
6. Reviewer reviews each commit on the PR
7. TPO releases on main after merge
```

### Step Details

**1. TPO Creates Story**
- Evaluates scope, defines acceptance criteria as consumer behaviours
- Creates a GitHub issue with full context — mission, API sketch, rationale

**2. Architect Reviews Story**
- Adds technical comments — design decisions, conventions, risks, reference files
- Pushes back on scope if needed

**3. TPO Slices**
- Breaks into vertical slices — each a GitHub sub-issue on the parent
- Each slice is a capability the consumer gains, not an engineering task
- Context narrows from large story to small, unambiguous deliverables

**4. Architect Briefs Each Slice**
- Reads the slice issue and relevant source files
- Produces exact before/after for each change
- Posts the brief as a comment on the slice's GitHub issue

**5. Developer Implements**
- Reads the architect's brief from the GitHub issue
- Implements changes, runs all verification (build, lint, tests)
- Adds a Changeset (`pnpm changeset` → a `.changeset/*.md` with the bump level) for user-visible changes — Changesets owns `CHANGELOG.md`; do not hand-edit it
- Commits with `Closes #<slice>` and `Refs #<parent>`
- Pushes to the feature branch / draft PR

**6. Reviewer Reviews**
- Reviews each commit on the PR — posts PR review via `gh pr review`
- Does NOT run build/lint/tests (already verified by developer)

**7. TPO Releases**
- Only after PR is merged to main
- The bump level lives in each change's Changeset (decided when written), so release is mechanical — no version decision at release time
- The Changesets **"Version Packages"** PR applies the bumps and writes each package's `CHANGELOG.md` (`pnpm changeset version`); merging it to main publishes via the release workflow (`changeset publish`). Packages publish to **GitHub Packages** (per each package's `publishConfig`), not the public npm registry. Downstream consumers (Bertie, internal tools) configure `.npmrc` to resolve `@neoma` from GHP with a `GITHUB_TOKEN`.
- No manual `package.json` version edits or `CHANGELOG` editing — Changesets owns both

### Orchestrator Responsibilities

- Coordinates handoffs between agents
- Creates feature branches and draft PRs early
- Handles release commits (version bump, tag, push to main)
- Never develop on main
- Squash merge PRs — merge message must include all `Closes #N` references

### Orchestrator Best Practices

- **Batch review feedback.** When the user or reviewer has multiple items of feedback for the developer, collect them all and send in a single developer invocation rather than multiple round-trips. Each agent invocation has significant wall-clock cost.

### Conventions

- Branch naming: `feature/<description>` — no issue numbers in branch names
- All agent output goes to GitHub issues/PRs, not just chat — this creates a public paper trail
- Each slice must leave the build green before the next begins
