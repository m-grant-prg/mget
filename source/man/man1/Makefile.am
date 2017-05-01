#! /usr/bin/env bash
#########################################################################
#									#
# Script ID: source/man/man1/Makefile.am				#
# Author: Mark Grant							#
#									#
# Purpose:								#
# AutoMake script file to generate mget manual pages from source.	#
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
# 01/05/2017	MG	1.0.5	Output from $(edit) was being ignored.	#
#				Rename source file extension .man.in	#
#									#
#########################################################################


mget.1: Makefile
	mkdir -p $(@D)
	rm -f $@ $@.tmp
	$(edit) $(srcdir)/$(@F).man.in > $@.tmp
	txt2manwrap $(@F) 1 "Multiple File Download Manual" $@.tmp $@
	rm -f $@.tmp

mget.1: $(srcdir)/mget.1.man.in

man_MANS = mget.1

EXTRA_DIST = $(srcdir)/mget.1.man.in

CLEANFILES = *.tmp mget.1
