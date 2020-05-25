echo **Installing unzip
sudo apt install unzip -y

sudo ufw allow 4647
sudo ufw allow 4646
sudo ufw allow 8500
sudo ufw allow 8600
sudo ufw allow 8301
sudo ufw allow 8300


if (( $(ps -ef | grep -v grep | grep nomad | wc -l) > 0 ))
then
echo "Stopping and removing Nomad"
sudo systemctl stop nomad
sudo systemctl disable nomad
sudo rm -r /opt/nomad
sudo rm /etc/systemd/system/nomad.service
sudo systemctl daemon-reload
sudo systemctl reset-failed

fi

if (( $(ps -ef | grep -v grep | grep consul | wc -l) > 0 ))
then
echo "Stopping and removing consul"
sudo systemctl stop consul
sudo systemctl disable consul
sudo rm -r /opt/consul
sudo rm /etc/systemd/system/consul.service
sudo systemctl daemon-reload
sudo systemctl reset-failed
fi

export NOMAD_VERSION="0.11.1"
echo **Downloading nomad ${NOMAD_VERSION}
curl --remote-name https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip
echo **unzipping...
unzip -o nomad_${NOMAD_VERSION}_linux_amd64.zip
sudo chown root:root nomad
sudo mv nomad /usr/local/bin/

echo **Remove and Create a data directory for Nomad.
sudo rm -r /opt/nomad
sudo mkdir --parents /opt/nomad
sudo chmod a+rwx /opt/nomad

echo **Installing Nomad service
sudo cp nomad.service /etc/systemd/system/nomad.service
sudo chmod 644 /etc/systemd/system/nomad.service

sudo rm -r /etc/nomad.d
sudo mkdir --parents /etc/nomad.d
sudo chmod 700 /etc/nomad.d

sudo cp client.hcl /etc/nomad.d/client.hcl

sudo chmod a+rwx /etc/nomad.d

echo **Running Nomad service
sudo systemctl enable nomad
sudo systemctl start nomad
#sudo systemctl status nomad

# install consul

export CONSUL_VERSION="1.7.2"
curl --silent --remote-name https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
unzip -o consul_${CONSUL_VERSION}_linux_amd64.zip
sudo chown root:root consul
sudo mv consul /usr/local/bin/
#consul --version
#consul -autocomplete-install
complete -C /usr/local/bin/consul consul

sudo cp consul.service /etc/systemd/system/consul.service
sudo chmod 644 /etc/systemd/system/consul.service

sudo rm -r /etc/consul.d
sudo mkdir --parents /etc/consul.d
sudo chmod 700 /etc/consul.d
sudo cp consul.hcl /etc/consul.d/consul.hcl
sudo chmod a+rwx /etc/consul.d

echo **Running consul service
sudo systemctl enable consul
sudo systemctl start consul

#sudo systemctl status consul
