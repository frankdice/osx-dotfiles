export PATH=~/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/frank.dice/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/frank.dice/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/frank.dice/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/frank.dice/bin/google-cloud-sdk/completion.bash.inc'; fi

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

alias adc="source ~/bin/app-default-credentials"
alias kc="~/bin/kubectl-fzf.sh"
alias gc="~/bin/gcloud-fzf.sh"
alias k="~/bin/kubectl-ns-helper.sh"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh

HISTSIZE=20000
HISTFILESIZE=20000

c() {
   export ACCOUNT=$1
   export ROLE=$1-Administrator
   echo "gimme-aws-creds --profile $ACCOUNT"
   gimme-aws-creds --profile $ACCOUNT
   export AWS_PROFILE=$ROLE
   aws sts get-caller-identity
   eksctl get cluster
   echo "Run aws eks update-kubeconfig --name CLUSTERNAME to update kubeconfig"
}
