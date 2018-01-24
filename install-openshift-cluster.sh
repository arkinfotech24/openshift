# Install openshift orgin on centos 7



# Install openshift origin and docker on all nodes
yum -y install centos-release-openshift-origin36 docker ; service docker start ; chkconfig docker on
# for x in `cat list` ; do ssh $x 'yum -y install centos-release-openshift-origin36 docker; service docker start ; chkconfig docker on'; done # For bulk installation of all host. Pls inculude the host IPs in list file 



# Install and configure ansible 
# compulsary for master ansible and optional for other nodes 
yum --enablerepo=epel -y install ansible openssh-clients 
cat /etc/ansible/ansible.cfg > /etc/ansible/ansible.cfg.bckup
cat /etc/ansible/ansible.cfg.bckup | sed 's/#host_key_checking = False/host_key_checking = False/g' > /etc/ansible/ansible.cfg



# SSH connection should be seamless from ansible master to all ansible client



# On Master Node, login with a user created above and run Ansible Playbook for setting up OpenShift Cluster. 
yum -y install atomic-openshift-utils 


# To run the ansible installation
echo -e "\nEdit and copy the file (/root/git/openshift/hosts-example) into (/etc/ansible/hosts) before running the ansible installation\n"
echo -e "\nPls run command below from the ansible master\nansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml\n\n" 


# Verification after ansible installation completed
echo -e "\nverification after ansible installation completed"
# show state
echo -e "\noc get nodes"
# show state with labels
echo -e "\noc get nodes --show-labels=true" 
