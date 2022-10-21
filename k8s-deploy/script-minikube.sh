#! /bin/bash

echo "Criando as imagens..."

docker build --tag marneumann/projeto-k8s-backend:1.0 backend/.
docker build --tag marneumann/projeto-k8s-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push marneumann/projeto-k8s-backend:1.0
docker push marneumann/projeto-k8s-database:1.0

echo "Criando servicos no cluster kubernetes..."

kubectl apply -f ./services-minikube.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

