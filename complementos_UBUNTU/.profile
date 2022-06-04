# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


#CONFIGURACION
export PATH="$PATH:$HOME/development/flutter/bin"
export PATH="$PATH:$HOME/development/flutter/bin/cache/dart-sdk/bin"

# CONFIGURACION GRADLE
export PATH=$PATH:/opt/gradle/gradle-7.4.2/bin


# CONFIGURACION DE JAVA
export JAVA_HOME=/usr/lib/jvm/jdk-11
#export JAVA_HOME=/opt/jdk1.8.0_202
#export JAVA_HOME=/usr/lib/jvm/jdk-17
export PATH=$JAVA_HOME/bin:$PATH
