#########################################################################
#									#
# Script ID: src/man/5/Makefile.am					#
# Author: Copyright (C) 2013-2019  Mark Grant				#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0					#
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
#				Rename source file extension .man.in	#
# 03/12/2017	MG	1.0.5	Determine the manual section from the	#
#				target suffix. If the suffix is blank	#
#				(foo.) or if there is no suffix (foo)	#
#				then error out.				#
#				Add SPDX license tags to source files.	#
# 10/02/2018	MG	1.0.6	Change file's header for new directory	#
#				names.					#
# 02/09/2019	MG	1.0.7	Remove useless shebang.			#
#									#
#########################################################################


mget.5: Makefile
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

mget.5: $(srcdir)/mget.5.man.in

man_MANS = mget.5

EXTRA_DIST = $(srcdir)/mget.5.man.in

CLEANFILES = *.tmp mget.5
