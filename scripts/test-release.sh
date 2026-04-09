#!/bin/bash

# Quick script to trigger test release workflow
# Usage: ./scripts/test-release.sh <build_number> [release_notes]

if [ $# -eq 0 ]; then
    echo "Usage: $0 <build_number> [release_notes]"
    echo "Example: $0 4 'Testing release functionality'"
    exit 1
fi

BUILD_NUMBER=$1
RELEASE_NOTES=${2:-"Testing release creation"}

echo "🚀 Triggering test release for build #$BUILD_NUMBER"
echo "📝 Release notes: $RELEASE_NOTES"

# Trigger the workflow using GitHub CLI
gh workflow run test-release.yml \
    --field build_number="$BUILD_NUMBER" \
    --field release_notes="$RELEASE_NOTES"

echo "✅ Test release workflow triggered!"
echo "🔗 Check progress at: https://github.com/$(gh repo view --json owner,name -q '.owner.login + "/" + .name')/actions"