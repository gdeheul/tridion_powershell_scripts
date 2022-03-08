<#
.SYNOPSIS
    This script prepares the folder structure to install the microservices

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

$PSScriptRoot="D:\installatie\SDL\quickinstall\content delivery\live"
$sourceRoot = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\roles"
$destinationRoot = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\roles_live"
$sourceRootCustomLibs = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\customlibs"
$sourceSolrLibs = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\solr"
$files=@("*.jar")

##############################################################
##################### Main execution part ####################
##############################################################


If(!(test-path $destinationRoot))

{Copy-Item -Path $sourceRoot -Recurse -Destination $destinationRoot -Container

#Copy resources from JMS provider as needed by the Content Service

<# Copy-Item -Path "$sourceRootCustomLibs\*" -Destination "$destinationRoot\content\standalone\lib" #>
<# Copy-Item -Path "$sourceRootCustomLibs\*" -Destination "$destinationRoot\preview\standalone\lib" #>
<# Copy-Item -Path "$sourceRootCustomLibs\*" -Destination "$destinationRoot\session\service\standalone\lib" #>
Copy-Item -Path "$sourceRootCustomLibs\activemq" -Destination "$destinationRoot\monitoring\agent\standalone\services" -Recurse

#Copy registration JAR to the Discovery Service Config folder
Copy-Item -Path "$sourceRoot\discovery\registration\discovery-registration.jar" -Destination "$destinationRoot\discovery\standalone\config"

#Copy SI4T / SOLR specific libaries/classes to Deployer (see https://github.com/SI4T/Solr/wiki/SI4T-Solr-Configuration-101 

<# New-Item -ItemType Directory -Force -Path ("$destinationRoot\deployer\deployer-combined\standalone\lib"); Get-ChildItem -recurse ($sourceSolrLibs) -include ($files) | Copy-Item -Destination ("$destinationRoot\deployer\deployer-combined\standalone\lib") #>
<# Copy-Item -Path "$sourceSolrLibs\config\*" -Destination "$destinationRoot\deployer\deployer-combined\standalone\config" #>

Write-Host "Prepare folder structure done" -ForegroundColor Green

#Update service install scripts
& "$PSScriptRoot\update_service_install_scripts.ps1"
Write-Host "Update service install scripts done" -ForegroundColor Green}

else
{
Write-Host "Folder already exist!!" -ForegroundColor Red
}

