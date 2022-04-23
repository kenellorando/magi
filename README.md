Configuration management code for my home RPi cluster for hosting  internal applications-- in particular, containerized applications on K3s. The steps and software configuration a unique to my lab but can be adapted quite easily to your needs. 

## Setup and Installation

1. Cluster hardware must be assembled (pis, fans, hats, switches, cabling).
2. Base operating systems (I use Debian) should be flashed to each node's SD card, ensuring a `sysconf.txt` is configured to set system hostname and an allowed SSH key.
3. Configure your `hosts/hosts.ini` file with the correct addresses of your nodes.
4. Before any other playbook can be executed, the `main-preconfig.yml` playbook to update system software, install Python, and configure a new system user.

The cluster is ready to have all other software configured.