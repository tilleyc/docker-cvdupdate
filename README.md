# docker-cvdupdate

This is a relatively straightforward container designed to pull ClamAV freshclam definition updates for a private mirror.
It is also designed to work in conjunction with another container, such as nginx, to serve the definitions for your
systems to consume.

This will launch cvdupdate and fetch updates every 4 hours, running indefinitely.

 - Updates are placed in `/var/www/html`
 - Logs are written to `/var/log/cvd`
