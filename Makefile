# Generated automatically from Makefile.in by configure.
#
#  Generated automatically from Makefile.in by configure.
#

srcdir = .

CC = gcc
CPP = gcc -E
#CC = clang
#CPP = clang -E

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

DEFS = -DHAVE_CONFIG_H
LIBS = 

CPPFLAGS = 
CFLAGS = -Wall -O2
LDSTATIC = 
LDFLAGS = 

SHELL_PROG = pdksh

prefix = /usr/local
exec_prefix = ${prefix}
transform=s,x,x,

bindir = $(exec_prefix)/bin
mandir = $(prefix)/man/man$(manext)
manext = 1

# Suffix for executables: nothing for unix, .exe for os/2.
exe_suffix=

SHELL = /bin/sh

SRCS = alloc.c c_ksh.c c_sh.c c_test.c c_ulimit.c edit.c emacs.c \
	eval.c exec.c expr.c history.c io.c jobs.c lex.c mail.c \
	main.c misc.c missing.c path.c shf.c sigact.c syn.c table.c trap.c \
	tree.c tty.c var.c version.c vi.c
OBJS = alloc.o c_ksh.o c_sh.o c_test.o c_ulimit.o edit.o emacs.o \
	eval.o exec.o expr.o history.o io.o jobs.o lex.o mail.o \
	main.o misc.o missing.o path.o shf.o sigact.o syn.o table.o trap.o \
	tree.o tty.o var.o version.o vi.o
HDRS = c_test.h edit.h expand.h ksh_dir.h ksh_limval.h ksh_stat.h ksh_time.h \
	ksh_times.h ksh_wait.h lex.h proto.h sh.h shf.h sigact.h \
	table.h tree.h tty.h
DISTFILES = $(SRCS) $(HDRS) ksh.Man \
	conf-end.h acconfig.h \
	mkinstalldirs install-sh new-version.sh siglist.in siglist.sh mkman \
	check-fd.c check-pgrp.c check-sigs.c \
	README NEWS CONTRIBUTORS LEGAL PROJECTS INSTALL NOTES BUG-REPORTS \
	IAFA-PACKAGE ChangeLog ChangeLog.0 stamp-h.in
# ETCFILES also disted, but handled differently
ETCFILES = etc/ksh.kshrc etc/profile etc/sys_config.sh
# MISCFILES also disted, but handled differently
MISCFILES = misc/ChangeLog.sjg misc/Changes.jrm misc/Changes.mlj \
	misc/Changes.pc misc/README.sjg misc/ReadMe.eg misc/ReadMe.emacs \
	misc/ReadMe.jrm misc/Bugs 
# TESTFILES also disted, but handled differently
TESTFILES = tests/README tests/th tests/th-sh tests/alias.t tests/arith.t \
	tests/bksl-nl.t tests/brkcont.t tests/cdhist.t tests/eglob.t \
	tests/glob.t tests/heredoc.t tests/history.t tests/ifs.t \
	tests/integer.t tests/lineno.t tests/read.t tests/regress.t \
	tests/syntax.t tests/unclass1.t tests/unclass2.t \
	tests/version.t 
OS2FILES = os2/Makefile os2/config.h os2/config.status \
	os2/emacs.out os2/kshrc.ksh os2/make.sed os2/os2.c os2/os2siglist.out \
	os2/README.os2 os2/NEWS.os2 os2/os2bugs os2/th.cmd os2/config.cache

all: $(SHELL_PROG)$(exe_suffix) $(SHELL_PROG).1

# This shouldn't be first - some makes don't know about PRECIOUS and assume it
# is the default target.
.PRECIOUS: Makefile

.c.o:
	$(CC) -c $(CPPFLAGS) $(DEFS) -I. -I$(srcdir) $(CFLAGS) $<

