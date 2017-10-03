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

# Basic Environment variables
export EDITOR='subl -w'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export GPG_TTY=$(tty)

# Adding entries for Java, Groovy and Gradle
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
export GRADLE_HOME="/usr/local/opt/gradle/libexec"
export GRADLE_OPTS="-Xmx1024m"
export GROOVY_HOME="/usr/local/opt/groovy/libexec"
export M2_HOME="/usr/local/opt/maven/libexec"
export GOPATH=$HOME/workspace/go-apps
export PATH=$PATH:$JAVA_HOME/bin:$GOPATH/bin:$GROOVY_HOME/bin

# Adding entries for Oracle Instant Client, TOAD, sqlplus
export ORACLE_HOME="$HOME/local/oracle"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH="$PATH:$HOME/local/instantclient_11_2"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$HOME/local/instantclient_11_2"
export TNS_ADMIN="$HOME/local/oracle/network/admin"
export CLASSPATH="$CLASSPATH:$ORACLE_HOME"

# Adding Swift entries
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"

# Adding path for Tomcat8 startup.sh and shutdown.sh
export PATH=$PATH:/Library/Tomcat/bin
export CATALINA_HOME="/Library/Tomcat"

# Adding local bin folder for custom scripts
export PATH=$PATH:$HOME/workspace/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/workspace/cmdline-apps/sonarlint-cli-2.0/bin
ulimit -n 8192

# Aliases specific to software development
alias p='python3'
alias p2='python2'
alias pipup='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U'
alias g='git'
alias n='node'
alias j='java'
alias jc='javac'
alias k='kotlin'
alias kc='kotlinc'
alias ki='kotlinc-jvm'
alias gr='groovy'
alias grc='groovyc'
alias g_java='java -cp /usr/local/opt/groovy/libexec/lib/groovy-2.4.12.jar:.'
alias m='mvn'
alias mq='mvn -q'
alias grd='gradle'
alias grq='gradle -q'
alias grqd='gradle -q --daemon'
alias cr='crystal'
alias r='ruby'

alias d='docker'
alias dm='docker-machine'
alias dco='docker-compose'
alias s='subl'

# Aliases specific to being productive on MacOS X
alias c='clear'
alias arc='clang -fobjc-arc *.m'
alias v='vagrant'
alias t='tmux'
alias tm='/usr/bin/time'
alias swc='swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'
alias sw='swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias ls='/bin/ls -G'
alias a='ansible'
alias ap='ansible-playbook'
alias gll='gitloglive'
alias grch='generaterandomchanges'
alias cjp='createjavaproject'
alias csp='createsublimeproject'
alias cig='creategitignore'
alias clocm='cloc --quiet --force-lang-def=$HOME/.cloc_definitions.txt --exclude-lang="Ant,Ada,Maven,DTD,XML,YAML,JSON,Visualforce Component" --exclude-dir=.settings,.openshift,.idea --counted=allc.txt .'
alias top10fa='find . -type f -exec du -Sh {} + | sort -rh | head -n 10'
alias top10f='find . -type d \( -iregex ".*git" -o -iregex ".*svn" \) -prune -o -type f -exec du -Sh {} + | sort -rh | head -n 10'
alias top10da='du -Sh | sort -rh | head -n 10'
alias top10d='du -Sh --exclude=".git" --exclude=".svn" | sort -rh | head -n 10'
alias gbage='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'

# Aliases specific to tmux
alias tc='tmux new -s'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

# Source: https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
# Add the following to your shell init to set up gpg-agent automatically for every shell
eval $(gpg-agent --daemon)
