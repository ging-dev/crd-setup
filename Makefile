install:
	sudo install -d -m 0755 /etc/apt/keyrings
	wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
	echo 'deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main' | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
	echo 'Package: *\nPin: origin packages.mozilla.org\nPin-Priority: 1000' | sudo tee /etc/apt/preferences.d/mozilla
	wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
	sudo apt-get update -y
	sudo DEBIAN_FRONTEND=noninteractive apt install -y \
		dbus-x11 \
		desktop-base \
		gnome-session-flashback \
		nautilus \
		gnome-terminal \
		firefox \
		./chrome-remote-desktop_current_amd64.deb
	@bash -c 'echo "exec /etc/X11/Xsession /usr/libexec/gnome-flashback-metacity" > ~/.chrome-remote-desktop-session'
	@rm *.deb

start:
	sudo service dbus start
	sudo service chrome-remote-desktop start

stop:
	sudo service dbus stop
	sudo service chrome-remote-desktop stop
