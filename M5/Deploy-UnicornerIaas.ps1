### Define variables
{
$location = 'North Central US'
$resourceGroupName = 'lpm-unicorner-iaas'
$resourceDeploymentName = 'lpm-unicorner-iaas-deployment'
##$templatePath = $env:USERPROFILE + 'Development\Azure\azure-arm-dd\M5'
$templatePath = "D:\mulligal\Documents\Dropbox\" + 'Development\Azure\azure-arm-dd\M5'
$templateFile = 'unicornerIaas.json'
$template = $templatePath + '\' + $templateFile
$password = "Husker24u!"
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force
}

 @additionalParameters `

### Deploy Resources
{

$additionalParameters = New-Object -TypeName Hashtable
$additionalParameters['vmAdminPassword'] = $securePassword

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    @additionalParameters `
    -Verbose -Force
}