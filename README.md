# EKS-API-Gateway
Project for EKS API gateway integration

<img src="https://github.com/nguyentrungduc134/EKS-API-Gateway/assets/86754554/f3d006b3-d574-4785-aa5a-0f6b25893b96" width="800"> 



### Deploy Ingress controller and metric servers
      kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/aws/deploy.yaml
      kubectl get svc -n ingress-nginx

      kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
      kubectl get deployment metrics-server -n kube-system


