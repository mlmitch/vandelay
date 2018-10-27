#!/bin/bash

subcommand=$1

NAME="Art Vandelay"
EMAIL="art@vandelayindustries"

case $subcommand in
  "config")
    #modify the current vandelay configuration
    ;;
  "reset")
    #resets the configuration to default
    ;;

  "help")
    echo "vandelay:"
    echo "    Commt to git with an alter-ego."
    echo
    echo "        config [-n NAME] [-e EMAIL]:"
    echo "            'vandelay config' modifies the name and email configuration."
    echo "            e.g. vandelay config -n \"Kel Varnsen\" -e kel@vandelayindustries"
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
    AUTHOR="${NAME} <${EMAIL}>"
    echo -e "Commiting as \"${AUTHOR}\"."
    git -c user.name="${NAME}" -c user.email="${EMAIL}" commit --author="${AUTHOR}" "$@"
    ;;
esac
