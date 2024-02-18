#########################################################################
#									#
# Author: Copyright (C) 2013-2019, 2021, 2024  Mark Grant		#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0-only					#
#									#
# Purpose:								#
# AutoMake script file to generate mget script from source.		#
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
