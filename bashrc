#macos bash settings
alias cdmbow='cd $MBOWPATH'
alias mfa='otp | pbcopy && echo `pbpaste`'
alias bonsai='tree -F --filelimit 15'
alias fig='findInGrep'
alias lssize='listbysize'
alias rmorig='removeorig'

export PS1="\u[\w]:\\$\[$(tput sgr0)\]"
export VISUAL=vim
export AWS_CONFIG_DIR=~/.aws
export AWS_REGION=eu-west-3
export AWS_SESSION_TTL=4h
export AWS_ASSUME_ROLE_TTL=1h

if [ -f "${HOME}/.gpg-agent-info" ]; then
	. "${HOME}/.gpg-agent-info"
	export GPG_AGENT_INFO
	export GPG_TTY="$(tty)"
fi

function listbysize(){
	find . -type f -print0 | xargs -0 ls -la | awk '{print int($5/1000) " KB\t" $9}' | sort -n -r -k1
}

function findInGrep() {
	find . -type f -print0 | xargs -0 grep --color -iHn "$1" {} \; 2> /dev/null
}
function removeorig() {
	find . -name '*.orig' -delete
}
function gocheckall() {
	gometalinter --disable-all --enable=errcheck --enable=vet --enable=vetshadow --enable=structcheck --enable=aligncheck --enable=deadcode --enable=ineffassign --enable=dupl --enable=golint  --enable=goimports --enable=varcheck --enable=interfacer --enable=goconst --enable=gosimple --enable=staticcheck --enable=unparam --enable=unused --enable=misspell "$1"
}

export GOPATH="/Users/mbow/go"
export MBOWPATH="$GOPATH/src/github.com/mbow"
export PATH="$HOME/OTP/otp/target/release:$PATH" # Add OTP
export HISTFILESIZE=500000
export HISTSIZE=500000

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
