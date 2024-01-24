# Add vendor bin directories to path when needed

# We need to keep a copy of $PATH to make sure we can reset when we leave a project directory.
export ORIGINAL_PATH=$PATH

function _vendor_bin() {
  # We always want $path to be the original $PATH.
  path=(${(s/:/)ORIGINAL_PATH})

  # If we're currently located within a project and we have a bin dir from a
  # language-specific package manager, add the relevant dir(s) to $PATH.
  if git rev-parse 2>/dev/null; then
    root_dir=$(git rev-parse --show-toplevel)

    # composer
    if [ -d "$root_dir/vendor/bin" ]; then
      path+=("$root_dir/vendor/bin")
    fi

    # node
    if [ -d "$root_dir/node_modules/.bin" ]; then
      path+=("$root_dir/node_modules/.bin")
    fi

    # Make sure it's unique.
    typeset -U path
  fi
}

precmd_functions+=_vendor_bin
