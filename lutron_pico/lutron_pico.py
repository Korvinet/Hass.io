#!/usr/bin/env python
import telnetlib
import requests
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--host", type=str)
parser.add_argument("--port", type=int)

args = parser.parse_args()

print('starting monitor...')
connection = telnetlib.Telnet(args.host, args.port)
user = "lutron\r\n"
password = "integration\r\n"
connection.read_until(b"login:", 120)
connection.write(user.encode('ascii'))

connection.read_until(b"password:", 120)
connection.write(password.encode('ascii'))

connection.read_until(b"GNET>", 120)
print('connected...')

while True:
    received = connection.read_some()
    if received is not None:
        lines = received.decode('ascii').split('\n')
        for l in lines:
            array = l.strip().split(',')
            if len(array) >= 4 and array[0] == "~DEVICE" and array[3] == '3':
                try:
                    print('received:' + array[1] + '  -   ' + array[2])
                    r = requests.post("http://hassio/homeassistant/api/events/lutron_button_pressed?api_password=Chopan88", json={'device_id': int(array[1].strip()), 'button_id': int(array[2].strip())})
                    print(r.status_code, r.reason)
                    break
                except:
                    print('error')
