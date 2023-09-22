# Loops through all images in all subfolders of this folder and compresses ones that are more than 
# 400KB in size. The original images are renamed to have a .bak extension, but the compressed 
# versions will take the original name.

# Requires magick.exe to be installed and available in the PATH environment variable.

# Run this script inside the assets/uploads/images folder.

# Get all images in all subfolders
$images = Get-ChildItem -Recurse -Include *.jpg, *.jpeg, *.png, *.gif

# Loop through each image
foreach ($image in $images) {
    # Get the size of the image
    $size = $image.Length / 1KB

    # If the image is larger than 400KB, compress it
    if ($size -gt 400) {
        try {
            # Get the original image path and name
            $originalPath = $image.FullName
            $originalName = $image.Name

            # Rename the original image to have a .bak extension
            $backupPath = "$originalPath.bak"
            Rename-Item -Path $originalPath -NewName $backupPath

            # Compress the image
            magick.exe convert $backupPath -quality 80 $originalPath

            Write-Output "Successfully compressed $originalName and backup saved as $originalName.bak"

        } catch {
            Write-Error "Failed to process $originalName. Error: $_"
        }
    }
}
