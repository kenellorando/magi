# magi/infrastructure
Ansible code to install all baremetal software, including the K3s cluster.

Code will install git, tmux, vim, telnet, netcat, lsof, and Docker. It will initialize a Kubernetes cluster that will run all nodes in simultaneous master/worker mode, with an nginx ingress controller. Finally, it will also configure a singular virtual IP for the cluster as a whole using keepalived, so all cluster commands and ingress can be routed through that IP.

## Installation
Assuming all cluster hardware is assembled and base operating systems are installed:

1. Replace hardcoded IPs as necessary to match any internal IP addressing: `hosts/hosts.ini`, `roles/k3s-init`, `roles/k3s-join`. `roles/keepalived` has a template with an arbitrary IP that you may also wish to change.
2. `make common-config`
3. `make k3s-install`
4. Copy a `/etc/rancher/k3s/k3s.yaml` file from any of the compute nodes to your local machine's `~/.kube/config`, then change the file's to the shared virtual IP (set in the `roles/keepalived` template).
5. Run `kubectl get nodes` to test.
