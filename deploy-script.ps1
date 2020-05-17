param([string]$orgAlias, [string]$clientId, [string]$loginUrl, [string]$username)

Write-Host Starting SFDX Deployment..

Write-Host Validating SFDC CLI..
sfdx --version

Write-Host Authorizing..
sfdx force:auth:jwt:grant -i $clientId -f C:/OpenSSL-Win64/bin/server.key -u $username -r $loginUrl -a $orgAlias -s

Write-Host Deploying.. to $orgAlias
sfdx.cmd force:source:deploy --sourcepath "deploy-sf" --json --loglevel fatal -u $orgAlias