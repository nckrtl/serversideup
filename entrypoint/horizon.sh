#!/bin/sh
stop_horizon() {
  echo "⏬ Shutting down horizon..."
  php /var/www/html/artisan horizon:terminate
  sleep 5
  exit 0
}

trap stop_horizon TERM

echo "🚀 Starting horizon..."
php /var/www/html/artisan horizon &
PID=$!
wait $PID