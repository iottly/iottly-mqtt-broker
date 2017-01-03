# iottly-mqtt-broker
iottly-mqtt-broker


[Mosquitto-conf](https://mosquitto.org/man/mosquitto-conf-5.html)

[Paho python](https://github.com/eclipse/paho.mqtt.python)


## Authentication

Client authentication is performed via [mosquitto-auth-plug](https://github.com/jpmens/mosquitto-auth-plug) with [mongodb](https://github.com/jpmens/mosquitto-auth-plug/blob/master/be-mongo.c) backend.

Licence for the plugin here: [mosquitto-auth-plug LICENCE](https://github.com/jpmens/mosquitto-auth-plug/blob/master/LICENSE.txt)

The plugin is built directly within the container: 
- plugin version is `0.0.9`
- mosquito version is `1.4.8`
- [Dockerfile](https://github.com/iottly/iottly-mqtt-broker/blob/mqtt/Dockerfile)
- For build instructions, see [here](https://github.com/iottly/iottly-mqtt-broker/tree/mqtt/mosquitto-auth-plug)