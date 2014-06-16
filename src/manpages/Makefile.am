#! /usr/bin/env bash
##########################################################################
##									##
## Script ID: src/manpages/Makefile.am					##
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
## 16/06/2014	MG	1.0.1	Started versioning of this script.	##
##									##
##########################################################################


manpagessrcdir = $(srcdir)

../../manpages/multiget.1: Makefile
	mkdir -p $(@D)
	rm -f $@
	txt2man -t multiget -s 1 -v "Multiple File Download Manual" \
		$(manpagessrcdir)/$(@F).txt > $@

multiget.1: $(manpagessrcdir)/multiget.1.txt

man1_MANS = ../../manpages/multiget.1

EXTRA_DIST = $(manpagessrcdir)/multiget.1.txt
