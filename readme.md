# Deploy an Azure VM with wordpress

This project has the goal of deploying a simple wordpress installation on an Azure Virtual Machine. 

## What will be deployed?

1. A Resource Group
2. A Linux virtual machine (Standard_B1ms)
3. An Operation System SSD Disk
4. A Public IP
5. A Network Interfce Card
6. A security group

## Steps to deploy

1. On project root directory, run `terraform init` to initialize terraform and download providers.
2. Run `terraform validate` to make sure the configuration is valid.
3. Make sure **azure-cli** is installed on your machine and after CLI authenticathion, run `terraform apply`.
4. After checking all the resources that will be created, confirm the apply writing *yes*.
5. Usually the wordpress installation script takes some time to completely install it, so wait 5 or 10 min in order to have a fullly functional wordpress vm.

## What will be outputed after deploying resources?

1. VM Private IP
2. VM Public IP
3. VM DNS