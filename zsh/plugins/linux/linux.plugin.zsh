###### Linux

##########################
### Linux Flavor specific
##########################

###################
### Unix-y specific
###################

export EDITOR='nvim'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
alias ls='ls --color=auto'
alias c='clear'
alias tree='tree -C'
alias latest='find . -mtime -30 -type f | grep -v DS_Store'
alias pping='prettyping --nolegend'
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

# uv settings
UV_PYTHON_PREFERENCE="managed-only"
# UV_PYTHON_DOWNLOADS="never"

# conda settings
source /opt/conda/etc/profile.d/conda.sh

## Rust
alias r='rustc'
alias m='miniserve'
source $HOME/.cargo/env

## Go
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH
# Add Go binary path
export PATH=$HOME/.go/latest/bin:$PATH

## Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
alias j='java'
alias jc='javac'

## JavaScript Runtimes
# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm 
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
eval "$(~/.rbenv/bin/rbenv init - --no-rehash zsh)"

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
# export AWS_PROFILE="anand"
alias awsls='aws ec2 describe-instances --query "Reservations[*].Instances[*].{instance_id: InstanceId, type: InstanceType, ip_address_private: PrivateIpAddress, ip_address_public: PublicIpAddress, instance_state: State.Name, vpc_id: VpcId, subnet_id: SubnetId, availability_zone: Placement.AvailabilityZone, image_id: ImageId, ebs_volume_id: BlockDeviceMappings[0].Ebs.VolumeId}" --output table'
alias awsgw='aws ec2 describe-internet-gateways --query "InternetGateways[*].{internet_gateway_id: InternetGatewayId, vpc_id: Attachments[0].VpcId, state: Attachments[0].State}" --output table'
alias awsvpc='aws ec2 describe-vpcs --query "Vpcs[*].{vpc_id: VpcId, cidr_block: CidrBlock, state: State}" --output table'
alias awssub='aws ec2 describe-subnets --query "Subnets[*].{vpc_id: VpcId, subnet_id: SubnetId, availability_zone: AvailabilityZone, cidr_block: CidrBlock, public_network: MapPublicIpOnLaunch}" --output table'
alias awssec='aws ec2 describe-security-groups --query "SecurityGroups[*].{vpc_id: VpcId, group_id: GroupId, group_name: GroupName, group_description: Description}" --output table'
alias awsrt='aws ec2 describe-route-tables --query "RouteTables[*].{route_table_id: RouteTableId, vpc_id: VpcId}" --output table'
complete -C '/usr/local/aws/bin/aws_completer' aws
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
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
alias gcssh="gcloud compute ssh"
alias gcls="gcloud compute instances list"
#alias gcip='curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip'

# Switch to Cisco Cloud Account(s)
function csco() {
    profile="cisco"

    export AWS_PROFILE="${profile}" # switch AWS profile
    gcloud config configurations activate "${profile}" # switch GCP profile
    showcloud
}

# Switch to Personal Cloud Account(s)
function my() {
    profile="default"

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

## Kubectl and related K8s tools

# kubectl completion
source <(kubectl completion zsh)
export KUBE_EDITOR="nvim"
export KUBECONFIG="/home/ubuntu/.kube/config"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# stern completion
source <(stern --completion=zsh)
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

################
### DevOps Tools
################

## Terraform/Terragrunt
alias tf='terraform'
alias tg='terragrunt'

## Ansible
alias an="ansible"

## Jfrog CLI configurations
autoload -Uz compinit
compinit
source $HOME/.jfrog/jfrog_zsh_completion

## Vault
alias v="vault"

############################
### Data-Intensive App Tools
############################

## sqlite3

## postgres

## kafka

## duckdb

##################
### Security Tools
##################

## GPG
# Source: https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
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

# Display Om
cat $DOTFILES_HOME/misc/om
w


