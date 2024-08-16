install:
	sudo apt-get update -y
	wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
	sudo DEBIAN_FRONTEND=noninteractive apt install -y \
		dbus-x11 \
		desktop-base \
		gnome-session-flashback \
		nautilus \
		gnome-terminal \
		./chrome-remote-desktop_current_amd64.deb
	@bash -c 'echo "exec /etc/X11/Xsession /usr/libexec/gnome-flashback-metacity" > ~/.chrome-remote-desktop-session'
	@rm *.deb

start:
	sudo service dbus start
	sudo service chrome-remote-desktop start

stop:
	sudo service dbus stop
	sudo service chrome-remote-desktop stop
