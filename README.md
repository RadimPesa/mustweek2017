# MUST Week 2017


Docker container with VOMS + OCCI + Cloudify client tools environment.

## Setup

### Install Docker
(https://docs.docker.com/engine/installation/).


### Private key and certficate

Copy your private key and certficate to .globus directory in your home directory and set permissions.


### Start container
```bash
sudo docker run -v ~/sources/:/root/sources -v ~/.globus:/root/.globus -it radimpesa/mustweek2017 /bin/bash
```

### Generate proxy
Now inside the container run voms-proxy-init command to generate the proxy certificate.

```bash
voms-proxy-init -voms fedcloud.egi.eu -cert /root/.globus/usercert.pem -key /root/.globus/userkey.pem --rfc
```

```bash
export X509_USER_PROXY=`voms-proxy-info -path`
```

### Practice witch OCCI CLI

Several occi examples, list templastes, create compute, delete compute atd.

#### List all available compute resources (virtual servers)
```bash
occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY \
     --action list --voms --resource compute
```

#### List all available OS templates (images)
```bash
occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY \
     --action list --voms --resource os_tpl
```

#### List all available resource templates (flavors)
```bash
occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY --voms \
     --action list --resource resource_tpl
```

#### Start compute resource (VM)
```bash
$ occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY \
       --action create --voms --resource compute \
       --mixin os_tpl#uuid_egi_centos_7_fedcloud_warg_149 \
       --mixin resource_tpl#medium \
       --attribute occi.core.title="MyFirstVM"

https://carach5.ics.muni.cz:11443/compute/86281
```

#### Delete compute resource (VM)
```bash
$ occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY \
       --action list --voms --resource compute

https://carach5.ics.muni.cz:11443/compute/86281
```

```bash
$ occi --endpoint "https://carach5.ics.muni.cz:11443" --auth x509 --user-cred $X509_USER_PROXY --voms \
       --action delete --resource https://carach5.ics.muni.cz:11443/compute/86281
```


### Practice with Cloudify ...
Download and start example
...
