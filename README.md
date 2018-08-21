# creator
ScadaPy Creator for:
- modbus client, 
- IEC 60870-5-104 client/server, 
- client Mercury-230 
- JSON Web server 
- Html json client 
- VK(Вконтакте) sender 
- DB archivator (Postgresql)
```
В настоящий момент актуальная версия 3.8.1
Compile on Lazarus 1.8.4
```
Программа генерирует файлы:

- modbus.py -- драйвер опроса modbus устройств;
- mclient.py -- драйвер опроса счетчиков Меркурий-230
- mercury.py -- библиотека для драйвера счетчиков Меркурий-230
- jserver.py -- json http сервер, порт 8080 
- dbserver.py -- драйвер подсистемы архивиривания, СУБД Postgresql
- jclient.html -- web клиент scada
- image.svg -- svg файл визуального отображения структуры.
- vkclient.py -- драйвер сообщений ВКонтакте
- start.sh -- bash скрипт запуска в фоне (Linux)
- stop.sh -- bash скрипт остановка фоновых процессов (Linux)
- iec104client.json -- файл настройки клиента IEC 60870-5-104
- iec104server.json -- файл настройки сервера IEC 60870-5-104
- tkrun.py -- файл визуального отображения объектов на tk_inter
```
Версия 3.8.1
Появилась возможность создавать мнемосхему объекта,
привязку сигналов, отображение в реальном времени
на базе библиотеки tk_inter.
В пакеты протокола JSON-UDP добавлены метки времени и
переменная качества связи 
```
