# Cypress dependencies with Chrome browser
FROM    cypress/browsers:chrome62

# need to install VNC server
USER    root
RUN     apt-get update && apt-get install -y x11vnc
RUN     mkdir ~/.vnc

# install VIM editor
RUN     apt-get update && apt-get install -y vim

# Do not setup VNC password (we assume local testing)

# Setup a password
# RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
# RUN     bash -c 'echo "chrome" >> /.bashrc'
