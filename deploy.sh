docker build -t aikchun/multi-client -f ./client/Dockerfile ./client
docker build -t aikchun/multi-server -f ./server/Dockerfile ./server
docker build -t aikchun/multi-worker -f ./worker/Dockerfile ./worker
docker push aikchun/multi-client
docker push aikchun/multi-server
docker push aikchun/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=aikchun/multi-server
