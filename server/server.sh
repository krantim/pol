#!/usr/bin/env bash

if [ "$1" == "start" ];
then
java -jar ../test/stub_service/build/libs/stub_service-1.0.jar server ../test/stub_service/stub.yml &
echo $! > stub.pid

java -jar build/libs/server-1.0.jar server pol.yml &
echo $! > server.pid

else
kill -9 $(cat stub.pid)
rm stub.pid

kill -9 $(cat server.pid)
rm server.pid
fi

#if [ "$1" == "start" ];
#then
#  echo "start"
#else
#  echo "stop"
#fi
