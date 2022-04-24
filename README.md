Configuration management code for my home RPi cluster for hosting  internal applications-- in particular, containerized applications on K3s. The steps and software configuration a unique to my lab but can be adapted quite easily to your needs. 

## Setup

1. Cluster hardware must be assembled (pis, fans, hats, switches, cabling).
2. Base operating systems (I use Debian) should be flashed to each node's SD card, ensuring a `sysconf` file is configured to set system hostname and an allowed SSH key.
3. Configure the `hosts/hosts.ini` file with the correct IP addresses of your nodes.
4. The `k3s-init` and `k3s-join` roles have tasks with hardcoded IP addresses of my loadbalancer floating IP and the initializing cluster node IP. They likely need to be changed to suit your network IPs.

## Installing

These commands will configure all base software on your nodes appropriately, install a K3s cluster in HA Cluster Mode on your `compute` nodes, and install HAProxy to your `loadbalancer` nodes.

1. `make common-config`
2. `make k3s-install`
3. `make lb-install`

That should 

## Accessing the Cluster Locally

1. Copy a `/etc/rancher/k3s/k3s.yaml` file from any of the compute nodes to your local machine's `~/.kube/config`.
2. Change the `server` IP to the load balancer's IP.
3. Run `kubectl get nodes` to test.