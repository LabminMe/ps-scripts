# ps-scripts
PowerShell Scripts that give you the power to administrate, report, and investigate.

### ps-user-compare.ps
Ver [0.005] This script accepts 2 active directory users, compares their group membership and outputs it to the screen in a single run.

### ps-JFIFtoJPG.ps1
Ver [1.0] This script reviews the registry entry for image/JPEG on Windows systems and changes it from .JFIF to .JPEG if it is present and set to .JFIF.  

### ps-DistGroupMembers.ps1
Ver [1.0] Run this script after authenticating to MS 365 Exchange online in a PowerShell session and enter the distribution group identity that you are
collecting members on. It will generate a list of Alias, Name, & Email address in a CSV format. 
NOTE: Script is built for Windows clients. Future development could include OS detection.
