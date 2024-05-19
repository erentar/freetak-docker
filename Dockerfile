from fedora
run dnf update -y
run dnf groupinstall -y "Development Tools" "C Development Tools and Libraries"
run dnf install -y \
    python3.11 \
    python3-pip \
    nano
run dnf install -y \
    cairo \
    cairo-devel \
    python3-greenlet \
    python3-cairo \
    python3-cairo-devel \
    python3-gevent \
    python3-lxml \
    python3-virtualenv \
    libjpeg-devel #add libjpeg to documentation
run mkdir -p /opt/fts
run chmod -R 777 /opt

run useradd appuser
run echo "appuser:qwerty" | chpasswd
run usermod -aG wheel appuser
user appuser
workdir /home/appuser

run git clone -b 705-unable-to-install-broken-dependencies https://github.com/FreeTAKTeam/FreeTakServer && \
        cd FreeTakServer && \
        pip3 install .

run pip3 install FreeTAKServer[ui]
copy ./serve.sh /home/appuser/serve.sh
entrypoint ~/serve.sh
