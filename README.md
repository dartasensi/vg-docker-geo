# vg-docker-geo

Vagrant + Docker + Geo services

## Tips

### VirtualBox host / Ubuntu guest: issues with dns resolver

It seems that this Vagrant+VirtualBox configuration produces issues in the Docker DNS resolver. The hosts are reachable within the guest OS, but not in the Docker containers.

Keep this line disabled: `vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]`

### bash completion with root user

Open `/root/.bashrc` and remove the comments from lines (~98-100) like:
