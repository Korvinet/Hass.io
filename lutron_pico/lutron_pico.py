#!/usr/bin/env python
import telnetlib
import requests
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--user", type=str)
parser.add_argument("--pwd", type=str)
parser.add_argument("--host", type=str)
parser.add_argument("--port", type=int)
parser.add_argument("--apipwd", type=str)

args = parser.parse_args()

print('starting monitor...')
connection = telnetlib.Telnet(args.host, args.port)
user = args.user + "\r\n"
password = args.pwd + "\r\n"
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
                    device_id=int(array[1].strip())
                    button_id=int(array[2].strip())
                    headers={"x-ha-access": str(args.apipwd), "Content-Type": "application/json"}
                    postData={"device_id":device_id,"button_id":button_id}
                    r = requests.post("http://hassio/homeassistant/api/events/lutron_button_pressed", headers=headers, json=postData)
                    print(r.status_code, r.reason)
                    break
                except:
                    print('error')
