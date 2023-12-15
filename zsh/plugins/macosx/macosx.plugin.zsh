###### MacOSX

##################
### MacOS specific
##################

# sourcing my tijori
source ~/.tijori

# MacOS-aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias matrix='cmatrix'
alias pb='pbcopy'

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

# Add GNU binaries (from Brew)
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Exa
alias els='exa --git --icons --color=always --group-directories-first'

# Less
export LESSOPEN="| /usr/local/bin/highlight %s --out-format xterm256 --force"

# Alias for fd
alias fda='fd -IH'

# Alias for ripgrep
alias rga='rg -uuu'
alias rgf='rg --files | rg'

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Tmux
alias t='tmux'
# Settings for tmux window renaming
export DISABLE_AUTO_TITLE=true
# If you want to start a new tmux session remotely (while connecting using ssh)
function ssht () {
    /usr/bin/ssh -X -t $@ "tmux attach -t development || tmux new -s development";
}

## Tidy Viewer
alias tv='tidy-viewer'

# Better rm (Rust based 'rip')
export GRAVEYARD='~/.local/share/Trash'

# Broot
source /Users/anasharm/.config/broot/launcher/bash/br

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

## Gron/Ungron
# Make JSON greppable!
alias ungron="gron --ungron"

## Dasel
export fpath=(~/.dotfiles/zsh/site-functions $fpath)
dasel completion zsh > ~/.dotfiles/zsh/site-functions/_dasel
compinit

#####################################
### Dev Tools, Programming Languages
#####################################

## Vim
# Alias to run bare bones Vim
alias vimn='vim -u .dotfiles/vim/vimrc-essential'

