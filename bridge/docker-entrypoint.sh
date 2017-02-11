bridgeconf="bridge.conf"


set -e

if [ "$1" = 'mosquitto' ]; then
	chmod -R o+r .

	rm $bridgeconf

	IFS=', ' read -r -a array <<< "$NODELIST"

	nodeindex=1

	for element in "${array[@]}"
	do
	    echo "$element"

		cat >> $bridgeconf <<- EOM 

		connection mosq-node-0$nodeindex
		address $element:1883
		topic /iottly/+/+/commands out
		try_private true
		remote_username $BRIDGE_REMOTE_USERNAME
		remote_password $BRIDGE_REMOTE_PASSWORD
		EOM

		nodeindex=$((nodeindex+1))

	done


	exec "$@"
fi

exec "$@"

