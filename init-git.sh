#!/usr/bin/env bash
# Usage : ./init-git.sh https://github.com/<organisation>/immo-sn.git
set -e
REMOTE="$1"
git init -b main
git add .
git commit -m "chore: initial project structure"
git remote add origin "$REMOTE"
git push -u origin main
git checkout -b develop && git push -u origin develop
for b in core-mvc qrcode-generation scanner-page mailing cron-jobs frontend-maps; do
  git checkout develop && git checkout -b feature/$b && git push -u origin feature/$b
done
git checkout develop
echo "Dépôt prêt. Pensez à protéger main et develop sur GitHub."
