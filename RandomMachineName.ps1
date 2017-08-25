$rgName = '*CICDTAG-Agn-*'
$prefix = 'CICDTAG-Agn'
$seqNo = 0
$lastVM = Get-AzureRmVM | Where-Object Name -Like $rgName | Sort-Object Name -Descending | Select-Object -First(1)

if ($lastVM.Name -match "\d") 
{
 Write-Host "seq do not exists !"
 Write-Host "Last VM: $($lastVM.Name)"
 $seqNo = [int]($lastVM.Name.Split('-')[2])
}

$newNo = $seqNo + 1
$uniqueMacName = "$($prefix)-$newNo"
Write-Output("VSO task to setup azure target vm name which will be cretaed under 'Dev Test Lab': Azure TargetVMName: $($uniqueMacName)")