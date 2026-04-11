#!/usr/bin/env bash
# Claude Code status line — mirrors Powerlevel10k rainbow prompt style

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
display_dir=$(echo "$cwd" | sed "s|^$HOME|~|")

# Git info (skip optional lock files to avoid stalls)
git_info=""
if git -C "$cwd" rev-parse --is-inside-work-tree 2>/dev/null | grep -q true; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    if git -C "$cwd" diff --quiet 2>/dev/null && git -C "$cwd" diff --cached --quiet 2>/dev/null; then
      git_info=$' \e[32m'"$branch"$'\e[0m'
    else
      git_info=$' \e[33m'"$branch"$'\e[31m*\e[0m'
    fi

    # Diff stats (total added/removed on branch vs main)
    merge_base=$(git -C "$cwd" merge-base main "$branch" 2>/dev/null)
    diff_stat=$(git -C "$cwd" diff --numstat "$merge_base" HEAD 2>/dev/null | awk '{a+=$1; d+=$2} END {if (a+d > 0) printf "+%d -%d", a, d}')
    if [ -n "$diff_stat" ]; then
      added=$(echo "$diff_stat" | grep -o '+[0-9]*')
      removed=$(echo "$diff_stat" | grep -o '\-[0-9]*')
      git_info="${git_info}"$' \e[32m'"${added}"$'\e[0m/\e[31m'"${removed}"$'\e[0m'
    fi
  fi
fi

# Context usage
ctx_info=""
if [ -n "$used_pct" ]; then
  pct_int=$(printf '%.0f' "$used_pct")
  if [ "$pct_int" -ge 75 ]; then
    ctx_info=$' \e[31m'"ctx:${pct_int}%"$'\e[0m'
  elif [ "$pct_int" -ge 50 ]; then
    ctx_info=$' \e[33m'"ctx:${pct_int}%"$'\e[0m'
  else
    ctx_info=$' \e[32m'"ctx:${pct_int}%"$'\e[0m'
  fi
fi

echo $'\e[34m'"${display_dir}"$'\e[0m'"${git_info}"$' \e[2m'"${model}"$'\e[0m'"${ctx_info}"
