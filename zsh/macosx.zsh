# aliases specific to MacOSX
alias c='clear'
alias arc='clang -fobjc-arc *.m'
alias v='mvim --remote-silent'
alias t='tmux'
alias tm='/usr/bin/time'
alias swc='swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'
alias sw='swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias gpg='gpg2'
alias m='mvn'

# aliases specific to vagrant
alias tc='tmux new -s'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

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
export VIM_APP_DIR="/Applications/MacVim-snapshot-73"
export EDITOR='subl -w'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Adding entries for Java, Groovy and Gradle
alias j='java'
alias jc='javac'
alias gr='groovy'
alias grc='groovyc'
alias grd='gradle -q --daemon'
alias grq='gradle -q'
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home"
export GRADLE_HOME="/usr/local/opt/gradle/libexec"
export GRADLE_OPTS="-Xmx1024m"
export GROOVY_HOME="/usr/local/opt/groovy/libexec"
export M2_HOME="/usr/local/Cellar/maven/3.3.3/libexec"
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
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/"

# My personal aliases
alias a='ansible'
alias ap='ansible-playbook'
alias gll='gitloglive'
alias grch='generaterandomchanges'
alias cjp='createjavaproject'
alias csp='createsublimeproject'
alias cig='creategitignore'
alias p2='python'
alias p='python3'
alias d='docker'
alias dm='docker-machine'

# Adding path for Tomcat8 startup.sh and shutdown.sh
export PATH=$PATH:/Library/Tomcat/bin
export CATALINA_HOME="/Library/Tomcat"

# Adding local bin folder for custom scripts
export PATH=$PATH:$HOME/workspace/bin
