# Install openshift orgin on centos 7



# Install openshift origin and docker on all nodes
yum -y install centos-release-openshift-origin36 docker 
# for x in `cat list` ; do ssh $x 'yum -y install centos-release-openshift-origin36 docker'; done # For bulk installation of all host. Pls inculude the host IPs in list file 



# Install and configure ansible 
# compulsary for master ansible and optional for other nodes 
yum --enablerepo=epel -y install ansible openssh-clients 
cat /etc/ansible/ansible.cfg > /etc/ansible/ansible.cfg.bckup
cat /etc/ansible/ansible.cfg.bckup | sed 's/#host_key_checking = False/host_key_checking = False/g' > /etc/ansible/ansible.cfg



# SSH connection should be seamless from ansible master to all ansible client



#To run the ansible installation
echo -e "\nPls run command below from the ansible master\nansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml\n\n" 



# verification after ansible installation completed
# show state
oc get nodes
# show state with labels
oc get nodes --show-labels=true 
