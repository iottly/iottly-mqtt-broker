#!/bin/bash

set -e

if [ -n "$BRIDGECONF" ] && [ -n "$NODELIST" ]; then

	if [ "$1" = '/usr/sbin/mosquitto' ]; then

			if [ -e "$BRIDGECONF" ]; then
				rm $BRIDGECONF
			fi

			IFS=', ' read -r -a array <<< "$NODELIST"

			nodeindex=1

			for element in "${array[@]}"
			do
			    echo "Generating config to bridge with node: $element"

				cat >> $BRIDGECONF <<- EOM 

				connection mosq-node-0$nodeindex
				address $element
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

else
	echo "Cannot start bridge without bridge configuration file path and node list."
	echo "Please ensure env vars BRIDGECONF and NODELIST are defined and not empty."

	exit 1
fi

