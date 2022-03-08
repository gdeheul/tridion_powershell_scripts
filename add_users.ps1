Import-Module Tridion-CoreService
Set-TridionCoreServiceSettings -HostName "[HOST_NAME]" -Version Web-8.5 -ConnectionType Default -Persist

New-TridionUser -UserName "[DOMAIN\UserName]"  -Description "Test User 1" -MemberOf "System Administrator"

# For Web 8.5 the -MakeAdministrator option does not work, you have to add the user to the Defensie Intranet Functioneelbeheerders group instead
# New-TridionUser -UserName "domain\username" -Description "Person Name" -MemberOf "Defensie Intranet Functioneelbeheerders"


