#!/bin/bash
# Download and install Structurizr WAR file from GitHub releases

set -euo pipefail

WAR_URL="https://github.com/structurizr/onpremises/releases/download/v2025.11.09/structurizr-onpremises.war"
WAR_DEST="/usr/share/java/structurizr/structurizr.war"

echo "Downloading Structurizr WAR file..."
curl -sL "$WAR_URL" -o /tmp/structurizr-onpremises.war

echo "Installing to $WAR_DEST..."
install -Dm644 /tmp/structurizr-onpremises.war "$WAR_DEST"
rm -f /tmp/structurizr-onpremises.war

echo "Creating Tomcat webapp symlink..."
install -d /usr/lib/tomcat10/webapps
ln -sf "$WAR_DEST" /usr/lib/tomcat10/webapps/structurizr.war

echo "Structurizr installed successfully"
