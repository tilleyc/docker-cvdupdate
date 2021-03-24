FROM python:alpine

WORKDIR /root/

RUN python3 -m pip install --user cvdupdate

CMD [ "/root/.local/bin/cvd", "update" ]
