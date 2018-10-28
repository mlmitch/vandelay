#!/bin/bash

DEFAULT_NAME="Art Vandelay"
DEFAULT_EMAIL="art@vandelayindustries.invalid"

NAME=$DEFAULT_NAME
EMAIL=$DEFAULT_EMAIL

config_location=~/.vandelayconfig

if [ -f $config_location ]; then
  source $config_location
fi

case $1 in
  config)
    #need to shift off the "config" arg so the options are first
    #this is required for getopts
    shift 
    while getopts ":n:e:" opt; do
      case $opt in
        n)
          NAME=$OPTARG
          ;;
        e)
          EMAIL=$OPTARG
          ;;
      esac
    done

    #overwrite the config
    echo "NAME=\"$NAME\"" > $config_location
    echo -n "EMAIL=\"$EMAIL\"" >> $config_location

    #print it out
    echo
    cat $config_location
    echo
    ;;
  reset)
    #resets the configuration to default
    rm $config_location
    ;;

  help)
    echo "vandelay:"
    echo "    Commt to git with an alter-ego."
    echo
    echo "        config [-n NAME] [-e EMAIL]:"
    echo "            'vandelay config' modifies the name and email configuration."
    echo "            e.g. vandelay config -n \"Kel Varnsen\" -e kel@vandelayindustries.invalid"
    echo
    echo "            Running without options displays the current configuration."
    echo "            A default config is used if vandelay is not configured."
    echo
    echo "        reset:"
    echo "            'vandelay reset' restores the default config."
    echo 
    echo "        [git commit options ...]:"
    echo "            'vandelay [git commit options ...]' commits to git."
    echo "            e.g. vandelay -m \"I write bugs for money.\""
    ;;
  *) 
    #didn't match a vandelay subcommand
    #assume $1 is part of the desired git commit arguments and attempt a commit
    AUTHOR="$NAME <$EMAIL>"

    echo
    echo -e "Commiting as \"$AUTHOR\"."
    echo

    #kind of weird.. online discussion says that $@ doesn't preserve quotes and stuff
    #However, if we don't acces or manipulate $@ before usage in git commit it works
    git -c user.name="$NAME" -c user.email="$EMAIL" commit --author="$AUTHOR" "$@"
    ;;
esac
