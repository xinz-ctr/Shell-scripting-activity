#!/bin/bash

VAULT_DIR="secure_vault"
REPORT="$VAULT_DIR/vault_report.txt"

> "$REPORT"
for FILE in "$VAULT_DIR"/*; do
PERM=$(stat -c "%a" "$FILE")
SIZE=$(stat -c "%s" "$FILE")
MODIFIED=$(stat -c "%y" "$FILE")
NAME=$(basename "$FILE")

{
echo "File: $NAME"
echo "Size: $SIZE bytes"
echo "Last Modified: $MODIFIED"
echo "Permissions: $PERM"
if [ "$PERM" -gt 644 ]; then
echo "SECURITY RISK DETECTED"
fi
echo "----------------------------"
} >> "$REPORT"
done
echo " Vault report created at $REPORT"

