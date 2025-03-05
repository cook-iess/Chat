#!/usr/bin/env bash

# Set installation directory (we'll use /opt/render to ensure it's writable)
INSTALL_DIR=/opt/render/dotnet
OUTPUT_DIR=/opt/render/out

# Install .NET SDK 7.0
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

# Publish the .NET project (ensure the path is correct)
echo "Publishing .NET project..."
$INSTALL_DIR/dotnet publish -c Release -o $OUTPUT_DIR

# List the files in the output directory for verification
echo "Listing files in output directory..."
ls -R $OUTPUT_DIR
