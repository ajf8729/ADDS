[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True)]
    [string]$BaseOuName,
    [Parameter(Mandatory=$True)]
    [string]$BaseOuDescription
)

Import-Module -Name ActiveDirectory

$DomainDn = Get-ADDomain | Select-Object -ExpandProperty DistinguishedName

New-ADOrganizationalUnit -Name $BaseOuName -Path $DomainDn -Description $BaseOuDescription

$BaseOuDn = "OU=$BaseOuName,$DomainDn"

$Ous = (
    "Clients",
    "Groups",
    "Servers",
    "Users"
)

foreach ($Ou in $Ous) {
    New-ADOrganizationalUnit -Name $Ou -Path $BaseOuDn -Description "$BaseOuDescription $Ou"
}