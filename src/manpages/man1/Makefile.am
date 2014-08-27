#! /usr/bin/env bash
##########################################################################
##									##
## Script ID: src/manpages/man1/Makefile.am				##
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
## 16/06/2014	MG	1.0.1	Started versioning of this script.	##
## 19/06/2014	MG	1.0.2	Introduce man1 and man5 sub-directories	##
##				of src/manpages				##
## 27/08/2014	MG	1.0.3	Change name to mget to avoid package	##
##				name duplication in Ubuntu.		##
##									##
##########################################################################


manpagessrcdir = $(srcdir)

../../../manpages/man1/mget.1: Makefile
	mkdir -p $(@D)
	rm -f $@
	txt2man -t mget -s 1 -v "Multiple File Download Manual" \
		$(manpagessrcdir)/$(@F).txt > $@

mget.1: $(manpagessrcdir)/mget.1.txt

man1_MANS = ../../../manpages/man1/mget.1

EXTRA_DIST = $(manpagessrcdir)/mget.1.txt
