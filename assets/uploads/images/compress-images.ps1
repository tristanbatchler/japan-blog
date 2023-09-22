# Loops through all images in all subfolders of this folder and compresses ones that are more than 
# 400KB in size. The original images are renamed to have a .bak extension, but the compressed 
# versions will take the original name. Also resizes the image to have a maximum dimension of 2560px 
# (while maintaining aspect ratio)

# Requires magick.exe to be installed and available in the PATH environment variable.

# Run this script inside the assets/uploads/images folder.

# After running this script, it's possible that some images will be larger than 400KB again. So you 
# Can run this script again to compress only those images further.

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

            # Rename the original image to have a .bak extension, overwriting any existing backup
            $backupPath = "$originalPath.bak"
            Move-Item -Path $originalPath -Destination $backupPath -Force

            # Resize the image to have a maximum dimension of 2560px (while maintaining aspect ratio)
            # and compress the image
            magick.exe convert $backupPath -resize '2560x2560>' -quality 80 $originalPath

            Write-Output "Successfully compressed $originalPath and backup saved as $originalPath.bak"

        } catch {
            Write-Error "Failed to process $originalName. Error: $_"
        }
    } else {
        Write-Output "$($image.FullName) is already small enough at $size KB"
    }
}
