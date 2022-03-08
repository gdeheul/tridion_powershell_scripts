$ServiceAccount = 'DOMAIN\USERNAME'
$WachtWoordServiceAccount = 'PASSWORD'


#ActiveMQ
Get-CimInstance win32_service -filter "name='ActiveMQ'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}

#Live Tridion CD Services
Get-CimInstance win32_service -filter "name='TridionLiveContentService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionLiveContextService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionLiveDeployerService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionLiveDiscoveryService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionLiveMonitoringAgentService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
#Staging Tridion CD Services
Get-CimInstance win32_service -filter "name='TridionStagingContextService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionStagingSessionContentService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionStagingSessionPreviewService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionStagingDeployerService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionStagingDiscoveryService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
Get-CimInstance win32_service -filter "name='TridionStagingMonitoringAgentService'" | Invoke-CimMethod -Name Change -Arguments @{StartName=$ServiceAccount;StartPassword=$WachtWoordServiceAccount}
