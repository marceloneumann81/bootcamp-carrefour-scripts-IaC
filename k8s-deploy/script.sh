#! /bin/bash

echo "Criando as imagens..."

docker built -t marceloneumann81/projeto-k8s-backend:1.0 backend/.
docker build -t marceloneumann81/projeto-k8s-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push marceloneumann81/projeto-k8s-backend:1.0
docker push marceloneumann81/projeto-k8s-database:1.0

echo "Criando servicos no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployments.yml

