#YELLOW='\e[0;33m'
#BLACK='\e[0;30m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
#MAGENTA='\e[0;35m'
RED='\e[0;31m'
GREEN='\e[0;32m'
#BLUE='\e[0;34m'

echo -e "${GREEN} _____             _                _____                      _ _           _____  _                                             _ ${NC}"
echo -e "${GREEN}|  __ \           | |              / ____|                    (_) |         |  __ \| |                                           | |${NC}"
echo -e "${GREEN}| |  | | ___   ___| | _____ _ __  | (___   ___  ___ _   _ _ __ _| |_ _   _  | |__) | | __ _ _   _  __ _ _ __ ___  _   _ _ __   __| |${NC}"
echo -e "${GREEN}| |  | |/ _ \ / __| |/ / _ \  __|  \___ \ / _ \/ __| | | |  __| | __| | | | |  ___/| |/ _  | | | |/ _  |  __/ _ \| | | |  _ \ / _  |${NC}"
echo -e "${GREEN}| |__| | (_) | (__|   <  __/ |     ____) |  __/ (__| |_| | |  | | |_| |_| | | |    | | (_| | |_| | (_| | | | (_) | |_| | | | | (_| |${NC}"
echo -e "${GREEN}|_____/ \___/ \___|_|\_\___|_|    |_____/ \___|\___|\__,_|_|  |_|\__|\__, | |_|    |_|\__,_|\__, |\__, |_|  \___/ \__,_|_| |_|\__,_|${NC}"
echo -e "${GREEN}                                                                      __/ |                  __/ | __/ |                            ${NC}"
echo -e "${GREEN}                                                                     |___/                  |___/ |___/                             ${NC}"
echo -e ""

echo -e "${CYAN}[INFO]${NC} ${WHITE} Welcome to Docker Security Playground installation script${NC}"
echo -e "${CYAN}[INFO]${NC} ${WHITE} Please select your Linux distribution ${NC}"
echo -e "${CYAN}[INFO]${NC} ${WHITE} 1 - Kali Linux or other Debian ${NC}"
echo -e "${CYAN}[INFO]${NC} ${WHITE} 2 - Ubuntu ${NC}"
read -p "" -n 1 -r
echo ""

if [[ $REPLY =~ ^[1]$ ]]
then
    echo -e "${CYAN}[INFO]${NC} ${WHITE} Installing dependencies for Kali Linux ${NC}"
    apt install nodejs docker.io npm g++ build-essential
elif [[ $REPLY =~ ^[2]$ ]]
then
    echo -e "${CYAN}[INFO]${NC} ${WHITE} Installing dependencies for Ubuntu ${NC}"
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    apt-get install -y nodejs
    apt-get install -y build-essential

else 
    echo -e "${RED}[ERROR]${NC} ${WHITE} Wrong Argument ${NC}"
    exit 1
fi
cd ~
apt-get install git


if [[ -d ~/DockerSecurityPlayground ]]
then

echo -e "${CYAN}[INFO]${NC} ${WHITE} Directory /DockerSecurityPlayground exists in your file system, skipping ${NC}"

else 

echo -e "${CYAN}[INFO]${NC} ${WHITE} Directory /DockerSecurityPlayground does not exists in your file system and it will be downloaded ${NC}"
git clone https://github.com/giper45/DockerSecurityPlayground.git

fi

apt-get update
curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
npm install --save mydockerjs
cd DockerSecurityPlayground
npm install express
npm install body-parser
npm install update
npm run update
npm install ws
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo su
cat > /etc/apt/sources.list.d/docker.list <<'EOF'
deb https://apt.dockerproject.org/repo debian-stretch main
EOF
apt-get update
groupadd docker
gpasswd -a ${USER} docker
service docker restart
systemctl enable docker
npm start
$BROWSER 'http://localhost:8080/'

echo -e "${CYAN}[INFO]${NC} ${WHITE} Installation completed. Go to http://localhost:8080/ ${NC}"




