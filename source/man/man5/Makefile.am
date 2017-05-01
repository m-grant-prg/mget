#! /usr/bin/env bash
#########################################################################
#									#
# Script ID: source/man/man5/Makefile.am				#
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
# 19/06/2014	MG	1.0.1	Started versioning of this script.	#
# 27/08/2014	MG	1.0.2	Change name to mget to avoid package	#
#				name duplication in Ubuntu.		#
# 20/10/2015	MG	1.0.3	Restructure to conform to AutoTools	#
#				General Template v1.0.5.		#
# 01/05/2017	MG	1.0.4	Output from $(edit) was being ignored.	#
#									#
#########################################################################


mget.5: Makefile
	mkdir -p $(@D)
	rm -f $@ $@.tmp
	$(edit) $(srcdir)/$(@F).txt > $@.tmp
	txt2manwrap $(@F) 5 "Multiple File Download Manual" $@.tmp $@
	rm -f $@.tmp

mget.5: $(srcdir)/mget.5.txt

man_MANS = mget.5

EXTRA_DIST = $(srcdir)/mget.5.txt

CLEANFILES = *.tmp mget.5
