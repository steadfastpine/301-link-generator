#!/bin/bash


# set program name
program_name="301-link-generator"


# get current version
version=$(cat ./version)


# load installation header
header="
  ____   ___  __                  
 |___ \ / _ \/_ |                 
   __) | | | || | __ _  ___ _ __  
  |__ <| | | || |/ _  |/ _ \  _ \ 
  ___) | |_| || | (_| |  __/ | | |
 |____/ \___/ |_|\__, |\___|_| |_|
                  __/ |           
                 |___/    
"
echo "$header"
echo ""
echo "301 Link Generator"
echo "version $version"
echo "https://github.com/pinebase/$program_name"
echo ""

# install writable /var directory 
if [ ! -d /var/lib/$program_name/ ]
then
	mkdir /var/lib/$program_name/
	echo "# created folder: /var/lib/$program_name/"
fi


# install input file
if [ ! -f /var/lib/$program_name/input-paths.txt ]
then
	touch /var/lib/$program_name/input-paths.txt
	echo "# created file: /var/lib/$program_name/input-paths.txt"
fi


# install output file
if [ ! -f /var/lib/$program_name/output-apache-301.txt ]
then
	touch /var/lib/$program_name/output-apache-301.txt
	echo "# created file: /var/lib/$program_name/output-apache-301.txt"
fi


# set permissions for writable word lists
chmod 766 /var/lib/$program_name/output-apache-301.txt
echo "# updated permissions: 766 /var/lib/$program_name/output-apache-301.txt"

chmod 766 /var/lib/$program_name/input-paths.txt
echo "# updated permissions: 766 /var/lib/$program_name/input-paths.txt"


# install write protected program folder
if [ ! -d /usr/lib/$program_name/ ]
then
	mkdir /usr/lib/$program_name/
	echo "# created folder: /usr/lib/$program_name/"
fi


# install current version log
if [ ! -f /var/lib/$program_name/current_version ]
then
	touch /var/lib/$program_name/current_version
	echo "# created file: /var/lib/$program_name/current_version"
fi


# update current version file
echo $version > /var/lib/$program_name/current_version
echo "# current version updated"


# install version specific files
if [ ! -d /usr/lib/$program_name/$program_name-v$version/ ]
then
	mkdir /usr/lib/$program_name/$program_name-v$version/
	echo "# created folder: /usr/lib/$program_name/$program_name-v$version/"
fi


# copy program files to /var/lib
cp `pwd`/* -r /usr/lib/$program_name/$program_name-v$version/
echo "# copied files to: /usr/lib/$program_name/$program_name-v$version/"


# update permissions for executables
chmod 755 /usr/lib/$program_name/$program_name-v$version/301gen*.sh
echo "# updated permissions: 755 /usr/lib/$program_name/$program_name-v$version/301gen*.sh"


if [ -f ./manual/301gen.1 ]
then
	if [ -d /usr/local/share/man/man1/ ]
	then
		# copy manual file
		cp ./manual/301gen.1 /usr/local/share/man/man1/

		# refresh system man pages
		mandb -q
		echo "# man page updated for 301gen"
	fi
fi


# create soft links in /usr/bin
unlink /usr/bin/301gen 2>/dev/nul
ln -s /usr/lib/$program_name/$program_name-v$version/301gen.sh /usr/bin/301gen
echo "# soft link created: /usr/bin/301gen"


echo "# installation complete"
echo ""

exit
