#!/bin/bash
VAULT_DIR="secure_vault"
mkdir -p "$VAULT_DIR"
echo "Welcome to the secure vault Keys file" > "$VAULT_DIR/keys.txt"
echo "Welcome to the secure vault Secrets file" > "$VAULT_DIR/secrets.txt"
echo "Welcome to the secure vault Logs file" > "$VAULT_DIR/logs.txt"
echo "Secure vault setup completed"
ls -l "$VAULT_DIR"
