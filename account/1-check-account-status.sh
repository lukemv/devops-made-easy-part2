#!/bin/bash
aws organizations list-create-account-status \
  --output text \
  --query 'CreateAccountStatuses[?Id==`'"$1"'`].[AccountId,AccountName,State,FailureReason]'