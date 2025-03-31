#!/bin/bash

# Keyring authentication
#eval $(gnome-keyring-daemon --start) >/dev/null

# Wait for network to be up
nmcli networking connectivity check
