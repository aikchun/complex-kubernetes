docker build -t aikchun/multi-client:latest -t aikchun/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t aikchun/multi-server:latest -t aikchun/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t aikchun/multi-worker:latest -t aikchun/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push aikchun/multi-client:latest
docker push aikchun/multi-server:latest
docker push aikchun/multi-worker:latest
docker push aikchun/multi-client:$SHA
docker push aikchun/multi-server:$SHA
docker push aikchun/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=aikchun/multi-server:$SHA
kubectl set image deployments/client-deployment client=aikchun/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=aikchun/multi-worker:$SHA
