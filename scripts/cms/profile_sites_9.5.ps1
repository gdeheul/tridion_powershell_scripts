 ######################################################################################
 # Profile.ps1
 # Department: Customer Support
 # Author: Nuno Mendes (nmendes@sdl.com)
 # Contributions: Daniel Iyoyo; Gert de Heul
 # Change Log: Version 1.2
 # Change Date: 23-10-2020
 # Product Scope: SDL Tridion Sites 9
 ######################################################################################
 
<#
Step by step procedure to configure the shared profile. When this is enabled the profile will always be loaded  when the command prompt is loaded

1) Open Powershell as administrator
2) run: Set-ExecutionPolicy -ExecutionPolicy unrestricted -Force
3) run: new-item -path $profile -itemtype file -force -itemtype file -force
4) run: notepad $profile
5) paste this script in opened notepad
6) restart PowerShell  

Options:
remove profile: remove new-item -path $profile
Start Profile from a different location:
powershell -noprofile -noexit -command "invoke-expression '. ''D:\SDL\Tridion Sites\scripts\profile_sites_9.ps1''' "
#>

Set-ExecutionPolicy -ExecutionPolicy unrestricted 
#Set-Location D:\powershell\Scripts
Set-Alias -name gacutil -value C:\"Program Files (x86)"\"Microsoft SDKs"\Windows\"v7.0A"\bin\gacutil.exe

# Welcome message
" " 
"You are now entering PowerShell : " + $env:Username
" " 

Get-Module –ListAvailable 
" "

function cc()
{
write-host ' notepadpp(filename)                         - Open file in notepad ++                       ' -BackgroundColor white -ForegroundColor darkblue
write-host ' pro()                                       - Open Profile script on notepad ++             ' -BackgroundColor white -ForegroundColor darkblue
write-host ' Purge-Logs()         [pls]                  - Purge Log Files                               ' -BackgroundColor white -ForegroundColor darkblue

write-host ' ' 

write-host ' TServices()                                 - Display all Tridion Services                  ' -BackgroundColor white -ForegroundColor darkblue
write-host ' All-Services()                              - Display all Tridion Services                  ' -BackgroundColor white -ForegroundColor darkblue

write-host '                                                                                            '

write-host ' Add-Assembly($assemblyPath)                 - Add Assembly to the GAC                       ' -BackgroundColor white -ForegroundColor darkblue
write-host ' Remove-Assembly($assemblyDisplayName)       - Remove Assembly from the GAC                  ' -BackgroundColor white -ForegroundColor darkblue
write-host ' Get-AssemblyInfo($assemblyDisplayName)      - Display Assembly info with references GAC     ' -BackgroundColor white -ForegroundColor darkblue


write-host ' '

write-host ' StartTDS($name)                             - Start Tridion Services by name                ' -BackgroundColor black -ForegroundColor green
write-host ' StopTDS($name)                              - Stop Tridion Services by name                 ' -BackgroundColor black -ForegroundColor red


write-host ' '

write-host ' Start-TServices()    [sats]                 - Start all Tridion Services                    ' -BackgroundColor black -ForegroundColor green
write-host ' Stop-TServices()     [sots]                 - Stop all Tridion Services                     ' -BackgroundColor black -ForegroundColor red
write-host ' Restart-Tservices()  [rts]                  - Restart all Tridion Services                  ' -BackgroundColor black -ForegroundColor yellow

write-host ' '

write-host ' Start-ComPlus()                             - Start Tridion COM+                            ' -BackgroundColor black -ForegroundColor green
write-host ' Stop-ComPlus()                              - Stop Tridion COM+                             ' -BackgroundColor black -ForegroundColor red
write-host ' Restart-ComPlus(                            - Stop Tridion COM+                             ' -BackgroundColor black -ForegroundColor yellow

write-host ' '

#write-host 'Sign-Profile() 	- Sign the Script Profile file' -ForegroundColor red

}
#display the list of available functions
cc

