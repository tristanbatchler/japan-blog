# Loops through all images in all subfolders of this folder and removes any files called 
# cuba-1.jpg

# Run this script inside the assets/uploads/images folder.

$images = Get-ChildItem -Recurse -Include cuba-1.jpg

foreach ($image in $images) {
    try {
        Remove-Item -Path $image.FullName -Force
        Write-Output "Successfully removed $image"
    } catch {
        Write-Error "Failed to remove $image. Error: $_"
    }
}