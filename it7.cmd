minikube start
minikube status
________________________________________
# включим metric server. 
minikube addons enable metrics-server

# проверим, включился ли наш метрикс сервер. 
minikube addons list
###################### nginx-deployment.yaml #################
############################################################
Применяем манифест:
cd devops/it7/
kubectl apply -f nginx-deployment.yaml
# kubectl delete -f nginx-deployment.yaml
Проверка доступности сервиса через Minikube:
minikube service nginx-service

## Проверка установки:
kubectl get pods 
kubectl get deployment
##собираются ли метрики
kubectl top nodes
kubectl top pods -A
kubectl top pods
## проверка, что HPA развернулся
kubectl get hpa

## Проверка HPA
kubectl run -it --rm load-generator --image=busybox /bin/sh
# Если уже запущен
kubectl exec -it load-generator -- /bin/sh
# Сейчас мы находимся внутри пода и этот под никакую нагрузку не делает. Создадим ее командой -
while true; do wget -q -O- http://nginx-service; done
# Откроем другой терминал и введем 
kubectl get hpa -w
# -w: Флаг -w означает "watch", то есть наблюдать. Он указывает kubectl следить за изменениями в реальном времени. 

