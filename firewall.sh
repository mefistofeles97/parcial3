sudo -i
sudo yum install vim -y
service firewalld start
cat <<TEST> /etc/selinux/config
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected.
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
TEST
service NetworkManager stop
chkconfig NetworkManager off
sudo firewall-cmd --set-default-zone=dmz
sudo firewall-cmd --zone=dmz --add-interface=eth1 –-permanent
sudo firewall-cmd --zone=dmz --add-service=http --permanent
sudo firewall-cmd --zone=dmz --add-service=https --permanent
sudo firewall-cmd --zone=dmz --add-masquerade --permanent
sudo firewall-cmd --zone="dmz" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.70 --permanent
sudo firewall-cmd --zone="dmz" --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.70 --permanent
sudo firewall-cmd --reload