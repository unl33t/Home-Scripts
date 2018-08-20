#sudo snap install powershell --classic
#Set-ExecutionPolicy -ExecutionPolicy Bypass
Install-Module -Name VMware.PowerCLI –Scope CurrentUser
Set-PowerCLIConfiguration -InvalidCertificateAction ignore
