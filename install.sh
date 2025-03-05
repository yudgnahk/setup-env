#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew if not installed
if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
brew update

# Declare an array of tools to install
tools=(
    "gh"
    "go"
    "node"
    "python"
    "rg"
    "cloudflare-warp --cask"
    "cursor --cask"
    "datagrip --cask"
    "docker --cask"
    "goland --cask"
    "gotiengviet --cask"
    "google-chrome --cask"
    "iterm2 --cask"
    "slack --cask"
    "visual-studio-code --cask"
)

# Loop over the tools array and install each one if not already installed
for tool in "${tools[@]}"; do
    tool_name=$(echo $tool | awk '{print $1}')
    if ! command_exists $tool_name; then
        echo "Installing $tool_name..."
        brew install $tool
    else
        echo "$tool_name is already installed."
    fi
done

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Declare an array of Oh My Zsh plugins to install
plugins=(
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-syntax-highlighting"
    "zsh-users/zsh-completions"
)

# Loop over the plugins array and install each one if not already installed
for plugin in "${plugins[@]}"; do
    plugin_name=$(basename $plugin)
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin_name" ]; then
        echo "Installing $plugin_name..."
        git clone https://github.com/$plugin ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin_name
    else
        echo "$plugin_name is already installed."
    fi
done

echo "Installation and setup complete."
echo ""
echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."