install: installdirs all
	$(INSTALL_PROGRAM) $(SHELL_PROG)$(exe_suffix) $(bindir)/`echo $(SHELL_PROG)|sed '$(transform)'`$(exe_suffix)
	-$(INSTALL_DATA) $(SHELL_PROG).1 $(mandir)/`echo $(SHELL_PROG)|sed '$(transform)'`.$(manext)
	-@prog=$(bindir)/`echo $(SHELL_PROG)|sed '$(transform)'`$(exe_suffix);\
	    test -f /etc/shells \
	    && (grep "^$$prog\$$" /etc/shells > /dev/null \
		|| echo \
"NOTE: /etc/shells does not contain $$prog \
      you should add it if you want to set your shell to $(SHELL_PROG)")

installdirs:
	$(srcdir)/mkinstalldirs $(bindir) $(mandir)

uninstall:
	rm -f $(bindir)/`echo $(SHELL_PROG)|sed '$(transform)'`$(exe_suffix)
	rm -f $(mandir)/`echo $(SHELL_PROG)|sed '$(transform)'`.$(manext)

check test:
	$(srcdir)/tests/th-sh $(srcdir)/tests/th -s $(srcdir)/tests -p ./$(SHELL_PROG)$(exe_suffix) -C pdksh,sh,ksh,posix,posix-upu $(TESTARGS)

$(SHELL_PROG)$(exe_suffix): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

# two steps to prevent the creation of a bogus tmpksh.1
$(SHELL_PROG).1: $(srcdir)/ksh.Man
	$(srcdir)/mkman $(SHELL_PROG) $(srcdir)/ksh.Man > tmpksh.1
	mv tmpksh.1 $(SHELL_PROG).1

info:
	@echo "No info (yet)"

# two steps to prevent the creation of a bogus siglist.out
siglist.out: config.h sh.h siglist.in siglist.sh
	$(srcdir)/siglist.sh "$(CC) $(CPPFLAGS) $(DEFS) -I. -I$(srcdir)" < $(srcdir)/siglist.in > tmpsiglist.out
	mv tmpsiglist.out siglist.out

# two steps to prevent the creation of a bogus emacs.out
emacs.out: emacs.c
	$(srcdir)/emacs-gen.sh $(srcdir)/emacs.c > tmpemacs.out
	mv tmpemacs.out emacs.out

debugtools: check-fd$(exe_suffix) check-sigs$(exe_suffix) \
	check-pgrp$(exe_suffix)

check-fd.o check-pgrp.o check-sigs.o: config.h
check-fd$(exe_suffix): check-fd.o
	$(CC) $(LDFLAGS) -o $@ check-fd.o $(LIBS)

check-pgrp$(exe_suffix): check-pgrp.o
	$(CC) $(LDFLAGS) -o $@ check-pgrp.o $(LIBS)

check-sigs$(exe_suffix): check-sigs.o
	$(CC) $(LDFLAGS) -o $@ check-sigs.o $(LIBS)

TAGS: $(SRCS) $(HDRS)
	cd $(srcdir) && etags $(SRCS) $(HDRS)

tags: $(SRCS) $(HDRS)
	cd $(srcdir) && ctags -wt $(SRCS) $(HDRS)

clean:
	rm -f pdksh$(exe_suffix) sh$(exe_suffix) pdksh.1 sh.1 $(OBJS) siglist.out \
	      emacs.out core a.out mon.out gmon.out \
	      version.c.bak Makefile.bak Makefile.tmp check-fd$(exe_suffix) \
	      check-pgrp$(exe_suffix) check-sigs$(exe_suffix)

mostlyclean: clean

#distclean: clean
#	rm -f Makefile config.h stamp-h config.status config.log config.cache \
#	      tags TAGS *~

#realclean: distclean

