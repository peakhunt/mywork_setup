# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

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

ARM_LINARO_LINUX=~/gcc-linaro-6.3.1-2017.05-i686_arm-linux-gnueabihf/bin
ARM_LINARO_BARE_METAL=~/tools/toolchains/cortex-a/gcc-linaro-4.9-2014.11-x86_64_arm-eabi/bin
#ARM_LINARO_CORTEXM=~/tools/toolchains/cortex-m/gcc-arm-none-eabi-4_9-2014q4/bin
ARM_LINARO_CORTEXM=~/tools/toolchains/cortex-m/gcc-arm-none-eabi-7-2017-q4-major/bin
export ARMGCC_DIR=/home/hawk/tools/toolchains/cortex-m/gcc-arm-none-eabi-7-2017-q4-major
XTENSA_SDK=/home/hawk/tools/toolchains/xtensa/esp-open-sdk/xtensa-lx106-elf/bin:/home/hawk/work/esp-idf/xtensa-esp32-elf/bin

JLINK_LINUX=~/tools/JLink_Linux_V498d_x86_64
SAM_BA=~/tools/sam-ba_cdc_linux

ENERGIA=~/tools/energia-0101E0015

ATMEL_TOOLS=$JLINK_LINUX:$SAM_BA
QT5_X86=~/Qt5.4.1/5.4/gcc_64/bin

SEGGER=/opt/SEGGER/JLink
STLINK=/home/hawk/work/stlink

DEPO_TOOLS=/home/hawk/work/depot_tools

OPENWRT_MIPS=/home/hawk/tools/toolchains/OpenWrt-Toolchain-ar71xx-generic_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-0.9.33.2/bin

NWJS=/home/hawk/nwjs-v0.12.3-linux-x64

QUARTUS=~/intelFPGA_lite/16.1/quartus/bin/

AARCH64_TOOLCHAIN=/home/hawk/work/espressobin/toolchain/gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu/bin

export STAGING_DIR=/home/hawk/tools/toolchains/OpenWrt-SDK-ar71xx-generic_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64/staging_dir
MY_TOLLS=$DEPO_TOOLS:$ENERGIA:$ATMEL_TOOLS:$QT5_X86:$SEGGER:$STLINK:$NWJS:$XTENSA_SDK

#export COCOS_DIR=/home/hawk/work/cocos2d-x/cocos2d-x-3.14.1:/home/hawk/work/cocos2d-x/cocos2d-x-3.14.1/tools/cocos2d-console/bin
export COCOS_DIR=/home/hawk/work/cocos2d-x/cocos2d-x-3.16:/home/hawk/work/cocos2d-x/cocos2d-x-3.16/tools/cocos2d-console/bin

export PATH=$AARCH64_TOOLCHAIN:$QUARTUS:$ARM_LINARO_LINUX:$COCOS_DIR:$MY_TOLLS:$ARM_LINARO_CORTEXM:$PATH

export PRU_CGT=/home/hawk/work/ti/ti-cgt-pru_2.1.4


alias vi='gvim'
alias cpplint='python /home/hawk/cpplint-0.0.9/cpplint.py'
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

function O()
{
  local file

  if [ $# -ne 1 ]
  then
    echo "error: O filename"
    return
  fi

  file=$1

  filename=${file%.*}
  extension=${file##*.}

  case ${extension} in
  'pdf')
    xdg-open $file &
    ;;
  'png' | 'jpg')
    display $file &
    ;;
  *)
    echo "unknown extension: $extension"
    ;;
  esac
}

export QSYS_ROOTDIR="/media/hawk/work/intelFPGA_lite/17.0/quartus/sopc_builder/bin"

export ALTERAOCLSDKROOT="/home/hawk/altera_lite/15.1/hld"
