# Nomad
 
 
 * git clone https://github.com/Netlims/Nomad.git
 * cd Nomad/linux
 * Update linux\consul.hcl - retry_join
 ** sudo sed -i 's/\REPLACE_ME_WITH_IP/10.0.50.76/g' /home/ubuntu/Nomad/linux/consul.hcl
 * sudo chmod +x install.sh
 * Run Installation:
	./install.sh
 

 
 