function notepadpp($f) { D:\"Program Files (x86)"\"Notepad++"\notepad++.exe $f }

function pro { notepadpp $profile }


function TServices { 
		
	write-host '******************* SERVICES STATE *************************' -ForegroundColor green

	get-service -displayname '*Tridion*'	
	#get-service -name ( 'OESynchronizer')
	#get-service -name ( 'TCDCacheService')
	#get-service -name ( 'TridionDeployerService')
	#get-service -name ( 'TridionDiscoveryService')
	#get-service -name ( 'TridionContentService')
	#get-service -name ( 'TridionSessionContentService')
	#get-service -name ( 'TridionSessionPreviewService')
	#get-service -name ( 'TCDTransportService')
	#get-service -name ( 'TcmBatchProcessor')
	#get-service -name ( 'TCMBCCOM')
	#get-service -name ( 'TcmPublisher')
	#get-service -name ( 'TcmSearchHost')
	#get-service -name ( 'TcmSearchIndexer')
	#get-service -name ( 'TcmServiceHost')
	#get-service -name ( 'TCMWorkflow')
	#get-service -name ( 'TCDmonitor')
	#get-service -name ( 'OEBounceProcessor')
	#get-service -name ( 'OETracker')
	#get-service -name ( 'OEMailer')
	#get-service -name ( 'OETrigger')
    #get-service -name ( 'TridionTranslationManager')
		
	get-service -name 'COMSysApp' 
	get-service -name 'W3SVC' 
	#get-service -name 'ActiveMQ'
	
	#write-host '******************* SERVICES STATE *************************' -ForegroundColor green
	}
	
function StartTDS($name)
{
	start-service -name $name
	get-service -name $name
}

function StopTDS($name)
{
	stop-service -name $name -Force
	get-service -name $name
}
function Sots { 
Stop-TServices
}

function Stop-TServices { 
	
	write-host '.... STOPPING SERVICES ....' -BackgroundColor yellow -ForegroundColor black

	stop-service -displayname '*Tridion*' -Force 
	#StopTDS( 'OESynchronizer')
	#StopTDS( 'TCDCacheService')
	#StopTDS( 'TridionContentService')
	#StopTDS( 'TridionDeployerService')
	#StopTDS( 'TridionDiscoveryService')
	#StopTDS( 'TridionSessionContentService')
	#StopTDS( 'TridionSessionPreviewService')
	#StopTDS( 'TCDTransportService')
	#StopTDS( 'TcmBatchProcessor')
	#StopTDS( 'TCMBCCOM')
	#StopTDS( 'TcmPublisher')
	#StopTDS( 'TcmSearchHost')
	#StopTDS( 'TcmSearchIndexer')
	#StopTDS( 'TcmServiceHost')
	#StopTDS( 'TCMWorkflow')
	#StopTDS( 'TCDmonitor')
	#StopTDS( 'OEBounceProcessor')
	#StopTDS( 'OETracker')
	#StopTDS( 'OEMailer')
	#StopTDS( 'OETrigger')
    #StopTDS( 'TridionTranslationManager')
	
	#Stop-ComPlus
	StopTDS( 'COMSysApp')
	StopTDS( 'W3SVC')
	
	#Stop AtiveMQ
	#stop-service -name 'ActiveMQ'
	
		
	Tservices
	}
function sats { 
 Start-TServices 
}

function WaitUntilServices($searchString, $status)
{
    # Get all services where DisplayName matches $searchString and loop through each of them.
    foreach($service in (Get-Service -DisplayName $searchString))
    {
        # Wait for the service to reach the $status or a maximum of 30 seconds
        $service.WaitForStatus($status, '00:00:30')
    }
# Eample WaitUntilServices "SDL Web Discovery Service" "Running"
}




