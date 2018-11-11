$Features = (
	"AD-Domain-Services";
	"DNS"
)

Install-WindowsFeature -Name $Features

Import-Module -Name ADDSDeployment

$Parameters = @{
	DomainName				= 'ad.domain.tld';
	DomainNetbiosName		= 'AD';
	ForestMode				= 'WinThreshold';
	DomainMode				= 'WinThreshold';
	DatabasePath			= 'C:\Windows\NTDS';
	LogPath					= 'C:\Windows\NTDS';
	SysvolPath				= 'C:\Windows\SYSVOL';
	InstallDns				= $true;
	CreateDnsDelegation		= $false;
	NoRebootOnCompletion	= $false;
	Verbose 				= $true
}

Install-ADDSForest @Parameters