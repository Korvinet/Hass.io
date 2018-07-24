echo 'Configuring plugin...'
CONFIG_PATH=/data/options.json
HOST="$(jq --raw-output '.host' $CONFIG_PATH)"
echo "Host: $HOST"
DOMAIN="$(jq --raw-output '.subdomain' $CONFIG_PATH)"
echo "Subdomain: $DOMAIN"
AUTH="$(jq --raw-output '.authtoken' $CONFIG_PATH)"
echo "Authtoken: $AUTH"
echo 'Starting ngrok...'
./ngrok http $HOST -subdomain=$DOMAIN -authtoken=$AUTH