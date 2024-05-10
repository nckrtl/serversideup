#!/bin/bash

exec php /var/www/html/artisan migrate --force

stop_horizon() {
  echo "Stopping horizon..."
  # curl -X POST -H 'Content-type: application/json' --data '{"text":":skull: terminating horizon"}' 'https://hooks.slack.com/services/REDACTED_TOKEN'
  php /var/www/html/artisan horizon:terminate
  sleep 5
  exit 0
}

echo "Setting traps..."
#QUIT is similar to the signal SIGQUIT
trap stop_horizon QUIT

# Thesse lines are needed to run the horizon worker, and make the trap work
exec php /var/www/html/artisan horizon &
wait $!
