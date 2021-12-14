

  ____   ___  __                  
 |___ \ / _ \/_ |                 
   __) | | | || | __ _  ___ _ __  
  |__ <| | | || |/ _  |/ _ \  _ \ 
  ___) | |_| || | (_| |  __/ | | |
 |____/ \___/ |_|\__, |\___|_| |_|
                  __/ |           
                 |___/   



301 Link Generator



# Contact: https://www.linkedin.com/in/steadfastpine/

# Release Date: 2019-06-07
# Version: .3



Description

	Creates an apache webs server compliant file for website redirection.
	Input lists of paths from an old website, then enter a new domain.



Prerequisites

	Bash Shell

	Operating Systems

		Linux

			Centos
			Redhat
			Fedora



Installation

		Download and unzip the program files, then change working directory to them:
		
			# cd 301-link-generator


		Next, run the installation script:

			# ./install.sh

	
		This will install the following files and folders:

			write protected library files, version specific
				/usr/lib/301-link-generator/301-link-generator-$version	

			storage for lists of generated words
				/var/lib/301-link-generator

			man page for wg				
				/usr/local/share/man/man1/301gen.1		

			input paths from website to be redirected
				/var/lib/301-link-generator/input-paths.txt	

			output file for apache 301 website redirection
				/var/lib/301-link-generator/output-apache-301.txt	



Options

		-d	domain of new website target

		-s	use https for target

		-r	redirect to target root

		-v 	enables verbose output

		-h 	display options



Usage
	
	Generate an apache compliant 301 redirect file from input-paths.txt 

	# 301gen targetdomain.com

	
	Set https enabled for target link

	# 301gen -s -d targetdomain.com




License 

	This program is licensed under the GPL License, view the LICENSE.md file for more information.





































------------------------------------------------------------------------------------------














# Program:	Word Generator
# Created:	2018-03-15
# Version:	.1
# Language:	Shell

# Author:	Scott Forsberg
# Contact:	contact.scottforsberg@gmail.com
# Website:	https://github.com/pinebase/



Description

Generate words of various lengths and composition. Types include randomly generated words, and compound words made up of smaller terms.



Installation

Change directory to the folder which contains the word generator program. Then, access the program via the "./" command prefix to specify filed located in the current working directory.

example:

cd /home/username/Downloads/word-generator
$ ./wg.sh 



Copywrite

MIT Liscense



Options

		Word Generator - (wg)

		switch options

		-l 	set number of letters per word 5-7
			default is 6

		-r	use real words, combinations of 3 and 4 letter random words

		-v 	enables verbose output

		-w 	set number of words to generate, default is 1

		-? 	display options



		Word Generator Domian Check - (wg-domain-check)

		switch options

		-a	check words found in ~/.word-generator/words_to_check.txt
			default setting
			overrides inididual word input check

		-i 	input word
			example: ./check.sh i test -v

		-v 	enables verbose output

		-? 	display options






