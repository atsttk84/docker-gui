FROM centos:7

RUN yum -y install epel-release\
 && yum -y groupinstall "X Window System"\
 && yum -y install tigervnc-server sudo xterm xorg-x11-fonts* motif\
 && yum clean all
RUN sed -i "s/twm/mwm/g" /etc/X11/xinit/Xclients\
 && sed -i "s/twm/cwm/g" /etc/X11/xinit/xinitrc\
 && sed -i "s/auth\s*required\s*pam_console.so/auth\t   sufficient\tpam_permit.so/" /etc/pam.d/xserver\
 && sed -i "s/account\s*required\s*pam_permit.so/account\t   sufficient\tpam_permit.so/" /etc/pam.d/xserver\
 && useradd vnc-user && echo "vnc-user:password" | chpasswd\
 && echo "vnc-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers\
 && mkdir /home/vnc-user/.vnc\
 && echo "vncpassword" | vncpasswd -f > /home/vnc-user/.vnc/passwd\
 && chmod 600 /home/vnc-user/.vnc/passwd\
 && echo -e "#!/bin/sh\n /usr/bin/mwm" > /home/vnc-user/.Xclients\
 && chmod +x /home/vnc-user/.Xclients\
 && chown -R vnc-user:vnc-user /home/vnc-user
ADD start.sh /home/vnc-user/start.sh
EXPOSE 5901
USER vnc-user
WORKDIR /home/vnc-user
ENV DISPLAY :1
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1280x1024
CMD sh start.sh
