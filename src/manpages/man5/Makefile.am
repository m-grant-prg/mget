#! /usr/bin/env bash
##########################################################################
##									##
## Script ID: src/manpages/man5/Makefile.am				##
## Author: Mark Grant							##
##									##
## Purpose:								##
## Automake script file to generate mget manual pages from source.	##
##									##
##########################################################################

##########################################################################
##									##
## Changelog								##
##									##
## Date		Author	Version	Description				##
##									##
## 19/06/2014	MG	1.0.1	Started versioning of this script.	##
## 27/08/2014	MG	1.0.2	Change name to mget to avoid package	##
##				name duplication in Ubuntu.		##
##									##
##########################################################################


manpagessrcdir = $(srcdir)

../../../manpages/man5/mget.5: Makefile
	mkdir -p $(@D)
	rm -f $@
	txt2man -t mget -s 5 -v "Multiple File Download Manual" \
		$(manpagessrcdir)/$(@F).txt > $@

mget.5: $(manpagessrcdir)/mget.5.txt

man5_MANS = ../../../manpages/man5/mget.5

EXTRA_DIST = $(manpagessrcdir)/mget.5.txt
