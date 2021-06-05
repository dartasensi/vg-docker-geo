# vg-docker-geo

Vagrant + Docker + Geo services

## Execution

### GeoNetwork 3.x (/gn3)
In order to persist every data created within the execution of GeoNetwork, you need first to create an external volume.

Use this script to prepare the environment with the required volumes

`sh prepare_gn3.sh`

Or execute this docker command:

`docker volume create <named-volume-expressed-in-docker-compose>`

Note: make sure that the volume's name matches the one expressed in the current `docker-compose.yml` configuration.

Now that you have the persistent volume as external, start the container as `root` with this command:

`docker-compose up -d geonetwork`

To stop the entire composition:

`docker-compose down`

In case you want to get rid of the volume each time you restart the containers, point the `volume` element to another source.


## Tips

### VirtualBox host / Ubuntu guest: issues with dns resolver

It seems that this Vagrant+VirtualBox configuration produces issues in the Docker DNS resolver. The hosts are reachable within the guest OS, but not in the Docker containers.

Keep this line disabled: `vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]`

### activate bash completion with root user

Open `/root/.bashrc` and remove the comments from lines (~98-100) like:

