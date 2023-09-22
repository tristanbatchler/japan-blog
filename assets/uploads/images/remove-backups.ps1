# Loops through all images in all subfolders of this folder and removes any files that have a .bak 
# extension. This is useful if you want to remove the backups created by the compress-images.ps1 
# script.

# Run this script inside the assets/uploads/images folder.

$backups = Get-ChildItem -Recurse -Include *.bak

foreach ($backup in $backups) {
    try {
        Remove-Item -Path $backup.FullName -Force
        Write-Output "Successfully removed $backup"
    } catch {
        Write-Error "Failed to remove $backup. Error: $_"
    }
}