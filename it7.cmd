minikube start
minikube status
________________________________________
# ����稬 metric server. 
minikube addons enable metrics-server

# �஢�ਬ, ����稫�� �� ��� ���ਪ� �ࢥ�. 
minikube addons list
###################### nginx-deployment.yaml #################
############################################################
�ਬ��塞 �������:
cd devops/it7/
kubectl apply -f nginx-deployment.yaml
# kubectl delete -f nginx-deployment.yaml
�஢�ઠ ����㯭��� �ࢨ� �१ Minikube:
minikube service nginx-service

## �஢�ઠ ��⠭����:
kubectl get pods 
kubectl get deployment
##ᮡ������ �� ���ਪ�
kubectl top nodes
kubectl top pods -A
kubectl top pods
## �஢�ઠ, �� HPA ࠧ������
kubectl get hpa

## �஢�ઠ HPA
kubectl run -it --rm load-generator --image=busybox /bin/sh
# �᫨ 㦥 ����饭
kubectl exec -it load-generator -- /bin/sh
# ����� �� ��室���� ����� ���� � ��� ��� ������� ����㧪� �� ������. �������� �� �������� -
while true; do wget -q -O- http://nginx-service; done
# ��஥� ��㣮� �ନ��� � ������ 
kubectl get hpa -w
# -w: ���� -w ����砥� "watch", � ���� ������. �� 㪠�뢠�� kubectl ᫥���� �� ��������ﬨ � ॠ�쭮� �६���. 

