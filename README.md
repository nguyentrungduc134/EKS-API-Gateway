# EKS-API-Gateway
Project for EKS API gateway integration

<img src="https://github.com/nguyentrungduc134/EKS-API-Gateway/assets/86754554/f3d006b3-d574-4785-aa5a-0f6b25893b96" width="800"> 


### Install Infrastructure
      cd terraform
      terraform init
      terraform apply
      aws eks update-kubeconfig --name demo --region us-east-1    
### Deploy Ingress controller  
      kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/aws/deploy.yaml
      kubectl get svc -n ingress-nginx
### Deploy metrics server
      kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
      kubectl get deployment metrics-server -n kube-system

### Deploy API Gateway: Copy files in terraform/api , input ingress dns and run  
      terraform init
      terraform apply
### Test api:

 curl https://vl01c9gt7i.execute-api.us-east-1.amazonaws.com/dev/echo    
    
    
Hostname: wapp-5597948fc-zb9xw    
    
Pod Information:    
        -no pod information available-    
    
Server values:    
        server_version=nginx: 1.14.2 - lua: 10015    
    
Request Information:    
        client_address=19.1.148.131    
        method=GET    
        real path=/dev/echo    
        query=    
        request_version=1.1    
        request_scheme=http    
        request_uri=http://vl01c9gt7i.execute-api.us-east-1.amazonaws.com:8080/dev/echo    
    
Request Headers:    
        accept=*/*    
        content-length=0    
        forwarded=for=123.16.133.126;host=vl01c9gt7i.execute-api.us-east-1.amazonaws.com;proto=https    
        host=vl01c9gt7i.execute-api.us-east-1.amazonaws.com    
        user-agent=curl/7.29.0    
        via=HTTP/1.1 AmazonAPIGateway    
        x-amzn-trace-id=Root=1-660a3384-698c896d0b97194374d1f362    
        x-forwarded-for=54.235.131.176    
        x-forwarded-host=vl01c9gt7i.execute-api.us-east-1.amazonaws.com    
        x-forwarded-port=80    
        x-forwarded-proto=http    
        x-forwarded-scheme=http    
        x-real-ip=54.235.131.176    
        x-request-id=787a010729e273f9bcad847518128475    
        x-scheme=http    
    
Request Body:    
        -no body in request-    
    



