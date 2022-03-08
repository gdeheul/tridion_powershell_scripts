<#
.SYNOPSIS
    Main installation script to install microservices

.DESCRIPTION
    This script is using the main installation script and is providing information about URLs and roles to install

.NOTES
Name: quickinstall_tst_live.ps1
Author: Gert de Heul
Version: 1.0.0.
DateUpdated: 04-11-2020
#>

##############################################################
##################### Variables declaration part #############
##############################################################

$ServicesFolder = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\roles_live"
$TargetFolder = "D:\SDL\Tridion Sites\microservices\live"

##############################################################
##################### Main execution part ####################
##############################################################

.\quickinstall.ps1 -enable-discovery -enable-deployer-combined -enable-content -enable-context <#-enable-iq-index -enable-iq-query#> -auto-register -target-folder $TargetFolder -discovery-url http://microservices.live.mysite.com:8082/discovery.svc -token-url http://microservices.live.mysite.com:8082/token.svc -iq-index-url http://microservices.live.mysite.com:8097/index.svc -iq-query-url http://microservices.live.mysite.com:8098/search.svc -deployer-url http://microservices.live.mysite.com:8084/httpupload -deployer-worker-url http://microservices.live.mysite.com:8089 -content-url http://microservices.live.mysite.com:8081/content.svc -cid-url http://microservices.live.mysite.com:8088/cid -context-url http://microservices.live.mysite.com:8087/context.svc -preview-url http://microservices.live.mysite.com:8083/ws/preview.svc -session-url http://microservices.live.mysite.com:8081/content.svc -ugc-community-url http://microservices.live.mysite.com:8085/community.svc -ugc-moderation-url http://microservices.live.mysite.com:8086/moderation.svc -enable-monitoring -services-folder $ServicesFolder

#Set Deployer- and Content Windows to start delayed

Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TridionliveDeployerService" -Name "DelayedAutostart" -Value 1 -Type DWORD
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TridionliveContentService" -Name "DelayedAutostart" -Value 1 -Type DWORD


#Register Capabilities by running registration tool
cd $TargetFolder\discovery\config
java -jar discovery-registration.jar update

