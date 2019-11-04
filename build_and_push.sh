#!/bin/sh

for i in 6 7 8; do
	docker build --tag msaf1980/ansible-testing:centos_${i} centos/${i} && \
	docker push msaf1980/ansible-testing:centos_${i}
done
for i in 6 7 8; do
	docker build --tag msaf1980/ansible-testing:oraclelinux_${i} oraclelinux/${i} && \
	docker push msaf1980/ansible-testing:oraclelinux_${i}
done
for i in 29 30; do
	docker build --tag msaf1980/ansible-testing:fedora_${i} fedora/${i} && \
	docker push msaf1980/ansible-testing:fedora_${i}
done
for i in 8 9 10; do
	docker build --tag msaf1980/ansible-testing:debian_${i} debian/${i} && \
	docker push msaf1980/ansible-testing:debian_${i}
done
for i in 14.04 16.04 18.04; do
	docker build --tag msaf1980/ansible-testing:ubuntu_${i} ubuntu/${i} && \
	docker push msaf1980/ansible-testing:ubuntu_${i}
done

