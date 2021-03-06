echo 'Build version: 1.0.24'
echo 'Configuring plugin...'
CONFIG_PATH=/data/options.json
HOST="$(jq --raw-output '.host' $CONFIG_PATH)"
echo "Host: $HOST"
PORT="$(jq --raw-output '.port' $CONFIG_PATH)"
echo "Port: $PORT"
USER="$(jq --raw-output '.username' $CONFIG_PATH)"
echo "Username: $USER"
PWD="$(jq --raw-output '.password' $CONFIG_PATH)"
echo "Password: $PWD"
echo "API password: $HASSIO_TOKEN"
echo 'Starting service...'
python3 /lutron_pico.py --host $HOST --port $PORT --user $USER --pwd $PWD --apipwd $HASSIO_TOKEN