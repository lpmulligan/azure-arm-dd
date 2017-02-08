### Define variables
{
$location = 'North Central US'
$resourceGroupName = 'lpm-arm-dd-simple-iaas-template'
$resourceDeploymentName = 'lpm-arm-dd-iaas-template-deployment'
$templatePath = $env:USERPROFILE + '\Development\Azure\azure-arm-dd\M3'
$templateFile = 'simpleIaas.json'
$template = $templatePath + '\' + $templateFile
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force
}

### Deploy Resources
{
New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force
}