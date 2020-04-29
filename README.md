# docker-gui

```
docker run -t -d -p 5901:5901 --name centos-vnc atsttk84/centos-vnc
docker run -e VNC_COL_DEPTH=16 -e VNC_RESOLUTION=1024x768 -t -d -p 5901:5901 --name centos-vnc atsttk84/centos-vnc
```
