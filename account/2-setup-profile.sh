#!/bin/bash
tag="" # Or some meaningful alphanumeric string
role=admin
profile=$tag-$role

master_account_id=$(aws sts get-caller-identity \
  --output text \
  --query 'Account')
new_account_id=$(aws organizations list-create-account-status \
  --output text \
  --query 'CreateAccountStatuses[?Id==`'"$1"'`].[AccountId]'
)
echo master_account_id=$master_account_id new_account_id=$new_account_id

master_profile=default

aws configure set profile.$profile.role_arn \
    arn:aws:iam::$new_account_id:role/$role
aws configure set profile.$profile.source_profile \
    $master_profile
aws configure set profile.$profile.region \
    ap-southeast-2