TOPIC=$1

docker build -t mosquittoclients -f Dockerfile-clients .

docker run -it --net iottlydocker_default mosquittoclients mosquitto_sub -h mqttbroker  -i device01 -t $TOPIC -u device01 -P devicepassword