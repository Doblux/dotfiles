# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export TERM=xterm-256color

# CUSTOM ALIASES
alias cat='/bin/bat'
alias ls='lsd -lah'
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias r='ranger'

source /usr/share/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


#KEYBINDINGS

bindkey "^[[H" beginning-of-line # TECLA INICIO ME MANDA AL PRINCIPIO
bindkey "^[[F" end-of-line # TECLA FIN ME MANDA AL FINAL DE LA LINEA
bindkey "^[[3~" delete-char # TECLA SUPR ME BORRA UN CARACTER
bindkey "^[[1;3C" forward-word # TECLA ALT + FLECHA DERECHA FINAL O COMIENZO DE PALABRA
bindkey "^[[1;3D" backward-word  # TECLA ALT + FLECHA IZQUIERDA  FINAL O COMIENZO DE PALABRA

