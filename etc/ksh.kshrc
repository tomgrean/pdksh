:
# NAME:
#	ksh.kshrc - global initialization for ksh 
#
# DESCRIPTION:
#	Each invocation of /bin/ksh processes the file pointed
#	to by $ENV (usually $HOME/.kshrc).
#	This file is intended as a global .kshrc file for the
#	Korn shell.  A user's $HOME/.kshrc file simply requires
#	the line:
#		. /etc/ksh.kshrc
#	at or near the start to pick up the defaults in this
#	file which can then be overridden as desired.
#
# SEE ALSO:
#	$HOME/.kshrc
#

# RCSid:
#	$Id: ksh.kshrc,v 1.4 1992/12/05 13:14:48 sjg Exp $
#
#	@(#)Copyright (c) 1991 Simon J. Gerraty
#
#	This file is provided in the hope that it will
#	be of use.  There is absolutely NO WARRANTY.
#	Permission to copy, redistribute or otherwise
#	use this file is hereby granted provided that 
#	the above copyright notice and this notice are
#	left intact. 

case "$-" in
*i*)	# we are interactive
	# we may have su'ed so reset these
	# NOTE: SCO-UNIX doesn't have whoami,
	#	install whoami.sh
	case $UID in
	0) PS1='# ';;
	esac
        PS1=$USER@'$PWD$ '

	# the PD ksh is not 100% compatible
	case "$KSH_VERSION" in
	*PD*)	# PD ksh
		set -o vi
		complete 'sudo=C'
		complete 'git=S:add,:status,:commit,clone,:diff,:log'
		complete 'svn=S:add,:status,:commit,checkout,@--diff-cmd,:diff,:log'
		function _systemctl {
		  typeset ACT='enable disable status start stop'
		  case $# in
		  0)  _COMPLETE="$ACT"
		  ;;
		  1)  typeset -i i=0
		      typeset out a
		      if [[ $1 == "" ]]; then
		        _COMPLETE="$ACT"
		      else
		        for a in $ACT; do
		          if [[ ${a#$1} != $a ]]; then
		            out[$i]=$a
		            ((i++))
		          fi
		        done
		        _COMPLETE=${out[*]}
		      fi
		  ;;
		  2)  _COMPLETE=$(cd /lib/systemd/system/;echo $2*)
		  ;;
		  esac
		}
		complete 'systemctl=F_systemctl'
		;;
	*)	# real ksh ?
		[ -r $HOME/.functions ] && . $HOME/.functions
		;;
	esac
;;
*)	# non-interactive
;;
esac
# commands for both interactive and non-interactive shells