## Git
alias g='git'
alias gbage='for k in `git branch -r | perl -pe '\''s/^..(.*?)( ->.*)?$/\1/'\''`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias gll='gitloglive'
alias grch='generaterandomchanges'
alias cdr='cd $(git rev-parse --show-toplevel)'

## JavaScript: Node, Deno and Bun
alias n='node'
alias dn='deno'

# Bun completions
[ -s "/Users/anasharm/.bun/_bun" ] && source "/Users/anasharm/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Deno
export DENO_INSTALL="/Users/anasharm/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

## Julia
alias jl='julia'

## Rust
alias r='rustc'
alias m='miniserve'
source $HOME/.cargo/env

## Python
alias p='python3'
alias pipup='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U'
# Using virtual env with the latest version of Python
source ~/.pyenv/env1/bin/activate

## GNU Compiler Collection (gcc, g++ and gfortran)
# gcc is softlinked to /opt/homebrew/bin/gcc-12
# g++ is softlinked to /opt/homebrew/bin/g++-12
# gfortran is softlinked to /opt/homebrew/bin/gfortran-12
alias f='gfortran'

## Go
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

## JVM Languages
# export JAVA_HOME="/usr/local/java"
# export GROOVY_HOME="/opt/homebrew/opt/groovy/libexec"
# export GRADLE_HOME="/opt/homebrew/opt/gradle"
# export GRADLE_OPTS="-Xmx1024m"
# export M2_HOME="/opt/homebrew/opt/maven"
# export PATH=$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin:$PATH
alias j='java'
alias jc='javac'
alias kt='kotlin'
alias kc='kotlinc'
alias kj='kotlinc-jvm'
alias jsb='java -Djarmode=layertools -jar'

## Ruby
export PATH=/opt/homebrew/opt/ruby/bin:/Users/anasharm/.gem/ruby/3.1.0/bin:$PATH

## Swift
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
alias swc='swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk'
alias sw='swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk'

## Clang/LLVM/Web Assembly
# Clang/LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# WASI SDK (****I did not install WASI_SDK when I moved to Apple M1****)
#export PATH="/opt/wabt/bin:$PATH"
#export WASI_SDK_PATH="/opt/wasi-sdk" 

# Wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/anasharm/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Wasm-edge
source $HOME/.wasmedge/env

# Emscripten (brew install emscripten)
# Binaryen (brew install binaryen)
# wasm-pack (install using shell script command shown on the web)

## PMD
alias pmd='/usr/local/pmd-current/bin/run.sh pmd'
alias cpd='/usr/local/pmd-current/bin/run.sh cpd'

## Jfrog CLI configurations
autoload -Uz compinit
compinit
source /Users/anasharm/.jfrog/jfrog_zsh_completion

## Cisco (codectl)
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

## OpenAI API
## ChatGPT
source ~/.openai

## Mojo
export MODULAR_HOME="/Users/anasharm/.modular"
export PATH="/Users/anasharm/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

#################
### Public Clouds 
#################

## All Clouds

# Show Current Cloud Settings
function showcloud() {
    echo "AWS Profile Settings: "
    aws configure list
    echo
    echo "GCP Profile Settings: "
    gcloud config configurations list
    echo
    echo "Azure Profile Settings: "
    az account show
}

# Set to Cisco Cloud Account(s)
function csco() {
    profile="cisco"
    gcloud config configurations activate "${profile}" # switch GCP profile
    az_subscription_id="02187d59-a1ce-4f8c-9e59-0f3dd558e5c3"
    az account set --subscription "${az_subscription_id}" # switch Azure profile
    showcloud
}

# Set to Personal Cloud Account(s)
function my() {
    profile="default"
    az_subscription_id="8cf5d499-2e9b-4161-a3b7-8c6747241dbb"

    export AWS_PROFILE="${profile}" # switch AWS profile
    gcloud config configurations activate "${profile}" # switch GCP profile
    az account set --subscription "${az_subscription_id}" # switch Azure profile
    showcloud
}

# Switch to Cisco Cloud Account(s)
function 2aws() {
    if [[ ! -z $1 ]]; then
        profile="$1"
    else
        profile="me"
    fi
    if [[ ! -z $2 ]]; then
        region="$2"
    else
        region="us-east-1"
    fi
    export AWS_PROFILE=$profile
    export AWS_DEFAULT_REGION=$region
    echo "Switching to using $AWS_PROFILE of AWS..."
    echo "Switching to using $AWS_DEFAULT_REGION of AWS..."
}

## GCP
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
alias gcssh="gcloud compute ssh"
alias gcls="gcloud compute instances list"
#alias gcip='curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip'

## AWS
#export AWS_ACCESS_KEY_ID=$(cat ~/.aws/credentials | grep -i aws_access_key_id | awk -F ' = ' '{print $2}')
#export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/credentials | grep -i aws_secret_access_key | awk -F ' = ' '{print $2}')
#export PATH=/usr/local/aws-cli/v2/current/bin:$PATH
alias a="aws"
export AWS_PROFILE="anand"
alias awsls='aws ec2 describe-instances --query "Reservations[*].Instances[*].{id: InstanceId, type: InstanceType, image: ImageId, ip: PrivateIpAddress, ip_pub: PublicIpAddress, state: State.Name, vpc: VpcId, subnet: SubnetId, az: Placement.AvailabilityZone, ebs: BlockDeviceMappings[0].Ebs.VolumeId}"'
alias awsgw='aws ec2 describe-internet-gateways --query "InternetGateways[*].{internet_gateway_id: InternetGatewayId, vpc_id: Attachments[0].VpcId, state: Attachments[0].State}"'
alias awsvpc='aws ec2 describe-vpcs --query "Vpcs[*].{vpc_id: VpcId, cidr_block: CidrBlock, state: State}"'
alias awssub='aws ec2 describe-subnets --query "Subnets[*].{vpc_id: VpcId, subnet_id: SubnetId, availability_zone: AvailabilityZone, cidr_block: CidrBlock, public_network: MapPublicIpOnLaunch}"'
alias awssec='aws ec2 describe-security-groups --query "SecurityGroups[*].{vpc_id: VpcId, group_id: GroupId, group_name: GroupName, group_description: Description}"'
alias awsrt='aws ec2 describe-route-tables --query "RouteTables[*].{route_table_id: RouteTableId, vpc_id: VpcId}"'
alias awsalias='bat ~/.aws/cli/alias'

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
complete -C '/usr/local/aws/bin/aws_completer' aws

## Azure
alias azls='az vm list'

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

## OpenStack
alias o='openstack'
alias ols='openstack server list'
# Source into Cisco RTP Cluster
source ~/bin/rtp

## Cloudflare workers
alias wr='wrangler'

##############################################
### VMs, Containers & Container Orchestrators 
##############################################

## VMs
# VMWare Fusion Command Line Tools
# export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library/vkd/bin:/Applications/VMware\ Fusion.app/Contents/Library"

# VirtualBox
alias vbox='vboxmanage'

## Containers
# Docker
alias d='docker'
alias drm='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dls='docker image ls'
alias dcls='docker container ls -a'
alias lzd='lazydocker'

# Podman (OPTIONAL)
alias pd='podman'
#export DOCKER_HOST='unix:///Users/anasharm/.local/share/containers/podman/machine/qemu/podman.sock'
alias pdrm='podman stop $(podman ps -a -q) && podman rm $(podman ps -a -q)'
alias pdls='podman image ls'
alias pdcls='podman container ls -a'

# Kubectl and related K8s tools
source <(kubectl completion zsh)
export KUBE_EDITOR="nvim"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# stern completion
source <(stern --completion=zsh)
alias s="stern"

# Minikube
alias mkstart="minikube start --memory='2000mb' --cpus=2 --vm-driver=virtualbox"

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


################
### DevOps Tools
################

## Ansible
alias an='ansible'

## Terraform
alias vg='vagrant'

## Terraform/Terragrunt
alias tf='terraform'
alias tg='terragrunt'

## JFrog CLI
alias jf="jfrog"

## Vault
alias v="vault"

# Cisco Vault configurations
export VAULT_ADDR='https://internal-keeper.cisco.com'
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
# export VAULT_NAMESPACE='ciscoit/ns_ciscoit-codeon'
# export VAULT_NAMESPACE='ciscoit/ns_ciscoit-vaultnerds'

############################
### Data-Intensive App Tools
############################

# PostgreSQL

# Add sqlite3
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

##################
### Security Tools
##################

## SOPS
#export SOPS_PGP_FP="2A30D3C45B5C792CC603C82AA190E97F52B7DBAC"

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
### Let's make it look right...
###############################

# Get the terminal ready
clear

# Set this correctly please..;-)
DOTFILES_HOME=$HOME/.dotfiles
cat $DOTFILES_HOME/misc/om
. $DOTFILES_HOME/z/z.sh
w


