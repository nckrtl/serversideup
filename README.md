# Laravel Horizon Test
Use these instructions to bring the test online.

## Pre-requisites
- Ensure Docker is installed and running
- Use the provided `spin` command to bring containers online

## Install composer dependencies
```bash
docker run --rm -v $(pwd):/var/www/html serversideup/php:8.3-cli composer install
```

## Copy .env example file over
```bash
cp .env.example .env
```

## Generate application key
```bash
bash vendor/bin/spin run php php artisan key:generate
```

## Run migrations
```bash
bash vendor/bin/spin run php php artisan migrate
```

## Bring containers up
```bash
bash vendor/bin/spin up
```