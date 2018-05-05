# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

alias vi='gvim'
set -o vi

function F()
{
   local FILE
   local PATTERN

   echo -n "Enter files to search:"
   read FILE

   echo -n "Enter string to search:"
   read PATTERN

   set -f

   for filetype in $FILE
   do
      find . -not \( -path ./.svn -prune \) -name "$filetype" -type f -exec grep -n "$PATTERN" {} /dev/null \;
   done

   set +f
}

function touchpad()
{
  case $1 in
  "on")
     echo "turning on touch pad"
     synclient TouchpadOff=0
     ;;
  "off")
     echo "turning on touch off"
     synclient TouchpadOff=1
     ;;
  esac
}

function INDENT()
{
  if [ $# -eq 0 ]
  then
    echo "INDENT <files...>"
    return
  fi

  while [ $# -gt 0 ]
  do
    if [ ! -f $1 ]
    then
      shift
      continue
    fi

    echo "Indenting $1..."
    cat $1 | indent -nsaf -nsai -nprs -nsaw -ncs -npcs -nut -i3 -lp -ts3 -ip0 -di4 -bap -bl -bli0 -o $1
    shift
  done
}

function WC()
{
  local FILE

  echo -n "Enter file patterns to count:"
  read FILE

  find . -name "$FILE" | xargs wc -l
}
