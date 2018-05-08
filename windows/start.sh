#!/bin/sh
echo 'Start python scripts'
nohup python3 F:\scadapy\339\windows\modbus.py 1>/dev/null 2>/dev/null &
echo $! > F:\scadapy\339\windows\modbus.pid
nohup python3 F:\scadapy\339\windows\mclient.py 1>/dev/null 2>/dev/null &
echo $! > F:\scadapy\339\windows\mclient.pid
nohup python3 F:\scadapy\339\windows\jserver.py 1>/dev/null 2>/dev/null &
echo $! > F:\scadapy\339\windows\jserver.pid
nohup python3 F:\scadapy\339\windows\dbserver.py 1>/dev/null 2>/dev/null &
echo $! > F:\scadapy\339\windows\dbserver.pid
