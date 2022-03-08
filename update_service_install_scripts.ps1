<#
.SYNOPSIS
    This script updates the SDL Web Content Delivery Microservices installation files.

.DESCRIPTION
    This scrips updates various values in the microservices installation files (installService.ps1) like portnumbers, description

.NOTES
Name: update service install script.ps1
Author: Gert de Heul
Version: 1.0.1
DateUpdated: 09-04-2019
#>

##############################################################
##################### Variables declaration part #############
##############################################################

$ServicsLocation = "D:\installatie\SDL\Tridion Sites 9.5\Content Delivery\roles_live"

##############################################################
##################### Main execution part ####################
##############################################################

#Change portnumbers microservices from 80 to 81

<# $fileNames = Get-ChildItem "$ServicsLocation\*\installService.ps1" -Recurse |
 select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -replace '80', '81' | Set-Content $fileName
} #>

#Change name services to distinguish Staging and Live

$fileNames = Get-ChildItem "$ServicsLocation\*\installService.ps1" -Recurse |
 select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'name="Tridion', 'name="TridionLive' | Set-Content $fileName
}

$fileNames = Get-ChildItem "$ServicsLocation\*\installService.ps1" -Recurse |
 select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'displayName="Tridion', 'displayName="Tridion Live' | Set-Content $fileName
}

#Make the following services depended on discovery service

#Content

$fileNames = Get-ChildItem "$ServicsLocation\content\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'dependsOn=""', 'dependsOn="--DependsOn=TridionLiveDiscoveryService"' | Set-Content $fileName
}

#Session

$fileNames = Get-ChildItem "$ServicsLocation\session\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'dependsOn=""', 'dependsOn="--DependsOn=TridionLiveDiscoveryService"' | Set-Content $fileName
}

#Preview

$fileNames = Get-ChildItem "$ServicsLocation\preview\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'dependsOn=""', 'dependsOn="--DependsOn=TridionLiveDiscoveryService"' | Set-Content $fileName
}

#Add startup parameters for ActiveMQ

#Content

<# $fileNames = Get-ChildItem "$ServicsLocation\content\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'jvmoptions = "-Xrs", "-Xms512m", "-Xmx1536m"', 'jvmoptions = "-Xrs","-Xms512m","-Xmx1536m","-Dorg.apache.activemq.SERIALIZABLE_PACKAGES=''java.lang,java.util,org.apache.activemq,org.fusesource.hawtbuf,com.thoughtworks.xstream.mapper,com.tridion.cache''"'  | Set-Content $fileName
} #>

#Preview

<# $fileNames = Get-ChildItem "$ServicsLocation\preview\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'jvmoptions = "-Xrs", "-Xms256m", "-Xmx384m"', 'jvmoptions = "-Xrs","-Xms256m","-Xmx384m","-Dfile.encoding=UTF-8","-Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true","-Dorg.apache.catalina.connector.CoyoteAdapter.ALLOW_BACKSLASH=true","-Dorg.apache.activemq.SERIALIZABLE_PACKAGES=''java.lang,java.util,org.apache.activemq,org.fusesource.hawtbuf,com.thoughtworks.xstream.mapper,com.tridion.cache''"'  | Set-Content $fileName
} #>

#Session

<# $fileNames = Get-ChildItem "$ServicsLocation\session\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'jvmoptions = "-Xrs", "-Xms512m", "-Xmx1536m"', 'jvmoptions = "-Xrs","-Xms512m","-Xmx1536m","-Dfile.encoding=UTF-8","-Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true","-Dorg.apache.catalina.connector.CoyoteAdapter.ALLOW_BACKSLASH=true","-Dorg.apache.activemq.SERIALIZABLE_PACKAGES=''java.lang,java.util,org.apache.activemq,org.fusesource.hawtbuf,com.thoughtworks.xstream.mapper,com.tridion.cache''"'  | Set-Content $fileName
} #>

#Deployer

$fileNames = Get-ChildItem "$ServicsLocation\deployer\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace '-Xmx1024m', '-Xmx4096m' | Set-Content $fileName
}

#Monitoring

<# $fileNames = Get-ChildItem "$ServicsLocation\monitoring\*\installService.ps1" -Recurse |
select -expand fullname

foreach ($filename in $filenames) 
{
 (  Get-Content $fileName) -creplace 'jvmoptions = "-Xrs", "-Xms256m", "-Xmx512m"', 'jvmoptions = "-Xrs","-Xms256m","-Xmx512m","-Dorg.apache.activemq.SERIALIZABLE_PACKAGES=''java.lang,java.util,org.apache.activemq,org.fusesource.hawtbuf,com.thoughtworks.xstream.mapper,com.tridion.cache''"'  | Set-Content $fileName
} #>

