#!/usr/bin/env bash
set -e

# Install VCS hooks for this plugin.
# For git repositories:
#   - If no existing pre-commit hook is present, a symbolic link is created
#     from .git/hooks/pre-commit to the plugin's pre-commit script in this
#     scripts directory.
#   - If an existing pre-commit hook is found, it is backed up and a wrapper
#     hook file is created that chains both the original hook and the plugin hook.
# For TFVC repos, pre-commit hooks are not applicable.
# Run this once after cloning the repo.
#
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GIT_DIR="$(git rev-parse --git-dir 2>/dev/null || true)"

if [ -z "$GIT_DIR" ]; then
    echo "Not a git repository — skipping git hook installation."
    echo "For TFVC repos, run linting manually or integrate into your CI/CD pipeline."
    exit 0
fi

# Canonicalize GIT_DIR to an absolute path so hooks work from any subdirectory
GIT_DIR="$(cd "$GIT_DIR" && pwd)"
HOOKS_DIR="$GIT_DIR/hooks"
PLUGIN_HOOK="$SCRIPT_DIR/pre-commit"

# Ensure hooks directory exists
mkdir -p "$HOOKS_DIR"

# Check for existing pre-commit hook
if [ -e "$HOOKS_DIR/pre-commit" ]; then
    # Check if it's a symlink pointing to our plugin hook (portable, no readlink -f)
    if [ -L "$HOOKS_DIR/pre-commit" ]; then
        LINK_TARGET="$(readlink "$HOOKS_DIR/pre-commit")"
        if [ "$LINK_TARGET" = "$PLUGIN_HOOK" ]; then
            echo "Plugin pre-commit hook already installed. Nothing to do."
            exit 0
        fi
    fi

    # Check if existing hook is already a chained wrapper we created
    if grep -q "# AI-native plugin chained hook" "$HOOKS_DIR/pre-commit" 2>/dev/null; then
        echo "Chained pre-commit hook already installed. Nothing to do."
        exit 0
    fi

    # Existing hook found that isn't ours — back it up and chain
    echo "Existing pre-commit hook found. Chaining both hooks."
    BACKUP_HOOK="$HOOKS_DIR/pre-commit.original"
    if [ -e "$BACKUP_HOOK" ]; then
        BACKUP_HOOK="$HOOKS_DIR/pre-commit.original.$(date +%Y%m%d%H%M%S)"
    fi
    mv "$HOOKS_DIR/pre-commit" "$BACKUP_HOOK"
    echo "  Backed up to: $BACKUP_HOOK"

    # Create a wrapper that runs both hooks
    cat > "$HOOKS_DIR/pre-commit" <<WRAPPER
#!/usr/bin/env bash
# AI-native plugin chained hook — runs the original hook first, then the plugin hook.
# Fail-fast: if the original hook fails, the plugin hook is skipped and the commit is blocked.
# Original hook backed up at: $BACKUP_HOOK

set -e

# Run original pre-commit hook
if [ -x "$BACKUP_HOOK" ]; then
    "$BACKUP_HOOK"
fi

# Run plugin pre-commit hook
if [ -x "$PLUGIN_HOOK" ]; then
    "$PLUGIN_HOOK"
fi
WRAPPER
    chmod +x "$HOOKS_DIR/pre-commit"

    echo "Git hooks installed successfully (chained)."
    echo "  pre-commit runs:"
    echo "    1. $BACKUP_HOOK (your existing hook)"
    echo "    2. $PLUGIN_HOOK (plugin hook)"
else
    # No existing hook — simple symlink
    ln -sf "$PLUGIN_HOOK" "$HOOKS_DIR/pre-commit"
    chmod +x "$HOOKS_DIR/pre-commit"

    echo "Git hooks installed successfully."
    echo "  pre-commit -> $PLUGIN_HOOK"
fi
