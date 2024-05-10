#!/bin/sh

stop_horizon() {
  echo "Stopping horizon..."
  php /var/www/html/artisan horizon:terminate
  sleep 5
  exit 0
}

echo "Setting traps..."
trap stop_horizon TERM

php /var/www/html/artisan horizon &
PID=$!
wait $PID