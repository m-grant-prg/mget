edit = sed \
	-e 's|@bindir[@]|$(bindir)|g' \
	-e 's|@pkgdatadir[@]|$(pkgdatadir)|g' \
	-e 's|@sysconfdir[@]|$(sysconfdir)|g' \
	-e 's|@prefix[@]|$(prefix)|g'

scriptssrcdir = $(srcdir)/scriptssrc

multiget: Makefile
	rm -f $@ $@.tmp
	test -f ./$@.in || scriptssrcdir=$(scriptssrcdir)/; \
	$(edit) $${scriptssrcdir}$@.in >$@.tmp

	mv $@.tmp $@

	chmod a+x $@

multiget: $(scriptssrcdir)/multiget.in

bin_SCRIPTS = multiget

EXTRA_DIST = multiget $(scriptssrcdir)/multiget.in
