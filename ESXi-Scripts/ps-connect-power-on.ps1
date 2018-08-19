

Connect-VIServer fridge
$VMList=Get-VM
foreach($guest in $VMList){
    $Name=$guest.Name
    $PowerState=$guest.PowerState
    Write-Host ("The sate of $Name is $PowerState")
    if($PowerState -eq "PoweredOff"){
        Write-Host("Starting $guest")
        Start-VM $Name
        }
}
Get-VM
Disconnect-VIServer fridge
