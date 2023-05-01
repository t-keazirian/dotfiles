 97 # export ARCHFLAGS="-arch x86_64"
 98
 99 # Set personal aliases, overriding those provided by oh-my-zsh libs,
100 # plugins, and themes. Aliases can be placed here, though oh-my-zsh
101 # users are encouraged to define aliases within the ZSH_CUSTOM folder.
102 # For a full list of active aliases, run `alias`.
103 #
104 # Example aliases
105 # alias zshconfig="mate ~/.zshrc"
106 # alias ohmyzsh="mate ~/.oh-my-zsh"
107 # alias hello="echo hello there"
108
109 # echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
110
111 # ruby
112 eval "$(rbenv init -)"
113
114 alias gl='clear && git log --all --decorate --oneline --graph'
115 alias ga='git add .'
116 alias gc='git commit -v'
117 alias gco='git checkout'
118 alias gs='clear && git status'
119
120 alias openz="vim ~/.zshrc"
121 alias openv="vim ~/.vimrc"
122 alias update="source ~/.zshrc"
123 alias ll="ls -aGl"
124 alias git-pull-all='for i in */.git; do (cd $i/..; echo "** pulling ${i} ** branch: $(git rev-parse --abbrev-ref HEAD)"; git pull --recurse-submodules; echo ""; ); done'
125 alias open-git-config='git config --global --edit'
126
127 . /usr/local/opt/asdf/libexec/asdf.sh
128
129   export NVM_DIR="$HOME/.nvm"
130   [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
131   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
132
133   # place this after nvm initialization!
134 autoload -U add-zsh-hook
135 load-nvmrc() {
136   local node_version="$(nvm version)"
137   local nvmrc_path="$(nvm_find_nvmrc)"
138
139   if [ -n "$nvmrc_path" ]; then
140     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
141
142     if [ "$nvmrc_node_version" = "N/A" ]; then
143       nvm install
144     elif [ "$nvmrc_node_version" != "$node_version" ]; then
145       nvm use
146     fi
147   elif [ "$node_version" != "$(nvm version default)" ]; then
148     echo "Reverting to nvm default version"
149     nvm use default
150   fi
151 }
152 add-zsh-hook chpwd load-nvmrc
153 load-nvmrc
"~/.zshrc" 153L, 5595B
