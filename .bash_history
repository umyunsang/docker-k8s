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
