#!/bin/sh
stop_horizon() {
  echo "⏬ Received signal: $1, shutting down Horizon..."
  php /var/www/html/artisan horizon:terminate
  sleep 5
  echo "🛑 Horizon service in container '$HOSTNAME' has been shutdown."
  exit 0
}

# Catch signals: INT (Ctrl+C), TERM (kill), HUP (hangup), and QUIT
trap 'stop_horizon INT' INT
trap 'stop_horizon TERM' TERM
trap 'stop_horizon HUP' HUP
trap 'stop_horizon QUIT' QUIT

echo "🚀 Starting Horizon container '$HOSTNAME'..."
php /var/www/html/artisan horizon &
PID=$!
wait $PID