# define modules runtine quarantine configuration
set -xg MODULES_RUN_QUARANTINE 'LD_LIBRARY_PATH'

# setup quarantine if defined
set _mlre '';
for _mlv in (string split ' ' $MODULES_RUN_QUARANTINE)
  if string match -r '^[A-Za-z_][A-Za-z0-9_]*$' $_mlv >/dev/null
     if set -q $_mlv
        set _mlre $_mlre$_mlv"_modquar='$$_mlv' "
     end
     set _mlrv "MODULES_RUNENV_$_mlv"
     set _mlre "$_mlre$_mlv='$$_mlrv' "
  end
end
if [ -n "$_mlre" ]
  set _mlre "env $_mlre"
end

# define module command and surrounding initial environment (default value
# for MODULESHOME, MODULEPATH, LOADEDMODULES and parse of init/.modulespath)
eval $_mlre /usr/bin/tclsh $HOME/abci-utils/Modules/modulecmd.tcl fish autoinit | source -

# clean temp variables used to setup quarantine
set -e _mlre; set -e _mlv; set -e _mlrv;

# no switchml definition since there is no Fish support in C version

# setup ENV variables to get module defined in sub-shells (works for 'sh'
# and 'ksh' in interactive mode and 'sh' (zsh-compat), 'bash' and 'ksh'
# (zsh-compat) in non-interactive mode.
# set -xg ENV /usr/share/Modules/init/profile.sh
# set -xg BASH_ENV /usr/share/Modules/init/bash

if not contains /usr/share/Modules/bin $PATH
   set -xg PATH /usr/share/Modules/bin $PATH
end

set manpath (manpath ^/dev/null)
if not string match -q '*:/usr/share/man:*' :$manpath:
   if [ -z $manpath ]
      set -xg MANPATH /usr/share/man
   else
      set -xg MANPATH /usr/share/man:$manpath
   end
end