dist: $(DISTFILES) $(ETCFILES) $(MISCFILES) $(TESTFILES) $(OS2FILES)
	cd $(srcdir) && \
	  { \
	    ./new-version.sh; \
	    FNAME=pdksh-`sed -e '/"@(.)/!d' \
		    -e 's/[^0-9]*\([0-9.]*\).*/\1/' -e q version.c`; \
	    if test `echo $$FNAME|tr . ' '|wc -w|sed 's/[       ]*//g'` -gt 3; \
	    then \
		FNAME=`echo $$FNAME | sed 's/pdksh-/pdksh-unstable-/'`; \
	    fi; \
	    echo Creating version $$FNAME; \
	    rm -rf $$FNAME; \
	    mkdir $$FNAME $$FNAME/etc $$FNAME/misc $$FNAME/tests $$FNAME/os2; \
	    cp -p $(DISTFILES) $$FNAME; \
	    cp -p $(ETCFILES) $$FNAME/etc; \
	    cp -p $(MISCFILES) $$FNAME/misc; \
	    cp -p $(TESTFILES) $$FNAME/tests; \
	    cp -p $(OS2FILES) $$FNAME/os2; \
	    ./emacs-gen.sh emacs.c > os2/emacs.out; \
	    test -x ./Dist-fixup && ./Dist-fixup $$FNAME; \
	    sed -f os2/make.sed < $$FNAME/Makefile.in > $$FNAME/os2/Makefile; \
	    chmod -R a+rX,u+w,og-w $$FNAME; \
	    tar chzf $$FNAME.tar.gz $$FNAME; \
	    find $$FNAME -print | xargs pathchk -p; \
	  }

depend: $(SRCS)
	sed -n '1,/[ ]PUT ANYTHING BELOW THIS LINE/p' < Makefile > Makefile.tmp
	srcs=; for i in $(SRCS) ; do srcs="$$srcs $(srcdir)/$$i"; done; \
	  $(CC) -M $(DEFS) -I. -I$(srcdir) $(CFLAGS) $$srcs | \
	    sed -e 's?[ 	]/[^ 	]*??g' -e 's?[ 	]./? ?g' \
		-e 's?[ 	]$(srcdir)//*? ?g' -e 's?^$(srcdir)//*??' \
		-e '/^[ 	]*\\[	 ]*$$/d' -e '/^[^:]*:[	 ]*$$/d' \
		-e 's/^\([	 ]*\)$$/ sh.h/' \
	    >> Makefile.tmp
	mv Makefile.tmp Makefile
	@echo 'Make depend done (stopping make)'; false

# DON'T PUT ANYTHING BELOW THIS LINE (and don't delete it - its for make depend)
alloc.o: alloc.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h
c_ksh.o: c_ksh.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h \
 sh.h
c_sh.o: c_sh.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_time.h \
 ksh_times.h \
 sh.h
c_test.o: c_test.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h c_test.h
c_ulimit.o: c_ulimit.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_time.h \
 sh.h
edit.o: edit.c config.h conf-end.h sh.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h tty.h \
 edit.h \
 ksh_stat.h
emacs.o: emacs.c config.h conf-end.h sh.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_dir.h \
 edit.h emacs.out
eval.o: eval.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h \
 ksh_dir.h \
 ksh_stat.h
exec.o: exec.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h c_test.h \
 ksh_stat.h
expr.o: expr.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h \
 sh.h
history.o: history.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h
io.o: io.c \
 sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h
jobs.o: jobs.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_wait.h \
 ksh_times.h ksh_time.h \
 tty.h \
 sh.h
lex.o: lex.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h \
 sh.h
mail.o: mail.c config.h conf-end.h sh.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_time.h \
 sh.h
main.o: main.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_time.h \
 sh.h
misc.o: misc.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h \
 sh.h
missing.o: missing.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_dir.h \
 ksh_time.h \
 ksh_times.h \
 sh.h
path.o: path.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h
shf.o: shf.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h ksh_limval.h \
 sh.h
sigact.o: sigact.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h
syn.o: syn.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h c_test.h
table.o: table.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h
trap.o: trap.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h siglist.out
tree.o: tree.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h
tty.o: tty.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_stat.h tty.h \
 sh.h
var.o: var.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h ksh_time.h \
 ksh_limval.h \
 ksh_stat.h \
 sh.h
version.o: version.c sh.h config.h conf-end.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h
vi.o: vi.c config.h conf-end.h sh.h \
 shf.h table.h tree.h expand.h lex.h \
 proto.h \
 ksh_stat.h edit.h
