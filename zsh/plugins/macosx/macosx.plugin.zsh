### MacOSX ###

# Settings for tmux window renaming
export DISABLE_AUTO_TITLE=true

# Basic Environment variables
export EDITOR='subl -w'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export GPG_TTY=$(tty)

# Adding entries for Java, Groovy and Gradle
export JAVA_HOME="/usr/local/java"
export GROOVY_HOME="/usr/local/opt/groovy"
export GRADLE_HOME="/usr/local/opt/gradle"
export GRADLE_OPTS="-Xmx1024m"
export M2_HOME="/usr/local/opt/maven@3.5"
export GOPATH=$HOME/workspace/go-apps
export PATH=$PATH:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin:$GOPATH/bin

# Adding entries for Oracle Instant Client, TOAD, sqlplus
export ORACLE_HOME="$HOME/local/oracle"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH="$PATH:$HOME/local/instantclient_11_2"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$HOME/local/instantclient_11_2"
export TNS_ADMIN="$HOME/local/oracle/network/admin"
export CLASSPATH="$CLASSPATH:$ORACLE_HOME"

# Adding entries for OpenShift
export MINISHIFT_HOME="/Users/anasharm/workspace/cloudy-apps/minishift"

# Adding local bin folder and other "stuff" for custom scripts
export PATH=$PATH:$HOME/workspace/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/workspace/cmdline-apps/sonarlint-cli-2.0/bin

# Adding entries for Google Cloud SDK
export PATH=$PATH:/usr/local/google-cloud-sdk/bin
source /usr/local/google-cloud-sdk/completion.zsh.inc

# Aliases specific to being productive
alias ls='ls --color=auto'
alias c='clear'
alias top10fa='find . -type f -exec du -Sh {} + | sort -rh | head -n 10'
alias top10f='find . -type d \( -iregex ".*git" -o -iregex ".*svn" \) -prune -o -type f -exec du -Sh {} + | sort -rh | head -n 10'
alias top10da='du -Sh | sort -rh | head -n 10'
alias top10d='du -Sh --exclude=".git" --exclude=".svn" | sort -rh | head -n 10'

# MacBook specific
alias tm='/usr/bin/time'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias clocm='cloc --quiet --force-lang-def=$HOME/.cloc_definitions.txt --exclude-lang="Ant,Ada,Maven,DTD,XML,YAML,JSON,Visualforce Component" --exclude-dir=.settings,.openshift,.idea --counted=allc.txt .'

# Aliases specific to Git
alias g='git'
alias gbage='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias gll='gitloglive'
alias grch='generaterandomchanges'

# svn aliases (good ideas here: https://github.com/grexi/snippets/blob/master/svnaliases/branchit.rc)
export SVN_EDITOR="/usr/local/bin/vim"
alias sva='svn add'
alias sim='svn import -m'
alias sup='svn update'
alias sl='svn log'
alias sls='svn log| svn-short-log'
alias sll='svn log -v'
alias ss='svn status -u'
alias sd='svn diff'
alias sci='svn commit'
alias sco='svn checkout'
alias sinf='svn info'
alias sau='svn log -q|grep "|"|awk "{print \$3}"|sort|uniq -c|sort -nr'
function _svnbl {
    svn ls -R | egrep -v -e "\/$" | xargs svn blame | awk '{print $2}' | sort | uniq -c | sort -r
}
alias sbl=_svnbl

# Aliases specific to JVM based development
alias j='java'
alias jc='javac'
alias k='kubectl'
alias i='istioctl'
alias kx='kubectx'
alias kn='kubens'
alias kt='kubetail'
alias s="stern"
alias kon="kubeon"
alias koff="kubeoff"
alias gcssh="gcloud compute ssh"
alias kc='kotlinc'
alias ki='kotlinc-jvm'
alias gr='groovy'
alias grc='groovyc'
alias g_java='java -cp /usr/local/groovy/libexec/lib/groovy-2.4.12.jar:.'
alias ms='minishift'
alias mk='minikube'

# Aliases specific to Python based development
alias p='python3'
alias p2='python2'
alias pipup='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U'

# Aliases specific to Node based development
alias n='node'

# Aliases specific to Ruby based development
alias cr='crystal'
alias r='ruby'

# Aliases specific to Swift based development
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
alias swc='swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'
alias sw='swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'

# Aliases specific to DevOps tools
alias v='vagrant'
alias d='docker'
alias a='ansible'
alias ap='ansible-playbook'
alias tf='terraform'
alias t='tmux'

# Aliases specific to Public Cloud
alias dco='doctl compute'

# Source: https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
# Add the following to your shell init to set up gpg-agent automatically for every shell
eval $(gpg-agent --daemon)

ulimit -n 8192

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

# If you want to start a new tmux session remotely (while connecting using ssh)
function ssht () {/usr/bin/ssh -X -t $@ "tmux attach -t development || tmux new -s development";}

# Alias to run bare bones Vim
alias vimn='vim -u .dotfiles/vim/vimrc-essential'

# Alias for running update
alias u="$HOME/.dotfiles/update-mac.sh"

# Kube PS1 configurations
KUBE_PS1_CTX_COLOR="yellow"
KUBE_PS1_SYMBOL_USE_IMG="true"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"


