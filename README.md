
# magi
This repository contains configuration management code for my homelab triple-node Raspberry Pi cluster with Kubernetes (K3s) installed bare-metal. It serves as my personal general-purpose compute cluster.

Read my detailed writeup of this project: https://kenellorando.notion.site/Magi-HA-K3s-RPi-Cluster-f2394b1be56b47c8abbaa3a50d4aac13

![image](https://user-images.githubusercontent.com/17265041/174359115-7c758472-6507-4b8b-9633-0d7aaef7cc6d.png)




# Setup

The steps and software configuration are unique to my lab but can be adapted quite easily to your needs. 

## Manual Pre-Requisites

1. Cluster hardware must be assembled (pis, fans, hats, switches, cabling).
2. Base operating systems (I use Debian 11) should be imaged to each node's SD card. 
   1. If your OS supports it, a `sysconf` text file in the root of the directory should be configured to set system hostname and an allowed SSH key. If you don't do this, you'll need to configure your SSH access the traditionally tedious way.
3. Configure this repository to your own needs:
   1. Configure the `hosts/hosts.ini` file with the correct IP addresses of your nodes.
   2. The `k3s-init` and `k3s-join` roles need to be updated with your cluster node IPs.
   3. The `keepalived` role has a template with a hardcoded shared IP, that you may wish to change.

## Installing

These commands will configure all base software on your nodes appropriately, then install a K3s cluster in HA Cluster Mode and a shared IP for your `compute` nodes.

1. `make common-config` (this **must** run first)
2. `make k3s-install`

## Testing Cluster Connection

1. Copy a `/etc/rancher/k3s/k3s.yaml` file from any of the compute nodes to your local machine's `~/.kube/config`.
2. Change the `server` IP to the shared virtual IP (set by `keepalived`).
3. Run `kubectl get nodes` to test.
