###### MacOSX

##################
### MacOS specific
##################

# MacOS specific configurations
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias matrix='cmatrix'
alias pb='pbcopy'

# Add GNU binaries (from Brew)
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Added by Toolbox App
export PATH="/Users/anasharm/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

# Swift
alias swc='swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk'
alias sw='swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk'

# GNU Compiler Collection (gcc, g++ and gfortran)
# gcc is softlinked to /opt/homebrew/bin/gcc-14
# g++ is softlinked to /opt/homebrew/bin/g++-14
# gfortran is softlinked to /opt/homebrew/bin/gfortran-14

## VMs
# VMWare Fusion Command Line Tools
# export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library/vkd/bin:/Applications/VMware\ Fusion.app/Contents/Library"

# VirtualBox
#alias vbox='vboxmanage'

# Vagrant
#alias v='vagrant'

# Multipass
alias m='multipass'

###################
### Unix-y specific
###################

# Basic CLI setup
export EDITOR='nvim'
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/opt/curl/bin"
export GPG_TTY=$(tty)
alias ls='ls --color=auto'
alias c='clear'
alias tree='tree -C'
alias latest='find . -mtime -30 -type f | grep -v DS_Store'
export PATH=$PATH:$HOME/bin
function rand() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}
ulimit -n 8192
# Setting LSCOLORS. Set the folder colors to bold and yellow 
# Source: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
LS_COLORS=$LS_COLORS:'di=1;33:' ; export LS_COLORS

## Zsh
# Zsh completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# TIMEFMT environment variable for zsh's built-in time function
TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'

# Alias for fd
alias fda='fd -IH'

# Alias for ripgrep
alias rga='rg -uuu'
alias rgf='rg --files | rg'

## Tmux
alias t='tmux'
# Settings for tmux window renaming
export DISABLE_AUTO_TITLE=true
# If you want to start a new tmux session remotely (while connecting using ssh)
function ssht () {
    /usr/bin/ssh -X -t $@ "tmux attach -t development || tmux new -s development";
}

## z
[ -f $DOTFILES_HOME/z/z.sh ] && source $DOTFILES_HOME/z/z.sh

## Tidy Viewer
alias tv='tidy-viewer'

# bat
export BAT_THEME="Monokai Extended"
export BAT_STYLE="plain"

#####################################
### Dev Tools, Programming Languages
#####################################

## Git
alias g='git'
alias gbage='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias gll='gitloglive'
alias grch='generaterandomchanges'
alias cdr='cd $(git rev-parse --show-toplevel)'

## Python
alias p='python'
alias pipup='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U'
# source .venv/default/bin/activate

# uv settings
UV_PYTHON_PREFERENCE="managed-only"
# UV_PYTHON_DOWNLOADS="never"

# conda settings
# source /opt/conda/etc/profile.d/conda.sh
# source ~/.pyenv/env3.12/bin/activate

## Rust
alias r='rustc'
alias ms='miniserve'
source $HOME/.cargo/env

## Go
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH
# Add Go binary path (MacOS specific)
# Not required as brew adds the go binary to the PATH

## JVM Languages
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
alias j='java'
alias jc='javac'

## JavaScript Runtimes
# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias n='node'

# deno
source "$HOME/.deno/env"

# bun
# bun completions
[ -s "/home/anand/.bun/_bun" ] && source "/home/anand/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## Ruby
# Added by `rbenv init` on Fri Oct 11 20:23:55 UTC 2024
eval "$(rbenv init - --no-rehash zsh)"

## Fortran
alias f='gfortran'

## Julia
path=('/Users/anasharm/.juliaup/bin' $path)
export PATH
alias jl='julia'

#################
### Public Clouds 
#################

## DigitalOcean
alias dols="doctl compute droplet list"
alias dco="doctl compute"
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
#export DO_TOKEN=$(head -1 ~/.config/doctl/config.yaml | awk '{print $2}')
#SSH_ID=$(doctl compute ssh-key list | grep "anand" | cut -d' ' -f1)
#export DO_SSH_KEY_FINGERPRINT=$(doctl compute ssh-key get $SSH_ID --format FingerPrint --no-header)

