#!/bin/bash

stop_horizon() {
  echo "Stopping horizon..."
  # curl -X POST -H 'Content-type: application/json' --data '{"text":":skull: terminating horizon"}' 'https://hooks.slack.com/services/REDACTED_TOKEN'
  php /var/www/html/artisan horizon:terminate
  sleep 5
  exit 0
}

echo "Setting traps..."
trap stop_horizon QUIT

exec php /var/www/html/artisan horizon &
wait $!
