docker exec -it iottlydocker_mqttbroker_1 mosquitto_passwd -b /mosquitto/config/passwd iottlycore iottlycore
#docker exec -it iottlydocker_mqttbroker_1 mosquitto_passwd -b /mosquitto/config/passwd device01 device01
docker exec -it iottlydocker_mqttbroker_1 mosquitto_passwd -b /mosquitto/config/passwd device02 device02
docker exec -it iottlydocker_mqttbroker_1 mosquitto_passwd -b /mosquitto/config/passwd device03 device03

docker exec -it iottlydocker_mqttbroker_1 mosquitto_passwd -D /mosquitto/config/passwd iottlytest
docker exec -it iottlydocker_mqttbroker_1 mosquitto_passwd -D /mosquitto/config/passwd device01


docker exec -it iottlydocker_mqttbroker_1 kill -SIGHUP 1

