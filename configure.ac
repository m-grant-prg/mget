#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.65])
AC_INIT([Multiple File Download], [1.0.4], [m.grant.prg@gmail.com])

AM_INIT_AUTOMAKE

AC_CONFIG_FILES([Makefile
		 scripts/Makefile
		 manpages/Makefile])

# Checks for programs.

AC_CHECK_PROG(BASH, bash, yes, no)
if test "x$BASH" = "xno" ; then
   	AC_MSG_ERROR([bash not found])
fi

AC_CHECK_PROG(WGET, wget, yes, no)
if test "x$WGET" = "xno" ; then
   	AC_MSG_ERROR([wget not found])
fi

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
