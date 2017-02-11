TOPIC=$1

MESSAGE=$2

#docker build -t mosquittoclients -f Dockerfile-clients .

docker run -it --net iottlydocker_default mosquittoclients \
 	   mosquitto_pub -h iottlydocker_mqttbrokerbridge_1 \
 	   -q 1 \
 	   -t $TOPIC \
 	   -m $MESSAGE \
 	   -u iottlycore -P pippo

#-r