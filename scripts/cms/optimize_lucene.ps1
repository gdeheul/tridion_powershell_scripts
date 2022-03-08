$Account = "DOMAIN\USERNAME"
$Key = Get-Content "D:\SDL\Tridion Sites\scripts\AES_KEY_FILE.key"
$Credential = New-Object System.Management.Automation.PSCredential($Account,(Get-Content "D:\SDL\Tridion Sites\scripts\AES_PASSWORD_FILE.txt" | ConvertTo-SecureString -Key $Key))
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path "E:\logs\tridion\cms\Optimize-Search-Index.log" -Append
Invoke-WebRequest -Uri http://localhost:8983/tridion/update?optimize=true -Credential $Credential
Stop-Transcript 
