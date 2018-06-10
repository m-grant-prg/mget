#! /usr/bin/env bash
#########################################################################
#									#
# Script ID: ./Makefile.am						#
# Author: Copyright (C) 2013-2018  Mark Grant				#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0					#
#									#
# Purpose:								#
# AutoMake script file to generate mget project from source.		#
#									#
#########################################################################

#########################################################################
#									#
# Changelog								#
#									#
# Date		Author	Version	Description				#
#									#
# 16/06/2014	MG	1.0.1	Started versioning of this script.	#
# 19/06/2014	MG	1.0.2	Introduce man1 and man5 sub-directories	#
#				of src/manpages				#
# 27/08/2014	MG	1.0.3	Change name to mget to avoid package	#
#				name duplication in Ubuntu.		#
# 20/10/2015	MG	1.0.4	Restructure to conform to AutoTools	#
#				General Template v1.0.5.		#
# 03/12/2017	MG	1.0.5	Add SPDX license tags to source files.	#
# 10/02/2018	MG	1.0.6	Shorten directory names to reduce	#
#				overall path length.			#
#				Add standard macro directory.		#
# 12/04/2018	MG	1.0.7	Add srctarball target to build a source	#
#				tarball in the build directory. Uses	#
#				git archive to archive HEAD.		#
# 10/06/2018	MG	1.0.8	Add info messages to srctarball target.	#
#									#
#########################################################################


ACLOCAL_AMFLAGS = -I m4


SUBDIRS = src/prg/bash src/man/1 src/man/5


srctarball:
	@cwd="$${PWD}" && \
	cd @srcdir@ && \
	echo "making srctarball from @srcdir@" && \
	echo "GA	@builddir@/@PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar.gz" \
	&& \
	git archive --format=tar.gz \
		--prefix=@PACKAGE_TARNAME@-@PACKAGE_VERSION@/ \
		--output=$${cwd}/@PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar.gz \
		HEAD && \
	cd -
