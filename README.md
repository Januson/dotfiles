# dotfiles

chezmoi diff --dry-run \
  --source ~/Projects/Other/dotfiles/home \
  --override-data-file home/data/work.toml | grep model
