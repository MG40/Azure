$LabConfig=@{ Internet=$true; DomainAdminName='LabAdmin'; AdminPassword='LS1setup!';UseHostDnsAsForwarder=$True ; VMs=@()}

1..2 | ForEach-Object {$VMNames="AzSHCI" ; $LABConfig.VMs += @{ VMName = "$VMNames$_" ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI22H2_G2.vhdx' ; HDDNumber = 4 ; HDDSize= 4TB ; MemoryStartupBytes= 8GB; VMProcessorCount="Max" ; NestedVirt=$true; VirtualTPM=$true }}

$LabConfig.VMs += @{ VMName = 'Management' ; ParentVHD = 'Win2022_G2.vhdx' ; MGMTNICs=1 }

$LabConfig.VMs += @{ VMName = 'WACGW' ; ParentVHD = 'Win2022Core_G2.vhdx' ; MGMTNICs=1 }