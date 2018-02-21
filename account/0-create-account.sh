#!/bin/bash
tag="whatraining" # Or some meaningful alphanumeric string
account_name="Konfigu ($tag)"
email="luke+$tag@konfigu.com"
role=admin

profile=$tag-$role

create_request_id=$(aws organizations create-account \
  --email "$email" \
  --account-name "$account_name" \
  --role-name "$role" \
  --iam-user-access-to-billing ALLOW \
  --output text \
  --query 'CreateAccountStatus.Id'
)
echo create_request_id=$create_request_id