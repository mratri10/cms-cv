#!/bin/bash

# Flutter Web CV CMS - Clean Architecture Folder Setup
# Creates Models, Views (screens/widgets), Controllers, and Themes

echo "Setting up folder structure for Clean Architecture..."

# Ensure we're in the right directory or create relative paths
mkdir -p lib/models
echo "- Created lib/models: For CV data entities and JSON serialization."

mkdir -p lib/views/screens
mkdir -p lib/views/widgets
echo "- Created lib/views/screens & lib/views/widgets: For UI components."

mkdir -p lib/controllers
echo "- Created lib/controllers: To handle business logic and state management (Providers)."

mkdir -p lib/themes
echo "- Created lib/themes: For global styling (colors, typography, and theme data)."

echo "Clean Architecture setup complete!"
