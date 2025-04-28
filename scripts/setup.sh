#!/bin/bash
set -e

echo "🔵 Welcome to project setup!"

# 1. Read user input
read -p "Enter your name: " user_name
read -p "Enter your email: " user_email
read -p "Enter your project name (no spaces): " project_name

# 2. Replace placeholders in pyproject.toml
echo "🔵 Updating pyproject.toml..."
sed -i "s/REPLACE_WITH_YOUR_NAME/${user_name}/g" pyproject.toml
sed -i "s/REPLACE_WITH_YOUR_EMAIL/${user_email}/g" pyproject.toml

# 3. Replace placeholders in .devcontainer/devcontainer.json
echo "🔵 Updating devcontainer.json..."
sed -i "s/REPLACE_WITH_YOUR_NAME/${project_name}/g" .devcontainer/devcontainer.json

# 4. Rename src directory
echo "🔵 Renaming src/REPLACE_WITH_YOUR_NAME to src/${project_name}..."
mv src/REPLACE_WITH_YOUR_NAME src/${project_name}

# 5. Install Poetry and dependencies
echo "🔵 Installing Poetry dependencies..."
./scripts/install.sh

# 6. Activate the virtual environment by poetry
echo "🔵 Activating the virtual environment...
source $(poetry env info --path)/bin/activate

echo "✅ Setup complete!"