## AWS
#export AWS_ACCESS_KEY_ID=$(cat ~/.aws/credentials | grep -i aws_access_key_id | awk -F ' = ' '{print $2}')
#export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/credentials | grep -i aws_secret_access_key | awk -F ' = ' '{print $2}')
#export PATH=/usr/local/aws-cli/v2/current/bin:$PATH
alias a="aws"
export AWS_PROFILE="east2"
alias awsls='aws ec2 describe-instances --query "Reservations[*].Instances[*].{id: InstanceId, type: InstanceType, image: ImageId, ip: PrivateIpAddress, ip_pub: PublicIpAddress, state: State.Name, vpc: VpcId, subnet: SubnetId, az: Placement.AvailabilityZone, ebs: BlockDeviceMappings[0].Ebs.VolumeId}"'
alias awsgw='aws ec2 describe-internet-gateways --query "InternetGateways[*].{internet_gateway_id: InternetGatewayId, vpc_id: Attachments[0].VpcId, state: Attachments[0].State}"'
alias awsvpc='aws ec2 describe-vpcs --query "Vpcs[*].{vpc_id: VpcId, cidr_block: CidrBlock, state: State}"'
alias awssub='aws ec2 describe-subnets --query "Subnets[*].{vpc_id: VpcId, subnet_id: SubnetId, availability_zone: AvailabilityZone, cidr_block: CidrBlock, public_network: MapPublicIpOnLaunch}"'
alias awssec='aws ec2 describe-security-groups --query "SecurityGroups[*].{vpc_id: VpcId, group_id: GroupId, group_name: GroupName, group_description: Description}"'
alias awsrt='aws ec2 describe-route-tables --query "RouteTables[*].{route_table_id: RouteTableId, vpc_id: VpcId}"'
## Turn it off if they start to take a lot of time
# complete -C '/usr/local/aws/bin/aws_completer' aws
function awslogs() {
    if [[ ! -z $1 ]]; then
        loggroupname=$1
    else
        loggroupname="undefined"
    fi
    if [[ ! -z $2 ]]; then
        logstreamname=$2
    else
        logstreamname="undefined"
    fi
    if [[ ! -z $3 ]]; then
        numofentries=$3
    else
        numofentries="50"
    fi    
    aws logs get-log-events --log-group-name "$loggroupname" --log-stream-name "$logstreamname" --limit "$numofentries"
}

## GCP
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
## Turn it off if they start to take a lot of time
# if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
alias gcssh="gcloud compute ssh"
alias gcls="gcloud compute instances list"
#alias gcip='curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip'

## OpenStack
alias o='openstack'
alias ols='openstack server list'

# Set to Cisco Cloud Account(s)
function csco() {
    profile="cisco"
    gcloud config configurations activate "${profile}" # switch GCP profile
    showcloud
}

# Set to Personal Cloud Account(s)
function my() {
    profile="default"
    az_subscription_id="8cf5d499-2e9b-4161-a3b7-8c6747241dbb"

    export AWS_PROFILE="${profile}" # switch AWS profile
    gcloud config configurations activate "${profile}" # switch GCP profile
    showcloud
}

# Show Current Cloud Settings
function showcloud() {
    echo "AWS Profile Settings: "
    aws configure list
    echo
    echo "GCP Profile Settings: "
    gcloud config configurations list
    echo
}

##############################################
### VMs, Containers & Container Orchestrators 
##############################################

## Containers
# Docker
alias d='docker'
alias drm='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dls='docker image ls'
alias dcls='docker container ls -a'
# Not installing this on a Cisco MacOS since we do not support docker
# alias lzd='lazydocker'

# Podman (OPTIONAL)
alias pd='podman'
#export DOCKER_HOST='unix:///Users/anasharm/.local/share/containers/podman/machine/qemu/podman.sock'
alias pdrm='podman stop $(podman ps -a -q) && podman rm $(podman ps -a -q)'
alias pdls='podman image ls'
alias pdcls='podman container ls -a'

