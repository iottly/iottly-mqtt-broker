# mosquitto-auth-plug build environment

- keep libmongoc version to 1.3.1 for plugin compatibilty
- openssl version compatibility is enforced by [cache.h](https://github.com/iottly/iottly-mqtt-broker/blob/mqtt/mosquitto-auth-plug/cache.h) `#ifdef`
- make options are provided via `config.mk`

References:
- how to build mongoc: [http://mongoc.org/libmongoc/1.3.1/installing.html#supported-platforms](http://mongoc.org/libmongoc/1.3.1/installing.html#supported-platforms)
- how to build mosquitto: [https://github.com/jpmens/mosquitto-auth-plug#building-the-plugin](https://github.com/jpmens/mosquitto-auth-plug#building-the-plugin)
- how to build mosquitto-auth-plug: [https://github.com/jpmens/mosquitto-auth-plug#building-the-plugin](https://github.com/jpmens/mosquitto-auth-plug#building-the-plugin)