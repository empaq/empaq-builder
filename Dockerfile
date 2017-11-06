FROM circleci/node:8.9.0

USER root 
RUN npm install -g \
      pkg@4.2.6 \
      release-it@4.3.0

WORKDIR /opt/empaq

# Download and cache node binaries
# `uname -a` returns  
# Linux 10fe91f9bb07 4.9.44-linuxkit-aufs #1 SMP Fri Aug 25 10:00:41 UTC 2017 x86_64 GNU/Linux
# So all the builds will be x64 bits
RUN touch index.js && pkg --targets freebsd,linux,macos,win index.js && rm *

USER circleci
