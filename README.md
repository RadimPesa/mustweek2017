# MUST Week 2017


Docker container witch VOMS + OCCI + Cloudify client tools environment.

## Setup

### Install Docker
(https://docs.docker.com/engine/installation/).


### Private key and certficate

Copy your private key and certficate to .globus directory in your home directory


### Start container
```bash
sudo docker run -v ~/sources/:/root/sources -v ~/.globus:/root/.globus -it docker pull radimpesa/mustweek2017 /bin/bash
```

### Generate proxy
Now inside the container run voms-proxy-init command to generate the proxy certificate.

```bash
voms-proxy-init -voms fedcloud.egi.eu -cert /root/.globus/usercert.pem -key /root/.globus/userkey.pem --rfc
```

```bash
export X509_USER_PROXY=`voms-proxy-info -path`
```

### Practice occi commands ...

Several occi examples, list templastes, create compute, delete compute atd.

List all available compute resources (virtual servers)
```bash
occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY --action list --voms --resource compute
```

List all available resource templates (flavors)
```bash
occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY --action list --voms --resource os_tpl
```

```bash
occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY --voms \
       --action list --resource resource_tpl
```
Start VM

```bash
$ occi --endpoint $ENDPOINT --auth x509 --user-cred $X509_USER_PROXY --voms \
       --action create --resource compute
```

### Practice with cloudify ...
cd to example directory and start cloudify example
...
