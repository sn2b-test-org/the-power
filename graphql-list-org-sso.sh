. .gh-api-examples.conf

# List the settings for an organization using SSO.

read -r -d '' graphql_script <<- EOF
{
  organization(login: "$org") {
    samlIdentityProvider {
      id
      digestMethod
      idpCertificate
      issuer
      signatureMethod
      ssoUrl
    }
  }
}
EOF

# Escape quotes and reformat script to a single line
graphql_script="$(echo ${graphql_script//\"/\\\"})"


curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H 'Accept: application/vnd.github.audit-log-preview+json' \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        ${GITHUB_APIV4_BASE_URL} -d "{ \"query\": \"$graphql_script\"}"

