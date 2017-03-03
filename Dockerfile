# Docker image for MUST week, ICS MU
FROM centos:centos7
MAINTAINER Radim Pesa

# Install software
RUN yum -y update; yum clean all
RUN yum -y install curl git make m4 wget which
RUN yum install -y gcc gcc-c++ ruby-devel openssl-devel ruby rubygems

#Install VOMS
RUN yum -y install http://repository.egi.eu/sw/production/umd/3/sl6/x86_64/updates/umd-release-3.0.1-1.el6.noarch.rpm
RUN curl -s http://repository.egi.eu/community/software/rocci.cli/4.3.x/releases/repofiles/sl-6-x86_64.repo > /etc/yum.repos.d/rocci.repo

RUN yum -q -y install ca-policy-egi-core fetch-crl voms-clients
#voms-clients3  occi-cli??

# dodelat voms adresare
RUN mkdir -p /etc/grid-security/vomsdir/fedcloud.egi.eu
COPY vomses /etc/vomses
copy voms1.grid.cesnet.cz.lsc /etc/grid-security/vomsdir/fedcloud.egi.eu
copy voms2.grid.cesnet.cz.lsc /etc/grid-security/vomsdir/fedcloud.egi.eu





#Install OCCI-CLI (ale ktere?)
RUN gem install occi-cli
ENV PATH /usr/loca/bin:$PATH

#Install Cloudify + example
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py

VOLUME ["/root/.globus" "/root/mustweek"]
