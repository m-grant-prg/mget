edit = sed \
	-e 's|@bindir[@]|$(bindir)|g' \
	-e 's|@pkgdatadir[@]|$(pkgdatadir)|g' \
	-e 's|@sysconfdir[@]|$(sysconfdir)|g' \
	-e 's|@prefix[@]|$(prefix)|g'

scriptssrcdir = $(srcdir)/scriptssrc

multiget.sh: Makefile
	rm -f $@ $@.tmp
	test -f ./$@.in || scriptssrcdir=$(scriptssrcdir)/; \
	$(edit) $${scriptssrcdir}$@.in >$@.tmp

	mv $@.tmp $@

	chmod a+x $@

multiget.sh: $(scriptssrcdir)/multiget.sh.in

bin_SCRIPTS = multiget.sh

EXTRA_DIST = multiget.sh $(scriptssrcdir)/multiget.sh.in
