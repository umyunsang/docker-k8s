apt-get update
poweroff 
clear
vi /etc/ssh/sshd_config
systemctl restart sshd
ip addr
poweroff 
mkdir dockerProj
apt-get update
apt-get install ca-certificates curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
docker info
docker version
exit
poweroff
ll
ls
cd dockerProj/
ls
docker network create wordpress_net
docker volume create dbfile
docker run -d     --name mysqldb     --network wordpress_net     --volume dbfile:/var/lib/mysql     -e MYSQL_ROOT_PASSWORD=rootpass     -e MYSQL_DATABASE=wpdb     -e MYSQL_USER=wordpress     -e MYSQL_PASSWORD=wordpress     mysql
docker run -d     --name web     --network wordpress_net     -p 8080:80     -e WORDPRESS_DB_HOST=mysqldb     -e WORDPRESS_DB_NAME=wpdb     -e WORDPRESS_DB_USER=wordpress     -e WORDPRESS_DB_PASSWORD=wordpress     wordpress
docker ps
docker rm -f web mysqldb
docker ps -a
docker run -d     --name mysqldb     --network wordpress_net     --volume dbfile:/var/lib/mysql     -e MYSQL_ROOT_PASSWORD=rootpass     -e MYSQL_DATABASE=wpdb     -e MYSQL_USER=wordpress     -e MYSQL_PASSWORD=wordpress     mysql
docker run -d     --name web     --network wordpress_net     -p 8080:80     -e WORDPRESS_DB_HOST=mysqldb     -e WORDPRESS_DB_NAME=wpdb     -e WORDPRESS_DB_USER=wordpress     -e WORDPRESS_DB_PASSWORD=wordpress     wordpress
exit
poweroff
vi  /etc/modules-load.d/k8s.conf
ls  /etc/sysctl.d/k8s.conf
vi  /etc/sysctl.d/k8s.conf
systemctl --system
apt-get update
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
kubectl --version
kubectl version
kubeadm version
systemctl enable --now kubelet
ls   /etc/docker/daemon.json
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

