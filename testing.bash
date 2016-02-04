# Possibility to detect os
if [ ! -d $VENV_PATH ]
115 then
116   if [ ! -f $BOOTSTRAP/debian.sh ] ; then
117     echo "Cannot find the letsencrypt bootstrap scripts in $BOOTSTRAP"
118     exit 1
119   fi
120 
121   if [ -f /etc/debian_version ] ; then
122     echo "Bootstrapping dependencies for Debian-based OSes..."
123     $SUDO $BOOTSTRAP/_deb_common.sh
124   elif [ -f /etc/redhat-release ] ; then
125     echo "Bootstrapping dependencies for RedHat-based OSes..."
126     $SUDO $BOOTSTRAP/_rpm_common.sh
127   elif `grep -q openSUSE /etc/os-release` ; then
128     echo "Bootstrapping dependencies for openSUSE-based OSes..."
129     $SUDO $BOOTSTRAP/_suse_common.sh
130   elif [ -f /etc/arch-release ] ; then
131     if [ "$DEBUG" = 1 ] ; then
132       echo "Bootstrapping dependencies for Archlinux..."
133       $SUDO $BOOTSTRAP/archlinux.sh
134     else
135       echo "Please use pacman to install letsencrypt packages:"
136       echo "# pacman -S letsencrypt letsencrypt-apache"
137       echo
138       echo "If you would like to use the virtualenv way, please run the script again with the"
139       echo "--debug flag."
140       exit 1
141     fi

