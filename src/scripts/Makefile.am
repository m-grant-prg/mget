#! /usr/bin/env bash
##########################################################################
##									##
## Script ID: src/scripts/Makefile.am					##
## Author: Mark Grant							##
##									##
## Purpose:								##
## Automake script file to generate mget script from source.		##
##									##
##########################################################################

##########################################################################
##									##
## Changelog								##
##									##
## Date		Author	Version	Description				##
##									##
## 16/06/2014	MG	1.0.1	Started versioning of this script.	##
## 27/08/2014	MG	1.0.2	Change name to mget to avoid package	##
##				name duplication in Ubuntu.		##
## 01/09/2014	MG	1.0.3	Add DWNUTIL substitution enabled from	##
##				configure.ac to support which of wget	##
##				or fetch is in use.			##
## 28/11/2014	MG	1.0.4	Add script substitution variable for	##
##				overall package version.		##
##									##
##########################################################################


edit = sed \
	-e 's|@bindir[@]|$(bindir)|g' \
	-e 's|@pkgdatadir[@]|$(pkgdatadir)|g' \
	-e 's|@sysconfdir[@]|$(sysconfdir)|g' \
	-e 's|@prefix[@]|$(prefix)|g' \
	-e 's|@DWNUTIL[@]|$(DWNUTIL)|g' \
	-e 's|@pkgversion[@]|$(pkgversion)|g'

scriptssrcdir = $(srcdir)

../../scripts/mget: Makefile
	mkdir -p $(@D)
	rm -f $@ $@.tmp
	test -f ./$@.in || scriptssrcdir=$(scriptssrcdir)/; \
	$(edit) $${scriptssrcdir}$(@F).in >$@.tmp

	mv $@.tmp $@

	chmod a+x $@

mget: $(scriptssrcdir)/mget.in

bin_SCRIPTS = ../../scripts/mget

EXTRA_DIST = $(scriptssrcdir)/mget.in
