
# EJBCA - Docker container image

## STARTING THE CONTAINER

Start the container and leave it running on a terminal window:

    docker run -it -p 8080:8080 -p 8443:8443 --name=myejbca ejbca server

A new container called "myejbca" will be started from image "ejbca".
The container will remain running on foreground and it will print
EJBCA debug log messages in realtime.

Press CTRL+C to stop the container.  The container will not be removed
automatically.  It can be restarted by running:

    docker start -ai myejbca


## WEB INTERFACE

Copy the admin credentials while the container is running and import
it on your web browser.  The password for the .p12 file is `ejbca`:

    docker cp ejbca:/superadmin.p12 .

Web interface can be accessed by using following URIs:

* `https://[address]:8443/ejbca/`:
  The TLS protected HTTPS address used to access the Admin GUI.
  Requires client certificate (`superadmin.p12`) for access.

* `http://[address]:8080/ejbca/`:
  The public HTTP address of application server, used for clients to
  access the public web for enrollment.



## COMMAND LINE INTERFACE

Define alias as a shortcut to run EJBCA CLI in the container:

    alias ejbca.sh="docker exec -it myejbca ejbca.sh"

Use the commands according to EJBCA documentation while the container
is running.  For example:

    # create or delete end-entity
    ejbca.sh ra addendentity --username server123 --dn "CN=server123" --caname ManagementCA --password mypassword --type 1 --token USERGENERATED
    ejbca.sh ra delendentity --username server123 -force

    # print CA certificate
    ejbca.sh ca getcacert --caname ManagementCA -f /dev/stdout

**Note** that the commands are executed inside the container.  Paths
refer to filesystem of the container instead of the host.  If you need
to move files between host and container you can use docker volumes to
mount host path into the container (`docker run -v
HOST_PATH:CONTAINER_PATH ...`).  See documentation at
https://docs.docker.com/.


## VOLUMES

  * `/root`:
  Persistent data used by EJBCA

<!---

To test rendering:
ronn --roff --pipe files/docker-entrypoint.md | man -l -

Render to man page:
ronn --roff --pipe files/docker-entrypoint.md > files/docker-entrypoint.man

--->
