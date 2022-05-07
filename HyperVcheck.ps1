$hyperv = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V

if($hyperv.State -eq "Enabled") {
	Write-Host "Hyper-V is already enabled!"
} else {
	Write-Host "Hyper-V is disabled. Enabling it now.."
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -N
	Write-Host $hyperv.State
	Read-Host "Press any key to Force restart"
	Restart-Computer -Force
}