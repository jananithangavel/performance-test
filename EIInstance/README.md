Configuring EI Instance
============================

Follow these steps to configure ei instance

## Prerequisites

1. The script uses "unzip" command. Therefore please make sure it is installed.

`sudo apt install unzip`

The "install-java.sh" script will not download the Java distribution. You need to [download JDK] from Oracle.

It is required to have all Java distributions in a single directory.

For example, if you want to install Java 7, following files should be downloaded and moved to a single directory.

 - jdk-7u80-linux-x64.tar.gz
 - jdk-7u80-linux-x64-demos.tar.gz
 - UnlimitedJCEPolicyJDK7.zip

Similarly for Java 8, following are the files required

 - jdk-8u131-linux-x64.tar.gz
 - jdk-8u131-linux-x64.tar.gz
 - jce_policy-8.zip

The Java Demos and Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy files are optional.

Note: Script refer path for JDK as "software/java". Update path to JDK in script.

2. Add instance hostname in to /etc/hosts

3. Add following line in to /etc/hosts with the ip of EI server instance

`192.168.*.* netty`

4. Add the following into the ei/wso2ei-6.1.0/bin/integrator.sh under the $JVM_MEM_OPTS \
      -XX:+PrintGC \
      -XX:+PrintGCDetails \
      -XX:+PrintGCDateStamps\
      -Xloggc:"$CARBON_HOME/repository/logs/gc.log"\
      
5. Edit configure_instance.sh line 4 the variable product as your use 

   For example if you want to use esb then
 
   product="wso2esb-5.0.0"
   
6. EI pack should be downloaded and update path to pack in script.

Note: Script refer path as "~/software/"
      

## Run Scripts

1. Move all files in this folder in to home location of instance. 

2. Run configure_instance.sh
