#!/bin/bash

set -e

echo "Git Escape Room - Challenge Setup"
echo "Choose a challenge:"
echo "1. Selective Staging"
echo "2. Stash"
echo "3. Reflog Recovery"
read -r -p "Enter choice (1-3): " choice

case "$choice" in
  1)
    git switch challenge/staging
    git restore payment.txt checkout.txt
    printf "Payment validation: critical fix\n" > payment.txt
    printf "Checkout: stable\n" > checkout.txt
    printf "Payment logging: enabled (release candidate)\n" >> payment.txt
    printf "Checkout banner: experimental (not approved)\n" >> checkout.txt
    echo "Selective Staging is ready."
    ;;
  2)
    git switch feature/checkout
    printf "\nCheckout: unfinished discount feature\n" >> checkout.txt
    printf "\ndiscount=20\n" >> config.txt
    echo "Stash challenge is ready."
    ;;
  3)
    git switch main
    git switch -c temp-recovery
    printf "\nImportant recovery fix\n" >> payment.txt
    git add payment.txt
    git commit -m "Add important recovery fix"
    git switch main
    git branch -D temp-recovery
    echo "Reflog Recovery is ready."
    ;;
  *)
    echo "Invalid choice."
    exit 1
    ;;
esac

git status