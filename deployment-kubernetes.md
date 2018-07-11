## run images in kubernetes 
kubectl run libertycore --image=mid/wlp --port=9080
### view all pods 
kubectl get pods 
## view describe pod 
kubectl describe pod openliberty-69b854dc47-sqjmv
## expose service pod deployment 
kubectl expose deployment openliberty --type=NodePort
## view all service 
kubectl get service
## describe servive 
kubectl describe service openliberty
## get url service  
minikube service --url=true openliberty
## get logs for pod 
kubectl logs openliberty-69b854dc47-sqjmv
## replicas set pods ans scalability 
kubectl scale --replicas=3 deployment/openliberty
## verify scale deployment
kubectl get deployment
