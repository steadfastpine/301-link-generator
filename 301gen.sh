#!/bin/bash


# set program variables
program_name="301-link-generator"
version=$(cat /var/lib/$program_name/current_version)


# program display funtions
function display_options(){

	options_text="

		301 Link Generator - options

		version $version

		-d	domain of new website target

		-s	use https for target

		-r	redirect to target root

		-v 	enables verbose output

		-h 	display options


			
		https://github.com/pinebase/$program_name
	"
	echo "$options_text"
	exit
}

function display_liscence(){

	display_text=$(cat /usr/lib/$program_name/$program_name-v$version/COPYING)
	echo "$display_text"
	exit
}


# add --help feature
if [ "$1" == '--help' ]
then
	display_options
fi


# gnu compliant show command output
if [ "$1" == 'show' ]
then
	display_liscence
fi


# process arguments
while getopts 'd:svrh?' c
do
	case $c in 
		d) target_domain=$OPTARG;;
		s) https_enabled='1';;
		r) root_redirect='1';;
		v) verbose='1';;
		h) options;;
		?) options;;
	esac
done	


if [ "$target_domain" == "" ]
then
	target_domain=$1
fi


if [ "$target_domain" == "" ]
then
	echo "# please enter a target domain"
	echo ""
	echo "#	example:"
	echo ""
	echo "#	301gen -d targetdomain.com"
	echo ""
	echo "or"
	echo ""
	echo "#	301gen targetdomain.com"
	echo ""
	exit
fi


# get the list of website paths from input file
paths=$(cat /var/lib/$program_name/input-paths.txt)


# clear previous output
echo "" > /var/lib/$program_name/output-apache-301.txt


# set protocol
if [ "$https_enabled" == "1" ]
then
	protocol="https"
else
	protocol="http"
fi


# iterate through input paths, generating 301 entries
for path in $paths;do

	if [ "$root_redirect" == "1" ]
	then
		redirect_string="redirect 301 $path $protocol://$target_domain"
	else
		redirect_string="redirect 301 $path $protocol://$target_domain$path"
	fi

	if [ "$verbose" == '1' ]
	then
		echo "$redirect_string"
	fi

    echo "$redirect_string" >> /var/lib/$program_name/output-apache-301.txt
done



exit
