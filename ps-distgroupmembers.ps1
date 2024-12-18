# Built using ChatGPT and CMDlet documentation from Learn.Microsoft.com
# Prompt the user for the Distribution Group Identity
$distributionIdentity = Read-Host "Please enter the Distribution Group Identity (e.g., 'Sales Team') "

# Check if the user provided input
if (-not $distributionIdentity -or $distributionIdentity.Trim() -eq "") {
    Write-Host "You must enter a valid Distribution Group Identity. Exiting the script." -ForegroundColor Red
    exit
}

# Get the path to the current user's Desktop
$desktopPath = Join-Path $env:USERPROFILE "Desktop"

# Sanitize the distribution name for file naming (remove invalid characters)
$sanitizedFileName = $distributionIdentity -replace '[\\/:*?"<>|]', '_'

# Define the CSV file name and full path
$csvFilePath = Join-Path $desktopPath "$sanitizedFileName.csv"

# Get members of the distribution group and export to CSV
Get-DistributionGroupMember -Identity $distributionIdentity |
Select-Object @{
    Name = "DistributionName"; 
    Expression = {$distributionIdentity}
}, Name, PrimarySmtpAddress |
Export-Csv -Path $csvFilePath -NoTypeInformation -Encoding UTF8

# Notify the user
Write-Host "The distribution group members for '$distributionIdentity' have been exported to $csvFilePath"