ls   /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker
systemctl enable docker
ls  /etc/containerd/config.toml
mv  /etc/containerd/config.toml     /tmp
ls  /etc/containerd/config.toml
vi /etc/hosts
exit
ping -c 2 node1.test.com/
kubeadm init --apiserver-advertise-address=192.168.11.10 --pod-network-cidr=10.244/16
ip addr
exit
kubeadm  init  --apiserver-advertise-address=192.168.11.10  --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
cp  -i  /etc/kubernetes/admin.conf $HOME/.kube/config
kubeadm  --help
kubeadm  init  --help
kubeadm  init  --apiserver-advertise-address=192.168.11.10  --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
cp  -i  /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf
vi   ~/.bashrc
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
source  <(kubectl  completion  bash)
vi   ~/.bashrc 
kubectl gekubssh-keygen  -t  rsa
exit
kubectl g
ssh-keygen  -t  rsa
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
ssh node1.test.com
ssh node2.test.com
ssh node3.test.com
kubectl get nodes
ssh node1.test.com poweroff
ssh node2.test.com poweroff
kubectl get nodes
kubeadm token list
kubeadm token delete l4f41p.hq
kubeadm token delete l4f41p.hq1y0x4gmgr076o6
kubeadm token create --print-join-command
kubectl get n
kubectl get nodes
ssh nod3.test.com
ssh node3.test.com
ssh node3.test.com poweroff
poweroff
hostname
swapon -s
kubectl version
kubeadm  version
kubelet   --version
ls   /etc/docker/daemon.json
ping  -c 2   node3.test.com
kubeadm  init  --apiserver-advertise-address=192.168.11.10  --pod-network-cidr=10.244.0.0/16
sudo kubeadm reset
kubeadm reset
rm -rf /etc/kubernetes/
rm -rf /var/lib/etcd/
kubeadm init --apiserver-advertise-address=192.168.11.10 --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
cp  -i  /etc/kubernetes/admin.conf $HOME/.kube/config
ls -l $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get nodes
vi   ~/.bashrc
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
source ~/.bashrc
kubectl ge
apt-get install bash-completion -y
source <(kubectl completion bash)
echo 'source <(kubectl completion bash)' >>~/.bashrc
source ~/.bashrc
kubectl ge
echo 'export PATH=$PATH:/usr/local/bin' >>~/.bashrc
source ~/.bashrc
restart bash
rstart bash
exit
kubectl ge
kubectl version --client
kubectl completion bash > ~/.kubectl_completion
echo 'source ~/.kubectl_completion' >> ~/.bashrc
source ~/.bashrc
kubectl gesudo apt-get update
sudo apt-get install bash-completion
source /etc/profile.d/bash_completion.sh
type _get_comp_words_by_ref
sudo apt-get purge bash-completion
source /etc/profile.d/bash_completion.sh
kubectl completion bash > ~/.kubectl_completion
echo 'source ~/.kubectl_completion' >> ~/.bashrc
source ~/.bashrc
kubectl get nodes
ssh node1.test.com
kubectl get nodes 
kubeadm join 192.168.11.10:6443 --token vagt7z.e748f81tnw9przvj 
kubeadm init
ssh node1.test.com
kubeadm init
# kubeadm reset 명령을 사용하여 초기화 상태를 제거합니다.
kubeadm reset -f
# /etc/kubernetes 디렉토리와 관련된 파일을 제거합니다.
rm -rf /etc/kubernetes
# /var/lib/etcd 디렉토리와 관련된 파일을 제거합니다.
rm -rf /var/lib/etcd
# 방화벽 및 포트 사용 중인 상태를 정리합니다. (선택 사항)
systemctl stop kubelet
systemctl stop docker
# 포트를 사용하는 프로세스를 찾습니다.
lsof -i :6443
lsof -i :10250
lsof -i :2379
# 포트를 사용하는 프로세스를 종료합니다.
kill -9 <PID>  # PID는 lsof 명령으로 찾은 프로세스 ID
lsof -i:6443
lsof -i:10250
lsof -i:2379
kubeadm init --apiserver-advertise-address=192.168.11.10 --pod-network-cidr=10.244.0.0/16
ssh node1.testcom
kubectl get pod --namespace kube-system
vi ~/.vimrc
kubectl expl
kubectl explain pods
vi 1.yaml
kubectl run web --image nginx:1.12
kubectl get pod
kubectl get pod -o wide
curl http://10.244.2.2
kubectl edit pod web
curl http://10.244.2.2
vi 1.yaml
kubectl explain pods.spec
vi 1.yaml
kubectl apply -f 1.yaml
vi 1.yaml
kubectl apply -f 1.yaml
vi 1.yaml
kubectl apply -f 1.yaml
kubectl ap
kubectl apply -f 2.yaml
kubectl get po
kubectl delete -f 2.yaml
kubectl delete pod web2
kubectl delete pod web1
kubectl delete pod web
exit
cd /
ls
kubectl  run  web4  --image  httpd
kubectl  get  pod
kubectl  get  pod  --show-labels
kubectl  label 
kubectl  label  pod web4 version=product
kubectl  label  pod
kubectl  get  pod  --show-labels
cd .git/
ls
cd #
kubectl get nodes(=kubectl get no)
kubectl   get   nodes ( = kubectl  get  no)
kubectl  get  no  --show-labels
kubectl  label  nodes  node1.test.com  region=seoul
kubectl  label  nodes  node2.test.com  region=busan
git config --global user.name "umyunsang"
git config --global user.email "dbstkd5865@gmail.com"
kubectl apply -f 3.y
kubectl apply -f 3.yaml
cd manifests/
kubectl apply -f 3.yaml
kubectl get po -o wide
kubectl apply -f 3.yaml
kubectl get po -o wide
kubectl  run  web4  --image  httpd
kubectl get po -o wide
kubectl  get  po  --show-labels
kubectl  label po web5 state-
kubectl  label pod web5 state-
kubectl  get  po  --show-labels
kubectl get nodes --show-labels
kubectl label node1.test.com region
kubectl label nodes node1.test.com region-
kubectl get nodes --show-labels
kubectl delete pod --all
kubectl get po
kubectl delete pod 
kubectl delete pod --all
eixt
exit
watch -n 1 kubectl get po -o wide
exit
kubectl apply -f db.yaml
cd manifests/
kubectl apply -f db.yaml
kubectl get po
kubectl exec db --env
kubectl exec db --ls /etc
kubectl exec db -- ls /etc
kubectl exec db -- env
kubectl exec db -- ifconfig
kubectl cp db:/etc/xattr.conf .
kubectl cp db:/etc/xattr.conf ./
kubectl cp db:/etc/xattr.conf x.conf
ls
kubectl cp db.yaml db:/etc/
kubectl exec db -- ls /etc/
kubectl exec db -- ls /etc/ | grep db.yaml
kubectl exec -it db -- /bin/bash
kubectl apply -f www.yaml
kubectl get po
echo hello > index.html
kubectl cp ./index.html www:/usr/share/nginx/html
kubectl get nodes
kubectl get po -o wide
curl http://10.244.1.3
kubectl apply -f side.yaml
kubectl get po
kubectl describe po multi
kubectl delete po --all
kubectl get po
kubectl get no
kubectl describe node node1.test.com
kubectl apply -f rs.yaml
kubectl get po
kubectl get po -o wid
kubectl get po -o wide
kubectl get rs
kubectl scale rs myrs
kubectl scale rs myrs --replicas 7
kubectl scale rs myrs --replicas 2
kubectl get rs
kubectl delete pod myrs-bqcwh
kubectl get rs
kubectl apply -f rs.yaml
kubectl get rs
kubectl edit rs myrs
kubectl apply -f rs.yaml
kubectl get rs
kubectl edit rs myrs
kubectl get rs
kubectl delete rs myrs
docker info
docker images
docker network ls
docker ps -a
docker build -t nginx-custom .
kubectl get nodes
kubectl get all -o wide
kubectl apply -f rs.yaml
kubectl get all -o wide
kubectl get rs
kubectl get po -o wide
kubecl get deployments
watch -n 1 kubectl get po
kubectl get rs -w
kubectl get deply.rs.po
kubectl get deploy.rs.po
cd manifests/
kubectl get deploy.rs.po
kubectl get deploy,rs,po
kubectl delete rs myrs
kubectl get deploy,rs,po
kubectl apply -f deply.yaml
kubectl get deploy,rs,po
kubectl set image deployment deply last=nginx:1.14
kubectl set image deployment deploy last=nginx:1.14
kubectl set image deployment mydp last=nginx:1.14
kubectl rollout undo deploy mydp
kubectl get deploy,rs,po
kubectl rollout history deploy my-deployment
kubectl rollout history deploy mydp
kubectl rollout history deploy mydp --revisio 2
kubectl rollout history deploy mydp --revision 2
kubectl run www --image nginx:1.12
kubectl delete pod www
kubectl run web --image nginx:1.12 --label "app=websvr" --port 80
kubectl run web --image nginx:1.12 --labels "app=websvr" --port 80
kubectl delete -f mydp.yaml
kubectl delete -f mydp
kubectl delete -f deploy mydp
kubectl get deploy
kubectl delete deploy mydp
kubectl apply -f cluster.yaml
kubectl get svc
kubectl get po -o wide
kubectl describe svc svc
kubectl run clientpod --image nginx
kubectl exec -it clientpod --bash
kubectl exec -it clientpod -- bash
cd manifests/
kubectl get svc -n kube-system
kubectl get svc -n kube-system --show-labels
kubectl get po -n kube-system
kubectl delete svcc --all
kubectl delete svc --all
kubectl delete po --all
kubectl apply -f quiz.yaml
kubectl get svc
kubectl get po -o wide
kubectl run clientpod --image nginx
kubectl exec -it clientpod -- bash
cd #
cd webProj/
python3 -m venv venv
apt install python
python3 -m venv venv
sudo apt install python3-venv
python3 -m venv venv
source venv/bin/activate
mkdir static
mkdir templates
pip install flask
pip freeze > reuqirements.txt
docker build -t flask-uys .
exit
cd webProj/
source venv/bin/activate
docker build -t flask-uys .
pwd
ls
docker build --no-cache -t flask-uys .
exit
cd webProj/
pip freeze > reqirements.txt
apt install python3-pip
pip freeze > requirements.txt
docker build -t flask-uys .
Dockerfile:8
--------------------
ERROR: failed to solve: process "/bin/sh -c pip install --no-cache-dir -r requirements.txt" did not complete successfully: exit code: 1
root@master:~/webProj# ls
ls
ll
chmod 644 requirements.txt
ll
docker build -t flask-uys .
pip search cloud-init
pip uninstall cloud-init
pip search cloud-init
RUN pip install --upgrade pip
pip install --upgrade pip
docker build -t flask-uys .
source venv/bin/activate
pip freeze > requirements.txt
docker build -t flask-uys .
docker run -p 80:80 flask-uys
python3 app.py
pip install mysql-connector-python
python3 app.py
apt install mysql-sever
apt update
apt install mysql-sever
systemctl status mysql
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql
sudo mysql_secure_installation
mysql -u root -p
mysql -u uys_1705817 -p
python3 app.py 
exit
docker run -p 80:80 flask-uys
sudo apt update
sudo apt install mysql-server
docker run -p 80:80 flask-uys
pip install mysql-connector-python
docker run -p 80:80 flask-uys
exit
docker run -p 80:80 flask-uys
pip install mysql
docker run -p 80:80 flask-uys
cd webProj/
docker run -p 80:80 flask-uys
python3 app.py
pip install flask
python3 app.py 
pip list
source venv/bin/activate
pip freeze > requirements.txt
docker images
docker delete image flask-uys
docker rmi flask-uys
docker rmi -f flask-uys
docker build -t flask-uys .
docker run -p 80:80 flask-uys
docker image ls
python3 app.py 
docker ps -a
docker rm -f $(docker ps -aq)
docker ps -a
docker run -p 8080:80 flask-uys
docker rm -f flask-uys
docker rm -f $(docker ps -aq)
docker run -d --name uys -p 8080:80 flask-uys
docker ps
