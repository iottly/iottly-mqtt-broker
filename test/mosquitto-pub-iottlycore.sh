TOPIC=$1

MESSAGE=$2

#docker build -t mosquittoclients -f Dockerfile-clients .

docker run -it --net iottlydocker_default mosquittoclients \
 	   mosquitto_pub -h mqttbrokerbridge \
 	   -q 1 \
 	   -t $TOPIC \
 	   -m $MESSAGE \

#-r