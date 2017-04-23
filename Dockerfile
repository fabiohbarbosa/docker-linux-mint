FROM vcatechnology/ubuntu:14.04
MAINTAINER fabiohbarbosa <fabiohbarbosa@gmail.com>

# Set up the Linux Mint repositories
RUN REPO_LIST=/etc/apt/sources.list.d/mint.list \
 && echo "deb http://packages.linuxmint.com/ rafaela main upstream import " > ${REPO_LIST} \
 && echo "deb http://extra.linuxmint.com/ rafaela main " >> ${REPO_LIST} \
 && LINUX_MINT_KEY=$(apt update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs) \
 && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com ${LINUX_MINT_KEY} \
 && vca-install-package --allow-unauthenticated linuxmint-keyring \
 && unset LINUX_MINT_KEY REPO_LIST

# Install the necessary packages to convert to Linux Mint
ADD lsb-release /etc/lsb-release

# Update all packages
RUN apt-get -q update \
 && echo console-setup console-setup/charmap select UTF-8 | debconf-set-selections \
 && apt-get -fqy -o Dpkg::Options::="--force-confnew" -o APT::Immediate-Configure=false dist-upgrade \
 && apt-get -qy autoremove \
 && apt-get -q clean
