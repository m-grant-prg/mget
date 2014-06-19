#! /usr/bin/env bash
##########################################################################
##									##
## Script ID: src/manpages/man5/Makefile.am				##
## Author: Mark Grant							##
##									##
## Purpose:								##
## Automake script file to generate multiget manual pages from source.	##
##									##
##########################################################################

##########################################################################
##									##
## Changelog								##
##									##
## Date		Author	Version	Description				##
##									##
## 19/06/2014	MG	1.0.1	Started versioning of this script.	##
##									##
##########################################################################


manpagessrcdir = $(srcdir)

../../../manpages/man5/multiget.5: Makefile
	mkdir -p $(@D)
	rm -f $@
	txt2man -t multiget -s 5 -v "Multiple File Download Manual" \
		$(manpagessrcdir)/$(@F).txt > $@

multiget.5: $(manpagessrcdir)/multiget.5.txt

man5_MANS = ../../../manpages/man5/multiget.5

EXTRA_DIST = $(manpagessrcdir)/multiget.5.txt
