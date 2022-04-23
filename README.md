Configuration management code for my home RPi cluster for hosting  internal applications-- in particular, containerized applications on K3s. The steps and software configuration a unique to my lab but can be adapted quite easily to your needs. 

## Setup and Installation

1. Cluster hardware must be assembled (pis, fans, hats, switches, cabling).
2. Base operating systems (I use Debian) should be flashed to each node's SD card, ensuring a `sysconf` file is configured to set system hostname and an allowed SSH key.
3. Configure your `hosts/hosts.ini` file with the correct IP addresses of your nodes.
4. Before any other playbook can be executed, the `common-preconfig.yml` playbook must run to update system software and install Python, which subsequent playbooks are dependent on. Run `make common-preconfig` to do this.

The cluster is ready to have all other software configured.

## Installing K3s in HA Cluster Mode

1. `make k3s-install`

If this is the first time installing K3s to the nodes, it may take a while for the cluster to initialize on the first node. If you receive errors when the nodes attempt to join the cluster (check `journalctl -u k3s --no-pager --no-hostname`), wait a minute, and try running the installation again.

## Stop Cluster, Uninstall K3s

This triggers a script which also removes any firewall exceptions made for K3s.

1. `make k3s-destroy`