#!/bin/bash

echo "🔍 Verifying documentation structure..."

# Check if all required files exist
required_files=(
  "docs/index.md"
  "docs/getting-started/installation.md"
  "docs/framework/core-concepts.md"
  "docs/framework/workflow.md"
  "docs/automation/setup.md"
  "docs/automation/git-hooks.md"
  "docs/automation/ci-cd.md"
  "docs/templates/project-starter.md"
)

missing_files=()

for file in "${required_files[@]}"; do
  if [ ! -f "$file" ]; then
    missing_files+=("$file")
  fi
done

if [ ${#missing_files[@]} -eq 0 ]; then
  echo "✅ All required documentation files exist"
else
  echo "❌ Missing files:"
  printf '%s\n' "${missing_files[@]}"
  exit 1
fi

# Check mkdocs.yml structure
if [ -f "mkdocs.yml" ]; then
  echo "✅ mkdocs.yml exists"
else
  echo "❌ mkdocs.yml missing"
  exit 1
fi

# Check for broken links in README.md
if grep -q "\[.*\](" README.md; then
  echo "✅ README.md contains links (manual verification needed)"
else
  echo "⚠️  No links found in README.md"
fi

echo "🎉 Documentation structure verification complete!"
echo "📝 Note: Full mkdocs build requires Python and mkdocs-material"
echo "💡 To test locally: pip install mkdocs-material && mkdocs build"
