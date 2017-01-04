TOPIC=$1

docker build -t mosquittoclients -f Dockerfile-clients .

docker run -it --net iottlydocker_default mosquittoclients mosquitto_sub -h mqttbroker -t $TOPIC -u device01 -P pipp