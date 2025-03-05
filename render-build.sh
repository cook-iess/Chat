#!/bin/bash

# Install .NET SDK
echo "Installing .NET SDK..."
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --install-dir $HOME/dotnet --version 7.0.400

# Add .NET to PATH
export DOTNET_ROOT=$HOME/dotnet
export PATH=$HOME/dotnet:$PATH

# Verify .NET installation
$HOME/dotnet/dotnet --version

# Publish the .NET project (make sure the path is correct)
$HOME/dotnet/dotnet publish -c Release -o $HOME/out

# List the files in the out directory for verification
ls -R $HOME/out
