# Guide de contribution

## Branches
- `main` : version stable/déployée (protégée)
- `develop` : intégration (protégée, PR obligatoire)
- `feature/<nom>` : une branche par fonctionnalité
  (`feature/core-mvc`, `feature/qrcode-generation`, `feature/scanner-page`, `feature/mailing`, `feature/cron-jobs`, `feature/frontend-maps`)
- `hotfix/<nom>` : correction urgente

## Workflow
```bash
git checkout develop && git pull
git checkout -b feature/ma-fonctionnalite
# ... coder ...
git add . && git commit -m "feat(qr): generate QR on bien validation"
git push -u origin feature/ma-fonctionnalite
# Ouvrir une Pull Request vers develop
```

## Commits (Conventional Commits)
`feat:` `fix:` `docs:` `chore:` ; exemple : `feat(qr): generate QR on bien validation`

## Règles
- Toute feature passe par une PR vers `develop`, relue par 1 coéquipier minimum.
- Ne jamais commiter `.env` (utiliser `.env.example`).
- Max 2 cartes « En cours » par personne dans Trello.
- Ne touchez pas aux fichiers d'un autre module sans prévenir ; en cas de besoin, ouvrez une Issue.
