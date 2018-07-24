python3 -m pip install http.server
python3 -m http.server

echo 'Starting plugin...'
echo 'Starting testing...'
CONFIG_PATH=/data/options.json
echo "Config path: $CONFIG_PATH"
echo 'Getting variable host...'
HOST="$(jq --raw-output '.host' $CONFIG_PATH)"
echo "Host value: $HOST"