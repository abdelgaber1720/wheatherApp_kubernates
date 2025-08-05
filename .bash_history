[200~kind delete cluster
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP

kind delete cluster
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

mkdir -p  kubernates-lab/auth/mysql
cd kubernates-lab/auth/mysql/
vim headless-service.yaml
vim init-job.yaml
vim statefulset.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
sudo snap install kubectl
sudo apt install kubectl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] \
https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubect
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
sudo rm /etc/apt/sources.list.d/kubernetes.list
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] \
https://apt.kubernetes.io/ kubernetes main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl version --client
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo snap install kubectl --classic
kubectl version --client
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl create secret generic mysql-secret   --from-literal=root-password='secure-root-pw'   --from-literal=auth-password='my-secret-pw'   --from-literal=secret-key='xco0sr0fh4e52x03g9mv'
kubectl apply -f headless-service.yaml
kubectl apply -f statefulset.yaml # (fix the typo)
kubectl get pods
kubectl get svc
kubectl apply -f init-job.yaml
kubectl get pods # ensure that the job has completed
kubectl exec -it mysql-0 -- mysql -u authuser -pmy-secret-pw
vim deployment.yaml
vim service.yaml
kubectl app -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl apply -f service.yaml 
kubectl get pod
kubectl get service
kubectl run alpine --rm -it --image=alpine -- sh
cd ..
mkdir weather
vim deployment.yaml
vim service.yaml
sudo apt-get install bash-completion -y
echo "source <(kubectl completion bash)" >> ~/.bashrc
echo "source <(kubectl completion zsh)" >> ~/.zshrc
source <(kubectl completion bash)
source ~/.bashrc
kubectl create secret generic weather/ --from-literal=apikey=f9a4363c96msh061222e058b170dp1c97jsn12aecb3de1e9
kubectl create secret generic weather --from-literal
kubectl apply -f service.yaml 
kubectl apply -f deployment.yaml 
kubectl get pod
[200~kubectl run alpine --rm -it --image=alpine -- sh
kubectl run alpine --rm -it --image=alpine -- sh
apk add curl
kubectl create secret generic weather --from-literal=apikey=f9a4363c96msh061222e058b170dp1c9c07jsn12aecb3de1e9
docker pull  afakharany/weatherapp-weather:lab
kubectl run alpine --rm -it --image=alpine -- sh
sh
ls
docker  image
docker  images 
ls
mv deployment.yaml weather/
mv service.yaml weather/
ls
kubectl run alpine --rm -it --image=alpine -- sh
kubectl create secret generic weather/ --from-literal=apikey=f9a4363c96msh061222e058b170dp1c9c07jsn12aecb3de1e9
kubectl create secret generic weather --from-literal=apikey=f9a4363c96msh061222e058b170dp1c9c07jsn12aecb3de1e9
kubectl delete secret weather
kubectl create secret generic weather --from-literal=apikey=f9a4363c96msh061222e058b170dp1c9c07jsn12aecb3de1e9
kubectl delete pod -l app.kubernetes.io/name=weatherapp-weather
kubectl run alpine --rm -it --image=alpine -- sh
docker run -d --name weather-edit afakharany/weatherapp-weather:lab
docker exec -it weather-edit sh
docker cp weather-edit:/main.py ./weatherapp-fixed/main.py
docker cp weather-edit:/requirements.txt ./weatherapp-fixed/requirements.txt
docker cp weather-edit:/Dockerfile ./weatherapp-fixed/Dockerfile
mkdir -p ./weatherapp-fixed
docker cp weather-edit:/main.py ./weatherapp-fixed/main.py
docker cp weather-edit:/requirements.txt ./weatherapp-fixed/requirements.txt
docker cp weather-edit:/Dockerfile ./weatherapp-fixed/Dockerfile
docker exec -it weather-edit sh
docker cp weather-edit:/app/main.py ./weatherapp-fixed/main.py
docker cp weather-edit:/app/requirements.txt ./weatherapp-fixed/requirements.txt
docker cp weather-edit:/app/Dockerfile ./weatherapp-fixed/Dockerfile
mkdir -p ~/kubernates-lab/weatherapp-fixed
cd ~/kubernates-lab/weatherapp-fixed
docker cp weather-edit:/app/main.py ./main.py
docker cp weather-edit:/app/requirements.txt ./requirements.txt
docker cp weather-edit:/app/Dockerfile ./Dockerfile
vim main.py 
docker build -t weatherapp-fixed:latest .
docker build -t afakharany/weatherapp-weather:fixed .
ls
cd ..
ls
cd weather
vim deployment.yaml 
kubectl apply -f deployment.yaml
docker image
docker images
kubectl run alpine --rm -it --image=alpine -- sh
docker build -t afakharany/weatherapp-weather:fixed .
cd .
cd ..
cd weatherapp-fixed/
docker build -t afakharany/weatherapp-weather:fixed .
cd ..
cd weather
docker images
vim deployment.yaml 
kubectl apply -f deployment.yaml
kubectl run alpine --rm -it --image=alpine -- sh
cd ..
cd weatherapp-fixed/
vim main.py 
docker build -t weatherapp-weather:f1 .
cd ..
cd weather
docker images
vim deployment.yaml 
kubectl apply -f deployment.yaml
kubectl run alpine --rm -it --image=alpine -- sh
cd ..
cd weatherapp-fixed/
vim main.py 
docker build -t weatherapp-weather:f2 .
cd ..
cd weather
vim deployment.yaml 
kubectl apply -f deployment.yaml
kubectl run alpine --rm -it --image=alpine -- sh
cd ..
cd weatherapp-fixed/
vim main.py 
vim Dockerfile 
vim requirements.txt 
docker build -t weatherapp-weather:f3 .
cd ..
docker build -t weatherapp-weather:f3 .
cd weather
vim deployment.yaml 
kubectl apply -f deployment.yaml
docker images
docker exec -it weatherapp-weather:f3  bash
docker exec -it 3d726588c403  bash
docker exec -it 3d726588c403  sh
curl localhost:5000
curl localhost:5000/cairo
docker ps
vim deployment.yaml 
kubectl apply -f deployment.yaml
kubectl run alpine --rm -it --image=alpine -- sh
exit
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |   sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable docker
sudo systemctl start docker
docker --version
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind delete cluster
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

sudo usermod -aG docker $USER
newgrp docker
exit
ls
cd kubernates-lab/
ls
mkdir ui
cd weather
ls
vim secret.yaml
echo "NmQ5MmM1MGJkYW1zaDgxMTM3ZjNiODdhY2UxZnAxZDUzZWVqc25mZTgxOGI5ZGJjODM=" | base64 -d
kubectl apply -f secret.yaml 
cd .
cd ui
cd ..
cd ui
vim deployment.yaml
vim ingress.yaml
vim service.yaml
kubectl apply -f deployment.yaml 
kubectl apply -f ingress.yaml 
kubectl apply -f service.yaml 
openssl req -x509 -nodes -days 365 -newkey rsa: 2048 -keyout tls.key \
> -out tls.crt -subj "/CN=weatherapp.local/0=weatherapp"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=weatherapp.local/O=weatherapp"
kubectl create secret tls weatherapp-ui-tls --cert=tls.crt --key=tls.key
kubectl create secret tls weatherapp-ui-tls --cert=tls.crt --key=tls.key
kubectl apply -f service.yaml 
kubectl apply -f ingress.yaml 
kubectl apply -f deployment.yaml 
exit
ls
cd kubernates-lab/
ls
cd ui
ls
vim -out 
ls
cat tls.crt 
cat tls.key 
ls
kubectl logs weatherapp-auth-84f586cc74-bbp77
kubectl exec -it mysql-0 -- mysql -u root -p
kubectl get pod
kubectl rollout restart deployment weatherapp-auth
kubectl get pod
kubectl rollout restart deployment weatherapp-auth
kubectl exec -it mysql-0 -- mysql -u root -p
kubectl get secret mysql-secret -o jsonpath="{.data.root-password}" | base64 --decode
kubectl exec -it mysql-0 -- mysql -u root -p
kubectl rollout restart deployment weatherapp-auth
kubectl logs -l app=weatherapp-auth
kubectl get pod
ls
exit
