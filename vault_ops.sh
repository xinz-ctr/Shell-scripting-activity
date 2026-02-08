#!/bin/bash
VAUTL_DIR="secure_vault"
SECRETS="$VAULT_DIR/secrets.txt"
LOGS="$VAULT_DIR/logs.txt"
while true; do
echo
echo "SECURE VAULT MENU"
echo "1) Add secret"
echo "2) Update secret"
echo "3) Add log entry"
echo "4) Access keys"
echo "5) Exit"
read -p "Choose an option: " CHOICE
case "$CHOICE" in
1)
read -p "Enter new secret: " SECRET
echo"$SECRET" >> "$SECRETS"
echo"Secret added"
;;
2)
read -p "Enter text to replace: " OLD
read -p  "Enter new text: " NEW
if grep -q "$OLD" "$SECRETS"; then
sed -i "s/$OLD/$NEW/g" "$SECRETS"
echo "Secret updated"
else
echo "No match found"
fi
;;
3)
echo "$(date): Log entry added" >> "$LOGS"
echo "Log entry added"
;;
4)
echo"Access Denied"
;;
5)
echo "Exiting vault operations"
exit 0
;;
*)
echo "Invalid option"
;;
esac
done
