$rgName = "ca1_rg"
$location = "westeurope"

if (az group exists --name $rgName | ConvertFrom-Json) {
    Write-Host "Resource group already exists. Exiting."
    exit 1
}

az group create `
    --name $rgName `
    --location $location

az vm create `
    --resource-group $rgName `
    --name ca1VM `
    --image Ubuntu2204 `
    --size Standard_B1s `
    --admin-username azureuser `
    --generate-ssh-keys `
    --custom-data vm_init.yml `
    --public-ip-sku Standard

az vm open-port `
    --resource-group $rgName `
    --name ca1VM `
    --port 80