# Kubectl and related K8s tools
# kubectl completion
## Turn it off if they start to take a lot of time
# source <(kubectl completion zsh)
export KUBE_EDITOR="nvim"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'
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

# stern completion
## Turn it off if they start to take a lot of time
# source <(stern --completion=zsh)
alias s="stern"

# helm
alias h="helm"

# Debugpod
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

# Minikube
# alias mkstart="minikube start --memory='2000mb' --cpus=2 --vm-driver=virtualbox"
alias mk='minikube'

################
### DevOps Tools
################

## Terraform/Terragrunt
alias tf='terraform'
alias tg='terragrunt'

## Ansible
alias an="ansible"

## Jfrog CLI configurations
## Turn it off if they start to take a lot of time
# autoload -Uz compinit
# compinit
# source /Users/anasharm/.jfrog/jfrog_zsh_completion


############################
### Data-Intensive App Tools
############################

# sqlite3
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

## postgres

## kafka

## duckdb

##################
### Security Tools
##################

## GPG
# Source: https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
# Add the following to your shell init to set up gpg-agent automatically for every shell
# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
if [ -n "$(pgrep gpg-agent)" ]; then
    echo "GnuPG Agent is running"
else
    eval $(gpg-agent --daemon --default-cache-ttl 31536000)
fi

###############################
### Cisco specific configurations
###############################

# Cisco Vault configurations
function vls() {
    if [[ ! -z $1 ]]; then
        secret_path="secret/$1"
    else 
        secret_path="secret/"
    fi
    vault kv list "${secret_path}"
}
function vget() {
    if [[ ! -z $1 ]]; then
        secret_path="secret/$1"
    else 
        secret_path="secret/"
    fi
    vault kv get "${secret_path}"
}

alias vpls='vault policy list'
alias cta='export VAULT_TOKEN=$CTA_TOKEN'
alias ctos='export VAULT_TOKEN=$CTOS_TOKEN'
alias ctu='export VAULT_TOKEN=$CTU_TOKEN'
# export VAULT_ADDR='https://internal-keeper.cisco.com'
# export VAULT_NAMESPACE='ciscoit/ns_ciscoit-codeon'
export VAULT_NAMESPACE='ciscoit/ns_ciscoit-vaultnerds'

## codectl install or upgrade
function getstable () {
  curl -LO https://repo-art.cisco.com/artifactory/codectl/stable/latest/codectl-darwin-amd64 && sudo install codectl-darwin-amd64 /usr/local/bin/codectl
  rm codectl-darwin-amd64
  codectl
}

function getnightly () {
  nightly_date=$(curl -s https://repo-art.cisco.com/artifactory/codectl/nightly/version.json | jq -r .latestVersion)
  curl -LO https://repo-art.cisco.com/artifactory/codectl/nightly/${nightly_date}/codectl-darwin-amd64 && sudo install codectl-darwin-amd64 /usr/local/bin/codectl-nightly
  rm codectl-darwin-amd64
  codectl-nightly
}

function getrc () {
  rc_version=$(curl -s https://repo-art.cisco.com/artifactory/codectl/rc/version.json | jq -r .latestVersion)
  curl -LO https://repo-art.cisco.com/artifactory/codectl/rc/${rc_version}/codectl-darwin-amd64 && sudo install codectl-darwin-amd64 /usr/local/bin/codectl-rc
  rm codectl-darwin-amd64
  codectl-rc
}

alias ctln='codectl-nightly'
alias ctlr='codectl-rc'
alias ctl='codectl'

# Source into Cisco Openstack RTP Cluster
source ~/bin/rtp
# sourcing my tijori
source ~/.tijori

# Philip's goodies
alias current-id='find-id git $(git config --get remote.origin.url)'

###############################
### Let's make it look right...
###############################

# Get the terminal ready
clear

# Display Om
cat $HOME/.om
w

