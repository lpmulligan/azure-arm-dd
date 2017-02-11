### Define variables
{
$resourceGroupLocation = 'North Central US'
$resourceGroupName = 'lpm-unicorner-paas'
$resourceDeploymentName = 'lpm-unicorner-paas-deployment'
$templatePath = $env:USERPROFILE + '\Development\Azure\azure-arm-dd\M4'
$templateFile = 'unicornerPaas.json'
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