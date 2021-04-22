FROM python:alpine
 
WORKDIR /root/
 
RUN python3 -m pip install --user cvdupdate
 
RUN ln /root/.local/bin/cvd /usr/sbin/cvd
 
RUN mkdir /var/log/cvd
 
RUN mkdir -p /var/www/html
 
RUN cvd config set -l /var/log/cvd/
 
RUN cvd config set -d /var/www/html/
 
RUN echo "#!/bin/sh" > /root/entrypoint.sh
 
RUN echo "/usr/sbin/cvd update >> /dev/stdout" >> /root/entrypoint.sh
 
RUN echo "while sleep 14400; do /usr/sbin/cvd update >> /dev/stdout; done" >> /root/entrypoint.sh
 
RUN chmod +x /root/entrypoint.sh
 
ENTRYPOINT ["/root/entrypoint.sh"]
