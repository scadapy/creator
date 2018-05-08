#!/bin/sh
echo 'Stop python scripts'
kill -9 `cat F:\scadapy\339\windows\modbus.pid`
kill -9 `cat F:\scadapy\339\windows\mclient.pid`
kill -9 `cat F:\scadapy\339\windows\jserver.pid`
kill -9 `cat F:\scadapy\339\windows\dbserver.pid`
