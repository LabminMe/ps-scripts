# Mount the Host Key Classes Root as a drive
New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR

# Move to the new location
Set-Location HKCR:

# Define the path to the registry key
$registryPath = ".\MIME\Database\Content Type\image/jpeg"

# Define the property name (key) to change
$propertyName = "Extension"

# Define the new value for the property (key)
$newValue = ".jpg"

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Modify the Extension key with the new value
    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $newValue
   
    Write-Host "Registry key updated successfully."
} else {
    Write-Host "Registry key not found."
}
