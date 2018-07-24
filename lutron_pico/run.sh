echo Starting lutron pico ....
python3 -m pip install requests
CONFIG_PATH=/data/options.json
HOST="$(jq --raw-output '.host' $CONFIG_PATH)"
echo "Host: $HOST"
PORT="$(jq --raw-output '.port' $CONFIG_PATH)"
echo "Port: $PORT"
python3 /lutron_pico.py --host $HOST --port $PORT