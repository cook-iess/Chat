#!/usr/bin/env bash

# Define installation directories
INSTALL_DIR=/opt/render/dotnet
OUTPUT_DIR=/opt/render/out
PROJECT_DIR=/opt/render/project/src/Chat  # This should be the correct path where your .csproj file is located

# Check the directory structure
echo "Listing files in project directory ($PROJECT_DIR):"
ls -R $PROJECT_DIR

# Install .NET SDK 7.0 (use the official script)
echo "Installing .NET SDK 7.0..."
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --install-dir $INSTALL_DIR --version 7.0.400

# Add .NET to PATH
export DOTNET_ROOT=$INSTALL_DIR
export PATH=$INSTALL_DIR:$PATH

# Verify .NET installation
echo "Checking .NET version..."
$INSTALL_DIR/dotnet --version

# Check if dotnet command is available
echo "Checking if 'dotnet' command is available..."
which dotnet

# Publish the .NET project (use the correct .csproj file)
echo "Publishing .NET project..."
$INSTALL_DIR/dotnet publish $PROJECT_DIR/Chat.csproj -c Release -o $OUTPUT_DIR

# List files in output directory for verification
echo "Listing files in output directory..."
ls -R $OUTPUT_DIR

# Check if the .NET installation works
echo "Checking if dotnet command works..."
which dotnet
