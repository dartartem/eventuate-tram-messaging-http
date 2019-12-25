if [ -z "$DOCKER_HOST_IP" ] ; then
    if [ -z "$DOCKER_HOST" ] ; then
      export DOCKER_HOST_IP=`hostname`
    else
      echo using ${DOCKER_HOST?}
      XX=${DOCKER_HOST%\:*}
      export DOCKER_HOST_IP=${XX#tcp\:\/\/}
    fi
fi

echo DOCKER_HOST_IP is $DOCKER_HOST_IP


export EVENTUATE_HTTP_PROXY_ZOOKEEPER_CONNECTION_STRING=$DOCKER_HOST_IP:2181
export EVENTUATE_HTTP_PROXY_ID=PROXY1
export EVENTUATE_HTTP_PROXY_BASE_URL="http://$DOCKER_HOST_IP:8098/subscriptions"
export EVENTUATE_HTTP_CONSUMER_BASE_URL="http://$DOCKER_HOST_IP:8080/messages"
