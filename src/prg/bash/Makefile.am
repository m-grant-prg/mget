#! /usr/bin/env bash
#########################################################################
#									#
# Script ID: src/prg/bash/Makefile.am					#
# Author: Copyright (C) 2013-2018  Mark Grant				#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0					#
#									#
# Purpose:								#
# AutoMake script file to generate mget script from source.		#
#									#
#########################################################################

#########################################################################
#									#
# Changelog								#
#									#
# Date		Author	Version	Description				#
#									#
# 16/06/2014	MG	1.0.1	Started versioning of this script.	#
# 27/08/2014	MG	1.0.2	Change name to mget to avoid package	#
#				name duplication in Ubuntu.		#
# 01/09/2014	MG	1.0.3	Add DWNUTIL substitution enabled from	#
#				configure.ac to support which of wget	#
#				or fetch is in use.			#
# 28/11/2014	MG	1.0.4	Add script substitution variable for	#
#				overall package version.		#
# 26/06/2015	MG	1.0.5	Remove BSD support.			#
# 20/10/2015	MG	1.0.6	Restructure to conform to AutoTools	#
#				General Template v1.0.5.		#
# 01/05/2017	MG	1.0.7	Rename source file extension .sh.in	#
# 03/12/2017	MG	1.0.8	Add SPDX license tags to source files.	#
# 10/02/2018	MG	1.0.9	Change file's header for new directory	#
#				names.					#
#									#
#########################################################################


mget: Makefile
	mkdir -p $(@D)
	rm -f $@ $@.tmp
	test -f ./$@.sh.in || srcdir=$(srcdir)/; \
	$(edit) $${srcdir}$(@F).sh.in > $@.tmp
	mv $@.tmp $@
	chmod a+x $@
mget: $(srcdir)/mget.sh.in

bin_SCRIPTS = mget

EXTRA_DIST = $(srcdir)/mget.sh.in

CLEANFILES = *.tmp mget
