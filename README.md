# ImmoSn - Plateforme Immobilière

Projet de fin de formation **Telly Tech** (Développement Web & Mobile) - Cahier des charges v1.0.

**Stack** : PHP 8.2 MVC POO · TailwindCSS · PostgreSQL/MySQL/Neon · endroid/qr-code · html5-qrcode.js · PHPMailer · FPDF · Google Maps JS API · Cron Jobs

- URL démo : _à compléter_
- Board Trello : _à compléter_

## Installation
```bash
git clone https://github.com/<organisation>/immo-sn.git
cd immo-sn
composer install
cp .env.example .env      # puis renseigner les variables
php -S localhost:8000 -t public
```
MailHog (dev) : `mailhog` -> interface sur http://localhost:8025

## Répartition des rôles
| Rôle | Responsabilités | Dossiers principaux | Membre |
|---|---|---|---|
| Chef de projet | Trello, coordination, README, présentation, rapport | `docs/`, `README.md` | |
| Architecte backend | Core MVC, Router, Database, Models principaux, CronBase | `core/`, `app/Models`, `app/Controllers`, `database/` | |
| Dev QR + Scan | endroid/qr-code, fiche PDF (FPDF), /scanner, QrGenerator | `core/QrGenerator.php`, `public/assets/js/scanner.js` | |
| Dev Mailing + Cron | PHPMailer, 10 templates HTML, 8 scripts Cron, mail_logs, cron_logs | `app/Mail`, `app/Views/emails`, `cron/` | |
| Dev Frontend + Maps | TailwindCSS, Google Maps, responsive, dashboard admin | `app/Views`, `public/assets` | |

## Structure
Voir `docs/` pour l'UML (StarUML `.mdj`), les maquettes Figma et le rapport.

## Cron (production)
```
0 1 * * *    php /var/www/immo-sn/cron/expire-biens.php
*/15 * * * * php /var/www/immo-sn/cron/send-alertes.php
0 8 * * *    php /var/www/immo-sn/cron/rappel-expiration.php
0 9 * * 1    php /var/www/immo-sn/cron/rapport-hebdo.php
0 7 1 * *    php /var/www/immo-sn/cron/rapport-admin.php
0 3 * * 0    php /var/www/immo-sn/cron/clean-uploads.php
0 4 1 * *    php /var/www/immo-sn/cron/archive-logs.php
0 23 * * *   php /var/www/immo-sn/cron/daily-stats.php
0 10 * * *   php /var/www/immo-sn/cron/inactivite.php
```