function Start-TServices {
	write-host '.... STARTING SERVICES ....' -BackgroundColor yellow -ForegroundColor black
	
	#start-service -name 'ActiveMQ'
	start-service -displayname '*Discovery Service*'
	start-sleep -s 60
	start-service -displayname '*Tridion*'
	#StartTDS( 'OESynchronizer')
	#StartTDS( 'TCDCacheService')
	#StartTDS( 'TridionDiscoveryService')
	#Start-sleep -s 60
	#StartTDS( 'TridionDeployerService')
	#Start-sleep -s 60
	#StartTDS( 'TridionContentService')
	#Start-sleep -s 60
	#StartTDS( 'TridionSessionContentService')
	#Start-sleep -s 60
	#StartTDS( 'TridionSessionPreviewService')
	#StartTDS( 'TCDTransportService')
	#StartTDS( 'TcmBatchProcessor')
	#StartTDS( 'TCMBCCOM')
	#StartTDS( 'TcmPublisher')
	#StartTDS( 'TcmSearchHost')
	#StartTDS( 'TcmSearchIndexer')
	#StartTDS( 'TcmServiceHost')
	#StartTDS( 'TCMWorkflow')
	#StartTDS( 'TCDmonitor')
	#StartTDS( 'OEBounceProcessor')
	#StartTDS( 'OETracker')
	#StartTDS( 'OEMailer')
	#StartTDS( 'OETrigger')
	#StartTDS( 'TridionTranslationManager')
	
	Start-ComPlus
	StartTDS('COMSysApp')
	StartTDS('W3SVC')
	
	TServices
	
	}
function rts { 
Restart-Tservices 
}	
function Restart-Tservices { 
	Stop-TServices
	Start-TServices
	}

function Get-AssemblyInfo($name) { 
	gacutil /lr $name
}
	
function Add-Assembly($path) { 
	AddToGac($path)
	#gacutil /i $path
}

function Remove-Assembly($path) { 
	gacutil /u $path
}

function All-Services { get-service -displayname '*' }

function Sign-Profile {  
$cert = @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]
Set-AuthenticodeSignature $profile $cert 
exit
}

function Stop-ComPlus()
{
	$TridionAppName = "Tridion Sites Content Manager"
	$comAdmin = New-Object -comobject COMAdmin.COMAdminCatalog  
	$comAdmin.ShutdownApplication($TridionAppName)	
	
	Write-Output "COM Plus Ended"
	
}

function Start-ComPlus()
{
	$TridionAppName = "Tridion Sites Content Manager"
	$comAdmin = New-Object -comobject COMAdmin.COMAdminCatalog 
	$comAdmin.StartApplication($TridionAppName)	
	
	Write-Output "COM Plus Started"
}


function Restart-ComPlus()
{
	Stop-ComPlus
	Start-ComPlus
}


function AddToGac($Assembly)
{
if ( $null -eq ([AppDomain]::CurrentDomain.GetAssemblies() |? { $_.FullName -eq "System.EnterpriseServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" }) ) {
		[System.Reflection.Assembly]::Load("System.EnterpriseServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a") | Out-Null
	}
	$PublishObject = New-Object System.EnterpriseServices.Internal.Publish
	
	if ( -not (Test-Path $Assembly -type Leaf) ) 
        {
            throw "The assembly '$Assembly' does not exist."
        }

        $LoadedAssembly = [System.Reflection.Assembly]::LoadFile($Assembly)

        if ($LoadedAssembly.GetName().GetPublicKey().Length -eq 0) 
        {
            throw "The assembly '$Assembly' must be strongly signed."
        }
          
        Write-Verbose "Installing: $Assembly"
        $PublishObject.GacInstall($Assembly)

      
}


function Purge-Logs()
{
Remove-Item E:\logs\tridion\* -Force -Recurse
}
function pls { 
Purge-Logs
}

function Purge-Temp-Folders()
{
Remove-Item D:\Temp\SDL\* -Force -Recurse
Remove-Item  "D:\SDL\Tridion Sites\bin\transactions\*" -Force -Recurse
}
function ptf { 
Purge-Temp-Folders
}
