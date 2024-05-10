#!/bin/bash

stop_horizon() {
  echo "Stopping horizon..."
  curl -X POST -H 'Content-type: application/json' --data '{"text":":skull: terminating horizon"}' 'https://hooks.slack.com/services/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'
  php /var/www/html/artisan horizon:terminate
  sleep 5
  exit 0
}

echo "Setting traps..."
trap stop_horizon QUIT

exec php /var/www/html/artisan horizon &
wait $!
