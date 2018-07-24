echo 'Starting plugin...'
HOST="$(jq --raw-output '.host' $CONFIG_PATH)"
echo "Password: $HOST"
DOMAIN="$(jq --raw-output '.subdomain' $CONFIG_PATH)"
echo "Password: $DOMAIN"
AUTH="$(jq --raw-output '.authtoken' $CONFIG_PATH)"
echo "Password: $AUTH"
echo 'Starting ngrok'
./ngrok http $HOST -subdomain=$DOMAIN -authtoken=$AUTH