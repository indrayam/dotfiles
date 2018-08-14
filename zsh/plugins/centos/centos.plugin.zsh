### Linux ###

# Settings for tmux window renaming
export DISABLE_AUTO_TITLE=true

# Basic Environment variables
export EDITOR='vim'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export GPG_TTY=$(tty)

# Adding entries for Java, Groovy and Gradle
export JAVA_HOME="/usr/local/java"
export GROOVY_HOME="/usr/local/groovy"
export GRADLE_HOME="/usr/local/gradle"
export GRADLE_OPTS="-Xmx1024m"
export M2_HOME="/usr/local/maven"
export GOPATH=$HOME/workspace/go-apps
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/snap/bin
export PATH=$PATH:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin:$GOPATH/bin:/usr/local/kotlinc/bin

# Adding local bin folder and other "stuff" for custom scripts
export PATH=$PATH:$HOME/workspace/bin
export PATH=$PATH:/usr/local/google-cloud-sdk/bin

# Aliases specific to being productive
alias svim='sudoedit'
alias ls='ls --color=auto'
alias c='clear'
alias top10fa='find . -type f -exec du -Sh {} + | sort -rh | head -n 10'
alias top10f='find . -type d \( -iregex ".*git" -o -iregex ".*svn" \) -prune -o -type f -exec du -Sh {} + | sort -rh | head -n 10'
alias top10da='du -Sh | sort -rh | head -n 10'
alias top10d='du -Sh --exclude=".git" --exclude=".svn" | sort -rh | head -n 10'
alias new='/usr/lib/update-notifier/apt-check --human-readable'

# Aliases specific to Git
alias g='git'
alias gbage='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias gll='gitloglive'
alias grch='generaterandomchanges'

# Aliases specific to JVM based development
alias j='java'
alias jc='javac'
alias k='kotlin'
alias kc='kotlinc'
alias ki='kotlinc-jvm'
alias gr='groovy'
alias grc='groovyc'
alias g_java='java -cp /usr/local/groovy/lib/groovy-2.4.12.jar:.'
alias m='mvn'
alias mq='mvn -q'
alias grd='gradle'

# Aliases specific to Python based development
alias p='python3'
alias p2='python2'
alias pipup='sudo pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip3 install -U'

# Aliases specific to Node based development
alias n='node'

# Aliases specific to Ruby based development
alias cr='crystal'
alias r='ruby'

# Aliases specific to DevOps tools
alias d='docker'
alias a='ansible'
alias ap='ansible-playbook'
alias tf='terraform'
alias t='tmux'

# Aliases specific to Public Cloud
alias dco='doctl compute'

# Source: https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
# Add the following to your shell init to set up gpg-agent automatically for every shell
# alias gpg="gpg2"
eval $(gpg-agent --daemon)

# ulimit -n 8192

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

# Alias for running update
alias u="$HOME/.dotfiles/update-centos.sh"

# Setting LSCOLORS. Set the folder colors to bold and yellow 
# Source: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
LS_COLORS=$LS_COLORS:'di=1;33:' ; export LS_COLORS
