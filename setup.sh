# Sets the environment up on a new install. Run from my-dotvim dir

if [ ! -z ${ZSH_CUSTOM}]; then
  ln -s $HOME/my-dotvim/zsh_aliases.zsh $ZSH_CUSTOM/galiases.zsh
else
  # link bash files
  ln -s $PWD/.bash_aliases ~/.bash_aliases
  ln -s $PWD/.bashrc.local ~/.bashrc.local
fi

# use precompiled nvim 0.5 
mkdir -p ~/bin
ln -s $PWD/nvim.0.5.0.appimage ~/bin/nvim

# link nvim config
NVIM_CFG=~/.config/nvim
mkdir -p $NVIM_CFG
ln -s $PWD/init.vim $PWD/coc-settings.json $PWD/ftplugin $PWD/plugin $PWD/plugin_configs $PWD/UltiSnippets $NVIM_CFG

