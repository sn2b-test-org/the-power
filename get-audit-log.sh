. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/orgs#get-the-audit-log-for-an-organization
# GET /orgs/{org}/audit-log

# all or git could be the events to include
events_to_include="git"

curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        "${GITHUB_API_BASE_URL}/orgs/${org}/audit-log?include=${events_to_include}"
