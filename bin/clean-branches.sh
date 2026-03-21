#!/usr/bin/env bash

set -euo pipefail

auto_delete=false
if [[ "${1:-}" == "--auto-delete" || "${1:-}" == "-a" ]]; then
    auto_delete=true
fi

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "error: not a git repository" >&2
    exit 1
fi

# Fetch remote state without modifying local branches
git fetch --prune --quiet

current_branch=$(git rev-parse --abbrev-ref HEAD)

delete_branch() {
    local branch="$1"
    git branch -D "$branch"
    echo "  Deleted '$branch'."
}

while IFS= read -r branch; do
    # Skip the current branch
    if [[ "$branch" == "$current_branch" ]]; then
        continue
    fi

    remote_exists=false
    tracking_remote=""

    if git rev-parse --verify "refs/remotes/origin/$branch" > /dev/null 2>&1; then
        remote_exists=true
    fi

    tracking_remote=$(git config "branch.$branch.remote" 2>/dev/null || true)

    if $remote_exists; then
        # Branch exists on remote — skip silently
        continue
    elif [[ -n "$tracking_remote" ]]; then
        # Was pushed before (tracking config present) but remote branch is gone
        echo "Branch '$branch' was pushed to '$tracking_remote' but no longer exists there."
        if $auto_delete; then
            delete_branch "$branch"
        else
            read -r -p "  Delete '$branch'? [y/N] " answer < /dev/tty
            if [[ "$answer" =~ ^[Yy]$ ]]; then
                delete_branch "$branch"
            else
                echo "  Skipped '$branch'."
            fi
        fi
    else
        # No remote, no tracking config — likely never pushed
        echo "Branch '$branch' has never been pushed to a remote."
        read -r -p "  Delete '$branch'? [y/N] " answer < /dev/tty
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            delete_branch "$branch"
        else
            echo "  Skipped '$branch'."
        fi
    fi
done < <(git branch --format='%(refname:short)')
