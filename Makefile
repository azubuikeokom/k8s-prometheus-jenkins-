create-namespace-role:
	kubectl create namespace monitoring
	kubectl create -f clusterRole.yml
deploy-prometheus:
	kubectl create -f config-map.yml
	kubectl create -f prometheus-deployment.yml
	kubectl create -f prometheus-service.yml
deploy-grafana:
	kubectl create -f grafana-datasource-config.yaml
	kubectl create -f grafana-deployment.yml
	kubectl create -f grafana-service.yml
expose-services:
	kubectl expose deployment prometheus-deployment --type=LoadBalancer  --name=prometheus-external-service --namespace=monitoring
	kubectl expose deployment grafana --type=LoadBalancer  --name=grafana-external-service --namespace=monitoring
delete-prometheus-deployment:
	kubectl delete deployment prometheus-deployment --namespace=monitoring
delete-grafana-deployment:
	kubectl delete deployment grafana --namespace=monitoring
delete-prometheus-service:
	kubectl delete service prometheus-service --namespace=monitoring
delete-grafana-service:
	kubectl delete service grafana --namespace=monitoring

