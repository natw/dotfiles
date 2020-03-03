aopts="-a 8h -t 8h --mfa-provider GOOGLE --mfa-factor-type token:software:totp"

ar () {
  local cmd=${argv:-$SHELL}
  eval "aws-okta ${aopts} exec root -- ${SHELL} -c \"auth_name=org ${cmd}\""
}

ap () {
  local cmd=${argv:-$SHELL}
  eval "aws-okta ${aopts} exec prod -- ${SHELL} -c \"auth_name=prod ${cmd}\""
}

ad () {
  local cmd=${argv:-$SHELL}
  eval "aws-okta ${aopts} exec dev -- ${SHELL} -c \"auth_name=dev ${cmd}\""
}

al () {
  local cmd=${argv:-$SHELL}
  eval "aws-okta ${aopts} exec legacy -- ${SHELL} -c \"auth_name=legacy ${cmd}\""
}

alias aod='ad ~/bin/aws_set_credentials.sh'
alias aop='ap ~/bin/aws_set_credentials.sh'
alias aor='ar ~/bin/aws_set_credentials.sh'
