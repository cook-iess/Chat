#!/usr/bin/env bash

# Install .NET SDK (latest version)
echo "Installing .NET SDK..."
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --install-dir $HOME/dotnet --version 7.0.400

# Add .NET to PATH
export DOTNET_ROOT=$HOME/dotnet
export PATH=$HOME/dotnet:$PATH

# Build the .NET project
echo "Building the project..."
dotnet publish -c Release -o out
