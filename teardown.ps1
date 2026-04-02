$rgName = "ca1_rg"

az group delete `
    --name $rgName `
    --yes `
    --no-wait
