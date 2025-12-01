#!/bin/bash
set -e

echo "🚀 Weekly Planner PWA - Cloudflare Pages Deployment"
echo "=================================================="

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "📦 Installing Wrangler CLI..."
    npm install -g wrangler
fi

# Check authentication
echo ""
echo "🔐 Checking Cloudflare authentication..."
if ! wrangler whoami &> /dev/null; then
    echo "Please login to Cloudflare:"
    wrangler login
fi

echo ""
echo "📁 Deploying from current directory..."
echo "   Files: index.html, manifest.json, sw.js, icons"

# Deploy to Cloudflare Pages
wrangler pages deploy . --project-name=weekly-planner --branch=main

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📱 To install as PWA:"
echo "   1. Visit your deployed URL in Chrome/Edge"
echo "   2. Click the install icon in the address bar"
echo "   3. Or: Menu → 'Install Weekly Planner'"
echo ""
echo "🌐 Custom Domain Setup (optional):"
echo "   Run: wrangler pages project list"
echo "   Then add domain in Cloudflare Dashboard → Pages → weekly-planner → Custom domains"
echo ""
echo "   Suggested domain: planner.organizedai.vip"
