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
export KUBE_EDITOR="subl"
export GOPATH=$HOME/workspace/go-apps
export PATH=$PATH:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin:$GOPATH/bin

# Adding local bin folder and other "stuff" for custom scripts
export PATH=$PATH:$HOME/workspace/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/workspace/cmdline-apps/sonarlint-cli-2.0/bin

# Adding entries for Google Cloud SDK
export PATH=$PATH:/usr/local/google-cloud-sdk/bin

# Adding entries for AWS CLI
export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH=$PATH:$HOME/workspace/python-apps/heighlinerenv/bin

# Adding entries for Istio
export PATH="$PATH:/Users/anasharm/workspace/istio/bin"

# Aliases specific to being productive
function dp() {
    if [[ ! -z $1 ]]; then
        podname=$1
    else
        podname="debugpod"
    fi
    if [[ ! -z $2 ]]; then
        command=$2
    else
        command="bash"
    fi
    kubectl exec -it "${podname}" -- "${command}"
}
alias ls='ls --color=auto'
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
alias pping='prettyping --nolegend'
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
alias sshalln='ssh -o ProxyCommand="ssh ubuntu@173.37.28.222 nc %h %p"'
alias sshrtpstg='ssh -o ProxyCommand="ssh ubuntu@64.102.181.47 nc %h %p"'
alias sshallnstg='ssh -o ProxyCommand="ssh ubuntu@173.37.28.233 nc %h %p"'
alias sshrcdnstg='ssh -o ProxyCommand="ssh ubuntu@173.37.68.30 nc %h %p"'
alias gcssh="gcloud compute ssh"
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

function rand() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

alias gcls="gcloud compute instances list"
alias dols="doctl compute droplet list"
alias awsls='aws ec2 describe-instances --query "Reservations[*].Instances[*].{instance_id: InstanceId, type: InstanceType, ip_address_private: PrivateIpAddress, ip_address_public: PublicIpAddress, instance_state: State.Name, vpc_id: VpcId, subnet_id: SubnetId, availability_zone: Placement.AvailabilityZone, image_id: ImageId, ebs_volume_id: BlockDeviceMappings[0].Ebs.VolumeId}" --output table'
alias awsgw='aws ec2 describe-internet-gateways --query "InternetGateways[*].{internet_gateway_id: InternetGatewayId, vpc_id: Attachments[0].VpcId, state: Attachments[0].State}" --output table'
alias awsvpc='aws ec2 describe-vpcs --query "Vpcs[*].{vpc_id: VpcId, cidr_block: CidrBlock, state: State}" --output table'
alias awssub='aws ec2 describe-subnets --query "Subnets[*].{vpc_id: VpcId, subnet_id: SubnetId, availability_zone: AvailabilityZone, cidr_block: CidrBlock, public_network: MapPublicIpOnLaunch}" --output table'
alias awssec='aws ec2 describe-security-groups --query "SecurityGroups[*].{vpc_id: VpcId, group_id: GroupId, group_name: GroupName, group_description: Description}" --output table'
alias awsrt='aws ec2 describe-route-tables --query "RouteTables[*].{route_table_id: RouteTableId, vpc_id: VpcId}" --output table'
alias kc='kotlinc'
alias ki='kotlinc-jvm'
alias gr='groovy'
alias grc='groovyc'
alias g_java='java -cp /usr/local/groovy/libexec/lib/groovy-2.4.12.jar:.'
alias mk='minikube'
alias ms='minishift'
alias sk='skaffold'
alias h='helm'
export TILLER_NAMESPACE="tiller-code"
alias ky='ksync'
alias dr='draft'
alias o='openstack'
alias rhc='rhc 2>/dev/null' #Or log into laeusr-prod2-01.cisco.com with anasharm

# Aliases specific to Python based development
alias p='python3'
alias p2='python2'
alias pipup='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U'

# Aliases specific to Swift based development
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
alias swc='swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'
alias sw='swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'

# Aliases specific to DevOps tools
alias v='vagrant'
alias d='docker'
alias dm='docker-machine'
alias a='ansible'
alias ap='ansible-playbook'
alias tf='terraform'
alias t='tmux'
alias r='redis-cli'

# Aliases specific to Public Cloud
alias dco='doctl compute'

# Source: https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
# Add the following to your shell init to set up gpg-agent automatically for every shell
# eval $(gpg-agent --daemon)

ulimit -n 8192

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

# The next line enables shell command completion for aws.
if [ -f '/Users/anasharm/Library/Python/3.7/bin/aws_zsh_completer.sh' ]; then source '/Users/anasharm/Library/Python/3.7/bin/aws_zsh_completer.sh'; fi

# kubectl completion
# source <(kubectl completion zsh)

# stern completion
# source <(stern --completion=zsh)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If you want to start a new tmux session remotely (while connecting using ssh)
function ssht () {/usr/bin/ssh -X -t $@ "tmux attach -t development || tmux new -s development";}

# Alias to run bare bones Vim
alias vimn='vim -u .dotfiles/vim/vimrc-essential'

# Alias for running update
alias u="$HOME/.dotfiles/update-mac.sh"

# Kube PS1 configurations
# KUBE_PS1_CTX_COLOR="black"
# KUBE_PS1_NS_COLOR="blue"
# KUBE_PS1_SYMBOL_COLOR="blue"
KUBE_PS1_CTX_COLOR="yellow"
KUBE_PS1_SYMBOL_USE_IMG="true"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
kubeon

# Public Cloud Tokens
export DO_TOKEN=$(head -1 ~/.config/doctl/config.yaml | awk '{print $2}')
#SSH_ID=$(doctl compute ssh-key list | grep "anand" | cut -d' ' -f1)
#export DO_SSH_KEY_FINGERPRINT=$(doctl compute ssh-key get $SSH_ID --format FingerPrint --no-header)
export AWS_ACCESS_KEY_ID=$(cat ~/.aws/credentials | grep -i aws_access_key_id | awk -F ' = ' '{print $2}')
export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/credentials | grep -i aws_secret_access_key | awk -F ' = ' '{print $2}')

# Cisco Cloud Login
export OS_AUTH_URL="https://cloud-rtp-1.cisco.com:5000/v3"
export OS_IDENTITY_API_VERSION=3
export OS_PROJECT_NAME="CICD-POC"
export OS_PROJECT_DOMAIN_NAME="cisco"
export OS_USERNAME="anasharm"
export OS_USER_DOMAIN_NAME="cisco"
#export OS_PASSWORD="" if you do not want to be prompted to enter your password again and again

### EVERYTHING BELOW THIS LINE IS FOR LOCAL SPINNAKER INSTALL
# NVM post-installation requirements
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

FRONT50=http://localhost:8080
FIAT=http://localhost:7003
ORCA=http://localhost:8083
ROSCO=http://localhost:8087
IGOR=http://localhost:8088
REDIS=redis://localhost:6379
ECHO=http://localhost:8089
CLOUDDRIVER=http://localhost:7002
DECK=http://localhost:9000
GATE=http://localhost:8084

