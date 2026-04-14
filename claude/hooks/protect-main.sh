#!/bin/bash
# Protect main branch from accidental pushes.
# Feature branch pushes are auto-allowed.
# Main branch pushes require user confirmation (ask, not deny).

COMMAND=$(jq -r '.tool_input.command')
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)

# Check if pushing to main explicitly (git push origin main)
PUSHING_TO_MAIN=false
if echo "$COMMAND" | grep -qE 'git push.*(origin|upstream)?\s+main'; then
  PUSHING_TO_MAIN=true
fi

# Check if on main with an implicit push (git push, git push origin, git push --force-with-lease)
if [[ "$CURRENT_BRANCH" == "main" ]] && echo "$COMMAND" | grep -qE '^git push(\s+--[a-z-]+)*(\s+origin)?$'; then
  PUSHING_TO_MAIN=true
fi

if [[ "$PUSHING_TO_MAIN" == "true" ]]; then
  jq -n '{
    "hookSpecificOutput": {
      "hookEventName": "PreToolUse",
      "permissionDecision": "ask",
      "permissionDecisionReason": "Pushing to main — this is a protected branch. Confirm this is intentional (e.g. a release commit)."
    }
  }'
else
  # Allow pushes to feature branches without prompting
  jq -n '{
    "hookSpecificOutput": {
      "hookEventName": "PreToolUse",
      "permissionDecision": "allow",
      "permissionDecisionReason": "Push to feature branch auto-allowed"
    }
  }'
fi
