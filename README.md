# Application configuration files
Application configuration files that live in ~/.config/

Link your home directory's `~/.config~ directory to the `config` directory in this repository.

# Setup
NOTE: running this command may result in you losing your .config files. Take care!
NOTE: this command will create a backup of your config in `~/.config-backup`. However, it will overwrite any previous information in `~/.config-backup`

```
./bin/install.sh
```

# Notes for specific services
## Xremap
Make sure your user is part of the `input` group, and that you have a udev rule set up. Otherwise you'll run into permission errors and your keyboard won't be detected.

```
sudo gpasswd -a YOUR_USER input
echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules
```
Restart your computer so this rule takes effect
