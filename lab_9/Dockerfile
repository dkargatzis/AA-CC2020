FROM sequenceiq/hadoop-docker:2.7.0

RUN /usr/local/hadoop/bin/hdfs dfs -mkdir /user/test
RUN /usr/local/hadoop/bin/hdfs dfs -mkdir /user/test/input

ADD file01 file02 /home/
WORKDIR /home

RUN /usr/local/hadoop/bin/hdfs dfs -put file01 /user/test/input
RUN /usr/local/hadoop/bin/hdfs dfs -put file02 /user/test/input

CMD ["/usr/local/hadoop/bin/hadoop", "jar", "/usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.0.jar", "wordcount", "/user/test/input", "/user/test/output"]
