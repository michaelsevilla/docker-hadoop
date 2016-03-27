#!/bin/bash
set -x
set -e

# Setup some configurations
HADOOP_PREFIX="/usr/local/hadoop"
NAMENODES=$($HADOOP_PREFIX/bin/hdfs getconf -namenodes)
bin="$HADOOP_PREFIX/sbin"

HADOOP_DAEMON=${HADOOP_DAEMON,,}
if [ "$HADOOP_DAEMON" == "config" ]; then
  cp -r $HADOOP_CONF_DIR/* /etc/hadoop/
  exit 0
fi

# Start the daemon
cp -r /etc/hadoop/* $HADOOP_CONF_DIR/
cd $HADOOP_PREFIX
if [ "$HADOOP_DAEMON" == "namenode" ] || [ "$HADOOP_DAEMON" == "datanode" ]; then
  bin="bin/hadoop"
elif [ "$HADOOP_DAEMON" == "nodemanager" ] || [ "$HADOOP_DAEMON" == "resourcemanager" ]; then
  bin="bin/yarn"
else
  echo "=> ERROR: unknown hadoop daemon type $HADOOP_DAEMON"
  exit 1
fi

$bin --config "$HADOOP_CONF_DIR" $HADOOP_DAEMON $nameStartOpt
