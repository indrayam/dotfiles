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
alias dm='docker-machine'
alias ds='docker swarm'
alias a='ansible'
alias ap='ansible-playbook'
alias tf='terraform'
alias t='tmux'

# Aliases specfic to public clouds
alias gcssh="gcloud compute ssh"
alias gcip='curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip'
function dossh() {
    if [[ ! -z $1 ]]; then
        instance=$1
    else
        instance="demo"
    fi
    if [[ ! -z $2 ]]; then
        userid=$2
    else
        userid="anasharm"
    fi
    doctl compute ssh "${instance}" --ssh-user "${userid}"
}
alias gcls="gcloud compute instances list"
alias dols="doctl compute droplet list"

# ulimit -n 8192

# Setting LSCOLORS. Set the folder colors to bold and yellow 
# Source: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
LS_COLORS=$LS_COLORS:'di=1;33:' ; export LS_COLORS

