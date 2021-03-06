#!/usr/bin/env bash
if test "$1" == "y"
then
cd rxjava-service/service-pay
fi

mvn clean install -Prelease

if test "$1" == "y"
then
cd ../..
fi

service_pay_tag=registry.cn-shanghai.aliyuncs.com/taro-mall/service-pay:latest

if test "$1" == "y";
then
    docker build ./rxjava-service/service-pay/target/docker-bin/ -t ${service_pay_tag}
else
    docker build ./target/docker-bin/ -t ${service_pay_tag}
fi

docker push ${service_pay_tag}