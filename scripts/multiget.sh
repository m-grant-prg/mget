#! /usr/bin/env bash
##########################################################################
##									##
##	multiget.sh is automatically generated,				##
##		please do not modify!					##
##									##
##########################################################################

##########################################################################
##									##
## Script ID: multiget.sh						##
## Author: Mark Grant							##
##									##
## Purpose:								##
## Retrieves one or more files whose URL's are specified in a text file.##
##                                                              	##
## Syntax:      multiget.sh [OPTIONS]					##
##			[OPTIONS] are:-					##
##	-g group Save target file with 'group' owner.			##
##		Does not persist between invocations.			##
##		i.e. Ignored by option -p.				##
##	-h Displays usage information.					##
##	-o owner Save target file with 'owner' owner.			##
##		Does not persist between invocations.			##
##		i.e. Ignored by option -p.				##
##	-p Saves command line options for future use.			##
##	-s sourcefile Name of the file containing the URL's of files to	##
##		be fetched.						##
##	-t targetdir Directory in which to store retieved files.	##
##	-v Displays version information.				##
##	-w Use Windows CR/LF instead of Unix LF line endings.		##
##									##
## Exit Codes:	0 & 64 - 113 as per C/C++ standard			##
##		0 - success						##
##		64 - Invalid arguments					##
##		66 - File access error					##
##		67 - trap received					##
##		77 - Permissions error					##
##									##
##########################################################################

##########################################################################
##									##
## Changelog								##
##									##
## Date		Author	Version	Description				##
##									##
## 29/04/2013	MG	1.0.1	Created.Does not implement mail		##
##				notification.				##
## 30/04/2013	MG	1.0.2	Corrected Error status section on man	##
##				page. Introduced sed processing on	##
##				source file to ensure it has Unix type	##
##				line endings. Removed part implemented	##
##				'MailTo' option.			##
##									##
##########################################################################


####################
## Init variables ##
####################
script_exit_code=0
version="1.0.2"			# set version variable
etclocation=/usr/local/etc	# Path to etc directory

# Get system name for implementing OS differeneces.
osname=$(uname -s)

conffile=".multiget"
ownergroup=FALSE
owner=FALSE
persist=FALSE
sourcefile=""
targetdir=""
windows=FALSE

###############
## Functions ##
###############

# Standard function to log and mail $1, cleanup and return exit code
script_exit()
{
	if [ $script_exit_code = 0 ]
	then
		echo "$1"
	else
		echo "$1" 1>&2
	fi
	exit $script_exit_code
}

# Standard trap exit function
trap_exit()
{
	script_exit_code=67
	script_exit "Script terminating due to trap received. Code: "$script_exit_code
}

# Setup trap
trap trap_exit SIGHUP SIGINT SIGTERM

# Function to write config file.
write_file()
{
	echo "sourcefile="$sourcefile>>~/.multiget
	echo "targetdir="$targetdir>>~/.multiget
}

##########
## Main ##
##########
# If config file exists, read it, else, create it.
if [ ! -f ~/$conffile ]
then
	write_file
else
	IFS="="
	exec 3<~/$conffile
	while read -u3 -ra input
	do
		case ${input[0]} in
		sourcefile)
			sourcefile=${input[1]}
			;;
		targetdir)
			targetdir=${input[1]}
			;;
		esac
	done
	exec 3<&-
fi

# Process command line arguments with getopts.
while getopts :g:ho:ps:t:vw arg
do
	case $arg in
	g)	ownergroup=TRUE
		newownergroup=$OPTARG
		;;
	h)	echo "Usage is $0 [OPTIONS]"
		echo "	[OPTIONS] are:-"
		echo "	'-g group' Save target file with 'group' owner."
		echo "		Does not persist between invocations."
		echo "		i.e. Ignored by option -p."
		echo "	'-h' Displays usage information."
		echo "	'-o owner' Save target file with 'owner' owner."
		echo "		Does not persist between invocations."
		echo "		i.e. Ignored by option -p."
		echo "	'-p' Saves command line options for future use."
		echo "	'-s sourcefile' Name of file containing source URL's."
		echo "	'-t targetdir' Name of directory for storing retrieved files."
		echo "	'-v' Displays version information."
		echo "	'-w' Use Windows CR/LF line endings instead of Unix LF line endings."
		exit 0
		;;
	o)	owner=TRUE
		newowner=$OPTARG
		;;
	p)	persist=TRUE
		;;
	s)	sourcefile=$OPTARG
		;;
	t)	targetdir=$OPTARG
		;;
	v)	echo "$0 version "$version
		exit 0
		;;
	w)	windows=TRUE
		;;
	:)	script_exit_code=64
		script_exit "$0: Must supply an argument to -$OPTARG."
		;;
	\?)	script_exit_code=64
		script_exit "$0: Invalid argument -$OPTARG."
		;;
	esac
done

# If only persist flag set then nothing to do, exit.
if [ $# = 1 -a "$1" = "-p" ]
then
	exit 0
fi

# Check source file exists and is readable.
if [ ! -f $sourcefile ]
then
	script_exit_code=66
	script_exit "Source file not valid."
fi
if [ ! -r $sourcefile ]
then
	script_exit_code=77
	script_exit "Source file not accessible."
fi

# Now ensure source file is in Unix text format.
sed -i 's/\r$//' $sourcefile

# Check target directory exists and is writable.
if [ ! -d $targetdir ]
then
	script_exit_code=66
	script_exit "Target directory not valid."
fi
if [ ! -w $targetdir ]
then
	script_exit_code=77
	script_exit " Target directory not accessible."
fi

# Now get the files
IFS="/"
exec 3<"$sourcefile"
while read -u3 -ra input
do
	outputfile=${input[${#input[*]}-1]}
	case $osname in
	FreeBSD)
		echo "Attempting to get file."
		fetch -o "$targetdir/$ouputfile" "${input[*]}"
		status=$?
		echo "File get completed with status " $status
		
		((script_exit_code = script_exit_code + status))
	;;
	Linux)
		echo "Attempting to get file."
		wget --no-check-certificate -O "$targetdir/$outputfile" "${input[*]}"
		status=$?
		echo "File get completed with status " $status
		
		((script_exit_code = script_exit_code + status))
	;;
	esac
	
	if [ $script_exit_code = 0 ]
	then
		# If Windows CR/LF line ending required, convert.
		if [ $windows = TRUE ]
		then
			sed -i 's/$/\r/' "$targetdir/$outputfile"
		fi
		# If persist is TRUE, save parameters.
		if [ $persist = TRUE ]
		then
			rm ~/$conffile
			write_file
		fi
		if [ $owner = TRUE ]
		then
			chown $newowner "$targetdir/$outputfile"
		fi
		if [ $ownergroup = TRUE ]
		then
			chown :$newownergroup "$targetdir/$outputfile"
		fi
	fi
done
exec 3<&-

# And exit
script_exit "Script complete with exit code: "$script_exit_code
