function command_exists () {
  type "$1" &> /dev/null
}

function def_real_alias () {
  while [[ $# -ge 2 ]]; do
    alias "$1=$2"
    shift 2
  done
}

function def_real_aliases () {
  def_real_alias $real_aliases
  unset real_aliases
}

function def_global_alias () {
  while [[ $# -ge 2 ]]; do
    alias -g "$1=$2"
    shift 2
  done
}

function def_global_aliases () {
  def_global_alias $global_aliases
  unset global_aliases
}

function def_fun () {
  while [[ $# -ge 2 ]]; do
    eval "function $1 () { $2 \$@ }"
    shift 2
  done
}

function def_funs () {
  def_fun $funs
  unset funs
}

function def_env_var () {
  while [[ $# -ge 2 ]]; do
    export "$1=$2"
    shift 2
  done
}

function def_env_vars () {
  def_env_var $env_vars
  # unset env_vars
}
