#!/bin/sh
################# for WINDOWS ###############
gcc -g   -g -o ./bin/iec104server iec104server.c ./parson/parson.c -I../src/inc/api -I../src/hal/inc -I../src/tls -I./parson ../build/lib60870.a -lpthread
gcc -g   -g -o ./bin/iec104client iec104client.c ./parson/parson.c -I../src/inc/api -I../src/hal/inc -I../src/tls -I./parson ../build/lib60870.a -lpthread
#gcc -g   -g -o ./bin/term104.exe iec104clientTerm.c ./parson/parson.c -I../src/inc/api -I../src/hal/inc -I../src/tls -I./parson ../build/lib60870.a -lpthread -lncurses

