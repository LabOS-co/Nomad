--download 
export NOMAD_VERSION="0.10.2"
curl --remote-name https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip

unzip nomad_${NOMAD_VERSION}_linux_amd64.zip
sudo chown root:root nomad
sudo mv nomad /usr/local/bin/

--Create a data directory for Nomad.
sudo mkdir --parents /opt/nomad
sudo chmod a+rwx /opt/nomad

sudo cp nomad.service /etc/systemd/system/nomad.service
sudo chmod 644 /etc/systemd/system/nomad.service

sudo mkdir --parents /etc/nomad.d
sudo chmod 700 /etc/nomad.d

sudo cp client.hcl /etc/nomad.d/client.hcl

sudo chmod a+rwx /etc/nomad.d

sudo systemctl enable nomad
sudo systemctl start nomad
sudo systemctl status nomad

-- install consul

CONSUL_VERSION="1.6.2"
curl --silent --remote-name https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
unzip consul_${CONSUL_VERSION}_linux_amd64.zip
sudo chown root:root consul
sudo mv consul /usr/local/bin/
--consul --version
consul -autocomplete-install
complete -C /usr/local/bin/consul consul

sudo cp nomad.service /etc/systemd/system/consul.service
sudo chmod 644 /etc/systemd/system/consul.service

sudo mkdir --parents /etc/consul.d
sudo chmod 700 /etc/consul.d
sudo cp consul.hcl /etc/consul.d/consul.hcl


