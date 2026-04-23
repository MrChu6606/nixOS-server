# nix helpers
alias nr='sudo nixos-rebuild switch --flake $HOME/nixOS-server\#server'
alias nt='sudo nixos-rebuild switch --flake $HOME/nixOS-server\#server --dry-run'

alias ec='nvim $HOME/nixOS-server/flake.nix'
alias apt='cd $HOME/nixOS-server/modules/ && nvim packages.nix'

alias y='yazi'

nupdate() {
  flake_dir=${1:-$PWD} # default to current dir if no argument
  echo "Updating flake in $flake_dir..."
  nix flake update "$flake_dir"

  # Check if flake.lock changed
  if ! git diff --quiet flake.lock; then
    echo "Commiting update flake.lock..."
    git add flake.lock
    git commit -m "Update flake inputs"
  else
    echo "flake.lock unchanged, nothing to commit."
  fi

  echo "Rebuilding system..."
  sudo nixos-rebuild switch --flake "$flake_dir#server"
}

nupdate-test() {
  flake_dir=${1:-$PWD}
  echo "Updating flake in $flake_dir..."
  nix flake update "$flake_dir"
  echo "Testing rebuild..."
  sudo nixos-rebuild test --flake "$flake_dir#server"
}

#etc
alias gping='ping -c4 google.com'
alias ping4='ping -c4'

