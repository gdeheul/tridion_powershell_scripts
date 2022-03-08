<#
.SYNOPSIS
    This script removes the custom folder structure in [installationRoot]\Tridion Sites 9.5\Content Delivery

.DESCRIPTION
    

.NOTES
Name: prepare_folder_structure.ps1
Author: Gert de Heul
Version: 1.0.0.
DateUpdated: 09-04-2019
#>

##############################################################
##################### Variables declaration part #############
##############################################################

$destinationRoot = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\roles_live"

##############################################################
##################### Main execution part ####################
##############################################################

If(test-path $destinationRoot)

{
#Remove Folder Structure
Remove-Item $destinationRoot -Force -Recurse
Write-Host "Folder structure removed" -ForegroundColor Green
}

else
{
Write-Host "Folder already removed!!" -ForegroundColor Red
}
