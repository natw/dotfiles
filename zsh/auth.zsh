# aopts="-a 8h -t 8h --mfa-provider GOOGLE --mfa-factor-type token:software:totp"
# aopts2="-a 1h -t 1h --mfa-provider GOOGLE --mfa-factor-type token:software:totp"

# ar () {
#   local cmd=${argv:-$SHELL}
#   eval "aws-okta ${aopts} exec root -- ${SHELL} -c \"${cmd}\""
# }

# ap () {
#   local cmd=${argv:-$SHELL}
#   eval "aws-okta ${aopts2} exec prod -- ${SHELL} -c \"${cmd}\""
# }

# ad () {
#   local cmd=${argv:-$SHELL}
#   eval "aws-okta ${aopts} exec dev -- ${SHELL} -c \"${cmd}\""
# }

# al () {
#   local cmd=${argv:-$SHELL}
#   eval "aws-okta ${aopts} exec legacy -- ${SHELL} -c \"${cmd}\""
# }

# # alias aod='unset AWS_SECRET_KEY_ID && eval $(aws-okta -a 8h -t 8h --mfa-provider GOOGLE --mfa-factor-type token:software:totp env dev)'
# # alias aop='eval $(aws-okta -a 8h -t 8h --mfa-provider GOOGLE --mfa-factor-type token:software:totp env prod)'
# # alias aor='unset AWS_SECRET_KEY_ID && eval $(aws-okta -a 8h -t 8h --mfa-provider GOOGLE --mfa-factor-type token:software:totp env root)'

# alias aod='ad ~/bin/aws_set_credentials.sh'
# alias aop='ap ~/bin/aws_set_credentials.sh'
# alias aor='ar ~/bin/aws_set_credentials.sh'
