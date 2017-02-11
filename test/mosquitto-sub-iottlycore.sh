TOPIC=$1

docker build -t mosquittoclients -f Dockerfile-clients .

docker run -it --net iottlydocker_default mosquittoclients mosquitto_sub -h mqttbrokerbridge -t $TOPIC -u iottlycore -P pippo