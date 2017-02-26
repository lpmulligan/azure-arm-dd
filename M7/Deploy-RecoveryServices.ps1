
$recoveryVaultName = 'lpm-arm-dd-vault'
$recoveryVaultRGName = 'lpm-arm-dd-recovery-services'
$recoveryVaultLocation = 'North Central US'

### Create Resource Group
New-AzureRmResourceGroup `
    -Name $recoveryVaultRGName `
    -Location $recoveryVaultLocation `
    -Verbose

### Create Recovery Services Vaultlo
New-AzureRmRecoveryServicesVault `
    -Name $recoveryVaultName `
    -ResourceGroupName $recoveryVaultRGName `
    -Location $recoveryVaultLocation `
    -Verbose

### Connect to Recovery Services Vault
$recoveryVault = Get-AzureRmRecoveryServicesVault `
    -ResourceGroupName $recoveryVaultRGName `
    -Name $recoveryVaultName

Set-AzureRmRecoveryServicesVaultContext -Vault $recoveryVault