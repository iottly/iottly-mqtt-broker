# mosquitto-auth-plug build environment

- build occurs in an ad hoc container: [Dockerfile](https://github.com/iottly/iottly-mqtt-broker/blob/mqtt/mosquitto-auth-plug/Dockerfile)
- mongoc version is kept to 1.3.1 for plugin compatibilty
- openssl version compatibility is enforced by [cache.h](https://github.com/iottly/iottly-mqtt-broker/blob/mqtt/mosquitto-auth-plug/cache.h) `#ifdef`
- to build the plugin: `./build-plugin.sh`
- the plugin is available in `bin/`