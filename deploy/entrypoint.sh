#!/bin/bash
set -x
set -e

# Setup some configurations
HADOOP_PREFIX="/usr/local/hadoop"
NAMENODES=$($HADOOP_PREFIX/bin/hdfs getconf -namenodes)
bin="$HADOOP_PREFIX/sbin"

# Start the daemon
HADOOP_DAEMON=${HADOOP_DAEMON,,}
cd $HADOOP_PREFIX
if [ "$HADOOP_DAEMON" == "namenode" ] || [ "$HADOOP_DAEMON" == "datanode" ]; then
  bin/hadoop \
    --config "$HADOOP_CONF_DIR" \
    $HADOOP_DAEMON $nameStartOpt
elif [ "$HADOOP_DAEMON" == "nodemanager" ] || [ "$HADOOP_DAEMON" == "resourcemanager" ]; then
  bin/yarn \
    --config "$HADOOP_CONF_DIR" \
    $HADOOP_DAEMON $nameStartOpt
else
  echo "=> ERROR: unknown hadoop daemon type $HADOOP_DAEMON"
  exit 1
fi
#--hostnames "$NAMENODES" \
