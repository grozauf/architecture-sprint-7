#!/bin/zsh

# Создаём серты для developer пользователя
openssl genrsa -out developer.key 2048
openssl req -new -key developer.key -out developer.csr
openssl x509 -req -in developer.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out developer.crt -days 500

# kubectl config set-credentials developer --client-certificate=./developer.crt --client-key=developer.key

# Создаём серты для admin пользователя
openssl genrsa -out admin.key 2048
openssl req -new -key admin.key -out admin.csr
openssl x509 -req -in admin.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out admin.crt -days 500

# kubectl config set-credentials admin --client-certificate=./admin.crt --client-key=admin.key