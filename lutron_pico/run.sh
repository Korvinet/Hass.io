echo 'Build version: 1.0.6'
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
echo "Testing api..."

curl -X GET -H "x-ha-access: $HASSIO_TOKEN" -H "Content-Type: application/json" http://hassio/homeassistant/api/

curl -X POST -H "x-ha-access: $HASSIO_TOKEN" -H "Content-Type: application/json" -d '{"device_id": 17, "button_id": 8 }' http://hassio/homeassistant/api/events/lutron_button_pressed
echo 'Starting service...'
python3 /lutron_pico.py --host $HOST --port $PORT --user $USER --pwd $PWD --apipwd $HASSIO_TOKEN