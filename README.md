# kash
My shell version from debian patched pdksh.
---
My kash is mainly focusing on interactive shells.
I use vi editing mode, so I will try to fix any bug found in it. I added supports for arrow keys and Home, End, PgUp, PgDn, so the cursor can be moved easier.
I also added programmed tab-completion, just like bash. It's kind of complicated, though. And there still may be bugs. OK, let me introduce the programmed tab-completion to you.

you may first need to edit your $HOME/.kshrc to setup your tab-completion configurations. some lines of mine looks like:

<pre>
complete 'sudo=C'
complete 'git=S:add,:status,:commit,clone,:diff,:log'
complete 'svn=S:add,:status,:commit,checkout,@--diff-cmd,:diff,:log'
complete 'systemctl=F_systemctl'
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

</pre>

for now it does not support special char like space or quotations, anyway, almost nobody would like to use those things as command line options!
