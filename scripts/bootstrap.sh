#!/bin/bash
# Vibecoding Minimal Stack Bootstrap Script
# One-shot setup for new projects

set -e

echo "🚀 Setting up Vibecoding Minimal Stack..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if we're in a git repo
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}⚠️  Initializing Git repository...${NC}"
    git init
fi

# Install Node.js dependencies if package.json exists
if [ -f "package.json" ]; then
    echo -e "${BLUE}📦 Installing Node.js dependencies...${NC}"
    npm install
fi

# Install development tools
echo -e "${BLUE}🔧 Installing development tools...${NC}"

# Install lefthook (Git hooks)
if ! command -v lefthook &> /dev/null; then
    echo -e "${YELLOW}Installing lefthook...${NC}"
    if command -v brew &> /dev/null; then
        brew install lefthook
    elif command -v npm &> /dev/null; then
        npm install -g @arkweid/lefthook
    else
        echo -e "${RED}❌ Please install lefthook manually: https://github.com/evilmartians/lefthook${NC}"
        exit 1
    fi
fi

# Install commitlint globally if not present
if ! command -v commitlint &> /dev/null; then
    echo -e "${YELLOW}Installing commitlint...${NC}"
    npm install -g @commitlint/cli @commitlint/config-conventional
fi

# Install czg (commitizen) globally if not present
if ! command -v czg &> /dev/null; then
    echo -e "${YELLOW}Installing czg...${NC}"
    npm install -g czg
fi

# Install changesets if not present
if ! command -v changeset &> /dev/null; then
    echo -e "${YELLOW}Installing changesets...${NC}"
    npm install -g @changesets/cli
fi

# Install lint-staged if not present
if ! command -v lint-staged &> /dev/null; then
    echo -e "${YELLOW}Installing lint-staged...${NC}"
    npm install -g lint-staged
fi

# Setup lefthook
echo -e "${BLUE}🔗 Setting up Git hooks...${NC}"
if [ -f "lefthook.yml" ]; then
    lefthook install
    echo -e "${GREEN}✅ Lefthook hooks installed${NC}"
else
    echo -e "${YELLOW}⚠️  No lefthook.yml found, skipping hook installation${NC}"
fi

# Setup changesets
echo -e "${BLUE}📝 Setting up changesets...${NC}"
if [ -f ".changeset/config.json" ]; then
    changeset init
    echo -e "${GREEN}✅ Changesets initialized${NC}"
else
    echo -e "${YELLOW}⚠️  No .changeset/config.json found, skipping changesets setup${NC}"
fi

# Check for Spec Kit (optional)
echo -e "${BLUE}🤖 Checking for Spec Kit...${NC}"
if command -v specify &> /dev/null; then
    echo -e "${GREEN}✅ Spec Kit found${NC}"
    echo -e "${YELLOW}💡 Run 'specify init . --ai cursor' to initialize Spec Kit${NC}"
else
    echo -e "${YELLOW}💡 Install Spec Kit with: uv tool install specify-cli --from git+https://github.com/github/spec-kit.git${NC}"
fi

# Setup MkDocs if config exists
if [ -f "mkdocs.yml" ]; then
    echo -e "${BLUE}📚 Setting up MkDocs...${NC}"
    if command -v pip &> /dev/null; then
        pip install mkdocs mkdocs-material
        echo -e "${GREEN}✅ MkDocs installed${NC}"
    else
        echo -e "${YELLOW}⚠️  Python/pip not found, install MkDocs manually${NC}"
    fi
fi

# Generate AI configurations for all tools
echo -e "${BLUE}🤖 Generating AI configurations...${NC}"
if [ -f "rulesync.jsonc" ] || [ -d ".rulesync" ]; then
    npm run ai:sync
    echo -e "${GREEN}✅ AI configs generated for all tools:${NC}"
    echo -e "  ${GREEN}✓${NC} Cursor IDE (.cursor/rules/)"
    echo -e "  ${GREEN}✓${NC} Claude Code (CLAUDE.md, .claude/)"
    echo -e "  ${GREEN}✓${NC} GitHub Copilot (.github/instructions/)"
    echo -e "  ${GREEN}✓${NC} Cline (.clinerules/)"
    echo -e "  ${GREEN}✓${NC} Roo Code (.roo/rules/)"
    echo -e "  ${GREEN}✓${NC} Codex CLI (AGENTS.md, .codex/)"
    echo -e "  ${GREEN}✓${NC} Gemini (GEMINI.md, .gemini/)"
else
    echo -e "${YELLOW}⚠️  No rulesync config found, skipping AI config generation${NC}"
fi

echo -e "${GREEN}🎉 Bootstrap complete!${NC}"
echo -e "${BLUE}📋 Next steps:${NC}"
echo -e "  1. Run 'npx czg' for commit messages"
echo -e "  2. Run 'npm run docs:build' to build documentation"
echo -e "  3. Run 'npm run release' to create releases"
echo -e "  4. Edit rules in .rulesync/rules/ (source of truth)"
echo -e "  5. Run 'npm run ai:sync' to regenerate AI configs"
echo ""
echo -e "${BLUE}💡 AI Configuration:${NC}"
echo -e "  • Edit: ${YELLOW}.rulesync/rules/${NC} (master rules)"
echo -e "  • Sync: ${YELLOW}npm run ai:sync${NC} (regenerate all)"
echo -e "  • Help: ${YELLOW}npm run ai:help${NC} (rulesync docs)"
echo ""
echo -e "${GREEN}Happy vibecoding! 🚀${NC}"