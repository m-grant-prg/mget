#########################################################################
#									#
# Author: Copyright (C) 2013-2019, 2021, 2024  Mark Grant		#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0-only					#
#									#
# Purpose:								#
# AutoMake script file to generate mget manual pages from source.	#
#									#
#########################################################################


mget.1: Makefile
	mkdir -p $(@D)
	rm -f $@ $@.tmp
	$(edit) $(srcdir)/$(@F).man.in > $@.tmp
	targfile=$(@F);	\
	if [[ $$targfile == *"."* ]]; then \
		if [[ $${targfile##*.} == "" ]]; then \
			echo "Source file suffix used as section but empty."; \
			exit 1; \
		else \
			section=$${targfile##*.}; \
		fi; \
	else \
		echo "Source file suffix used as section but no dot & empty."; \
		exit 1; \
	fi; \
	txt2manwrap $(@F) $$section "Multiple File Download Manual" $@.tmp $@
	rm -f $@.tmp

mget.1: $(srcdir)/mget.1.man.in

man_MANS = mget.1

EXTRA_DIST = $(srcdir)/mget.1.man.in

CLEANFILES = *.tmp mget.1
