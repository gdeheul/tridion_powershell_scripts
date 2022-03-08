<#
.SYNOPSIS
    This script removes the Tridion Windows services (microservices) and afterwards cleans up the installation files

.DESCRIPTION
    

.NOTES
Name: remove_services.ps1
Author: Gert de Heul
Version: 1.0.0.
DateUpdated: 09-04-2019
#>

##############################################################
##################### Variables declaration part #############
##############################################################

$ServicesFolder = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\roles_live"
$TargetFolder = "D:\SDL\Tridion Sites\microservices\live"
$LogLocation = "E:\logs\tridion\content delivery\live"

##############################################################
##################### Main execution part ####################
##############################################################

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

If((test-path $TargetFolder))
{
#Stop Tridion Windows services before uninstalling them.
Write-Host "Stopping Services...." -ForegroundColor Yellow
Get-Service -DisplayName 'Tridion live*' | Stop-Service -Force

#Call to main scrip to remove services
.\quickinstall.ps1 -remove-services -clean-target -target-folder $TargetFolder -services-folder $ServicesFolder

#Remove Logfiles
Remove-Item $LogLocation\* -Force -Recurse
}
else
{
Write-Host "Services already removed" -ForegroundColor Red
}
