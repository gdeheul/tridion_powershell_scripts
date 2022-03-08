#################################################################
# cleanup_folders.ps1
# Department: DMO | JIVC | GIT&INFRA | ITT
# Auhtor: Gert de Heul
# Change log: version 0.1
# Change date: 16-04-2019
# Prodcut Scope: SDL Tridion Sites 9 (all version)
#################################################################

<#
Script to delete files older than x-days. The script is built to be used as a scheduled task, it automatically generates a logfile name based on the copy location and the current date/time. There are various levels of logging available and the script can also run in -listonly mode in which it only lists the files it would otherwise delete. There are two main routines, one to delete the files and a second routine that checks if there are any empty folders left that could be deleted.
#>

# CMS

# Cleaning Up Logfiles
.\deleteold.ps1 -folderpath "E:\logs\tridion\maintenance" -Fileage 7 -log "E:\logs\tridion\maintenance\cleanup_logs.log" -AppendLog

# Cleaning transactions folder
.\deleteold.ps1 -FolderPath "D:\SDL\Tridion Sites\bin\transactions" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_transactions.log" -AppendLog

# Cleaning Root Storage folder 
.\deleteold.ps1 -FolderPath "D:\Temp\SDL" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_temp.log" -AppendLog -CleanFolders

# Cleaning Preview folder 
.\deleteold.ps1 -FolderPath "D:\SDL\Tridion Sites\web\Preview" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_preview.log" -AppendLog

# Cleaning Upload folder 
.\deleteold.ps1 -FolderPath "D:\SDL\Tridion Sites\web\WebUI\WebRoot\Upload" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_upload.log" -AppendLog


# CD Live

# Cleaning Up Binaries Transaction Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\live\binary\Binaries\Transaction" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_transactions_live.log" -AppendLog -CleanFolders

# Cleaning Up Binaries Zip Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\live\binary\Binaries\Zip" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_zips_live.log" -AppendLog -CleanFolders

# Cleaning Up Incoming Content Queue Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\live\queue\incoming\ContentQueue" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_contentqueue_live.log" -AppendLog -CleanFolders

# Cleaning Up Incoming FinalTX Commit Queue Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\live\queue\incoming\FinalTX\CommitQueue" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_commitqueue_live.log" -AppendLog -CleanFolders

# Cleaning Up Incoming Prepare PrepareQueue Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\live\queue\incoming\Prepare\PrepareQueue" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_preparequeue_live.log" -AppendLog -CleanFolders

#CD Staging

# Cleaning Up Binaries Transaction Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\staging\binary\Binaries\Transaction" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_transactions_staging.log" -AppendLog -CleanFolders

# Cleaning Up Binaries Zip Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\staging\binary\Binaries\Zip" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_zips_staging.log" -AppendLog -CleanFolders

# Cleaning Up Incoming Content Queue Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\staging\queue\incoming\ContentQueue" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_contentqueue_staging.log" -AppendLog -CleanFolders

# Cleaning Up Incoming FinalTX Commit Queue Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\staging\queue\incoming\FinalTX\CommitQueue" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_commitqueue_staging.log" -AppendLog -CleanFolders

# Cleaning Up Incoming Prepare PrepareQueue Folder
.\deleteold.ps1 -folderpath "F:\temp\tridion\staging\queue\incoming\Prepare\PrepareQueue" -FileAge 5 -log "E:\logs\tridion\maintenance\cleanup_preparequeue_staging.log" -AppendLog -CleanFolders
