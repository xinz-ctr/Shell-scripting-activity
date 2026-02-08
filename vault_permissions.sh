#!/bin/bash
VAULT_DIR="secure_vault"
if [ ! -d "$VAULT_DIR" ]; then
echo"Secure_vault does not exist."
exit 1
fi
update_permissions() {
FILE="$1"
DEFAULT_PERM="$2"
echo
ls -l "$FILE"
read -p "Update permission for $(basename "$FILE")? (y/n): " ANSWER
if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" ]]; then
read -p "Enter new permission (or press Enter for default $DEFAULT_PERM): " NEW_PERM
NEW_PERM=${NEW_PERM:-$DEFAULT_PERM}
chmod "$NEW_PERM" "$FILE"
else
chmod "$DEFAULT_PERM" "$FILE"
fi
}
update_permissions "$VAULT_DIR/keys.txt" 600
update_permissions "$VAULT_DIR/secrets.txt" 640
update_permission "$VAULT_DIR/logs.txt" 644
echo
echo"Final Permissions: "
ls -l "$VAULT_DIR"
