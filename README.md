# rhel-OracleJDK
Create an OpenShift image with Oracle JDK

    oc new-project oracle
    oc create -f https://raw.githubusercontent.com/rbaumgar/rhel-OracleJDK/master/jdk.yaml

with the following command you will see the build

    oc get pod
    
The logfile can be streamed with

    oc log -f rhel7-oraclejdk-1-build

Check the created image

    oc get is rhel7-oraclejdk
