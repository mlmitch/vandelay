# Vandelay 
Have you ever written some code that you weren't particularly proud of? 
Code that needs to be commited, but you would rather not have your name attached to it?

... Me neither.

Though, I've heard of that being the case with some.
Vandelay provides help to these afflicted people.
It gives a shortcut for committing to git with an alias.

## Installation
Vandelay requires bash and git to be installed.
The installation script installs Vandelay to `/usr/local/bin/`.

Install:
```
git clone https://github.com/mlmitch/vandelay.git
cd vandelay
sudo ./install.sh
```

Uninstall:
```
sudo ./uninstall.sh
```

## Usage
Configure your alias:
```
vandelay config -n "H.E. Pennypacker" -e "pennypacker@bicycles.invalid"
```
Configuration can be skipped if you like the default alias of "Art Vandelay \<art@vandelayindustries.invalid\>".

Reset configuration:
```
vandelay reset
```
This erases the current configuration and sets the alias back to default.

Commiting to git (with changes staged for commit):
```
vandelay -m "I'm an importer/exporter, not a developer... you can't blame me for this garbage"
```

`vandelay` without a subcommand serves as an alias for `git commit`. Any options you pass to `vandelay` will be given right to the used `git commit` command.
 
Basic help:
```
vandelay help
```
