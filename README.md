# docker-hadoopdev
Wraps a given Hadoop codebase in a container that can be seen as a Hadoop remote node. This is basically build dependencies, plus an sshd, plus environment setup so that (1) the experiment master can communicate with the container via SSH and (2) binaries built from source are in the PATH.

===================================================
Quickstart
===================================================

To launch a node with Hadoop installed:

    docker run \
      --name remote0 \
      -d \
      --net=host \
      -v /tmp/docker/src/hadoop:/hadoop \
      --cap-add=SYS_ADMIN --privileged \
      michaelsevilla/hadoopdev

