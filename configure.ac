#! /usr/bin/env bash
##########################################################################
##									##
## Script ID: ./configure.ac						##
## Author: Mark Grant							##
##									##
## Purpose:								##
## Autoconfigure script file to configure mget project.			##
##									##
##########################################################################

##########################################################################
##									##
## Changelog								##
##									##
## Date		Author	Version	Description				##
##									##
## 16/06/2014	MG	1.0.1	Started versioning of this script.	##
## 19/06/2014	MG	1.0.2	Introduce man1 and man5 sub-directories	##
##				of src/manpages				##
## 26/06/2014	MG	1.0.3	Use 'git describe --always' for AC_INIT	##
##				version as it returns a value as long	##
##				as there is at least 1 commit, even	##
##				with no tags. If no commits then	##
##				'Pre-Release' is used.			##
## 27/08/2014	MG	1.0.4	Change name to mget to avoid package	##
##				name duplication in Ubuntu.		##
## 01/09/2014	MG	1.0.5	Changed to CHECK_PROGS (from PROG) to	##
##				check for either wget or fetch.		##
##									##
##########################################################################

AC_PREREQ([2.65])
AC_INIT([Multiple File Download], m4_esyscmd([git describe --always 1>/dev/null 2>/dev/null && git describe --always | tr -d '\n' || echo 'Pre-Release' | tr -d '\n']), [m.grant.prg@gmail.com], [mget])

AM_INIT_AUTOMAKE

AC_CONFIG_FILES([Makefile
		 src/scripts/Makefile
		 src/manpages/man1/Makefile
		 src/manpages/man5/Makefile])

# Checks for programs.

AC_CHECK_PROG(BASH, bash, yes, no)
if test "x$BASH" = "xno" ; then
   	AC_MSG_ERROR([bash not found])
fi

AC_CHECK_PROGS(DWNUTIL, wget fetch, no)
if test "x$DWNUTIL" = "xno" ; then
   	AC_MSG_ERROR([neither wget nor fetch found])
fi

AC_CHECK_PROG(TXT2MAN, txt2man, yes, no)
if test "x$TXT2MAN" = "xno" ; then
   	AC_MSG_ERROR([txt2man not found])
fi

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
