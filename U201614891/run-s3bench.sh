#!/bin/sh

# build your own test script with designated '-numClients', '-numSamples' and '-objectSize'
# 1. use loop structure to generate test batch (E.g.: to re-evaluate s3 server under the same configuration, or to gather data from a range of parameters)
# 2. use redirection for storing program output to text files

AccessKey="3U2C75LNYV73OXGG00C5"
AccessSecret="iI4aygt8qu++acmRakUhTAH0U9UgWfA1S11ZvOcc"
ObjectNamePrefix="loadgen"
filename="test.txt"

declare  -a  NumClient
declare  -a  NumSample
declare  -a  ObjectSize

#NumClient=(10   10   10   10    10    10    10     10     10     10       10)
NumClient=(100  100  100  100   100   100   100    100    100    100      100)
# NumSample=(100  100  100  100   100   100   100    100    100    100      100)
NumSample=(1000  1000  1000  1000   1000   1000   1000    1000    1000    1000      1000)
# ObjectSize=(1024 2048 4096 10240 20480 40960 102400 204800 409600 1024000 10240000 20480000 102400000)
ObjectSize=(1024 2048 4096 10240 20480 40960 102400 204800 409600 1024000 10240000)

if [ -n "$GOPATH" ]; then
    for(( i=0;i<${#NumClient[@]};i++)) 
    do  
        echo -numClients=${NumClient[i]} -numSamples=${NumSample[i]} -objectNamePrefix=$ObjectNamePrefix -objectSize=${ObjectSize[i]} >> $filename
        $GOPATH/gobin/s3bench -accessKey=$AccessKey -accessSecret=$AccessSecret -bucket=$ObjectNamePrefix -endpoint=http://127.0.0.1:9000 \
        -numClients=${NumClient[i]} -numSamples=${NumSample[i]} -objectNamePrefix=$ObjectNamePrefix -objectSize=${ObjectSize[i]}  | awk '($3=="99th" || $1=="Total" || $1=="Results" || $1 =="Number"){ print}'  >> $filename
        echo "---------------------------------------------------------------------------------------------done" >> $filename
    done
else
    ~/workplace/go/gobin/s3bench -accessKey=C3ZN23X0DEWPSA9P4LRB -accessSecret=g1TLchYaVHNVJMIK9y7RoR3u4LLDCcV+p9wcBzLt -bucket=loadgen -endpoint=http://127.0.0.1:9000 -numClients=10 -numSamples=100 -objectNamePrefix=loadgen -objectSize=1024
fi
