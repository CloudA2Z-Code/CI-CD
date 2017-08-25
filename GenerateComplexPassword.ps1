[Reflection.Assembly]::LoadWithPartialName("systme.web")
$pwd = [System.Web.Security.Membership]::GeneratePassword(16,4)

Write-Output("##vso[task.setvariable variable=VmPassword;]$($pwd)")