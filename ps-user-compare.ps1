# Collect Variables
$user1 = read-host -Prompt 'First User'
$user2 = read-host -Prompt 'Second User'

# Display the difference between users
write-host "Side Indicator value indicates if membership is present" -ForegroundColor red
write-host "We are comparing user: $user1 & user: $user2" -ForegroundColor Green 
"   '=>' for a group means that $user1 is a member & $user2 is not." 
"   '<=' for a group means that $user2 is a member & $user1 is not."
Compare-Object -ReferenceObject (Get-AdPrincipalGroupMembership $user1 | Select-Object name | sort-object -Property name) -DifferenceObject (Get-AdPrincipalGroupMembership $user2 | Select-Object name | sort-object -Property name) -property name -passthru
