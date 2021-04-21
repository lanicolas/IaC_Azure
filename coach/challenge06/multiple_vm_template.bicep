@description('Specifies number of VMs to create')
param vmCount int = 2

@description('Specifies a name for generating resource names.')
param vmName string = 'challenge06'

@description('Specifies the location for all resources.')
param location string = resourceGroup().location

@description('Specifies a username for the Virtual Machine.')
param adminUsername string = 'azureuser'

@description('Specifies the SSH rsa public key file as a string. Use "ssh-keygen -t rsa -b 2048" to generate your SSH key pairs.')
param adminPublicKey string ='xxx-xxxx-xxx'

@description('description')
param vmSize string = 'Standard_D2s_v3'

var vNetName_var = '${vmName}-vnet'
var vnetAddressPrefix = '10.0.0.0/16'
var vNetSubnetName = '${vmName}-subnet'
var subnetPrefix = '10.0.0.0/24'
var publicIPAddressName = '${vmName}-ip'
var networkInterfaceName = '${vmName}-nic'
var networkSecurityGroupName_var = '${vmName}-nsg'
var networkSecurityGroupName2_var = '${vNetSubnetName}-nsg'
var vmArray=range(1, vmCount)

resource networkSecurityGroupName 'Microsoft.Network/networkSecurityGroups@2020-05-01' = {
  name: networkSecurityGroupName_var
  location: location
  properties: {
    securityRules: [
      {
        name: 'SSH'
        properties: {
          priority: 300
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
      {
        name: 'HTTP'
        properties: {
          priority: 320
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '80'
        }
      }
    ]
  }
}

resource publicIPAddressName_vmCount 'Microsoft.Network/publicIPAddresses@2020-05-01' = [for i in vmArray: {
  name: '${publicIPAddressName}${i}'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
  sku: {
    name: 'Basic'
  }
}]

resource vNetName 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: vNetName_var
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: vNetSubnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: networkSecurityGroupName.id
          }
        }
      }
    ]
  }
}

resource networkInterfaceName_vmCount 'Microsoft.Network/networkInterfaces@2020-05-01' = [for i in vmArray: {
  name: '${networkInterfaceName}${i}'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', '${publicIPAddressName}${i}')
          }
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vNetName_var, vNetSubnetName)
          }
        }
      }
    ]
  }
  dependsOn: [
    publicIPAddressName_vmCount
    vNetName
    networkSecurityGroupName
  ]
}]

resource vmName_vmCount 'Microsoft.Compute/virtualMachines@2019-12-01' = [for i in vmArray: {
  name: '${vmName}${i}'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: adminPublicKey
            }
          ]
        }
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resourceId('Microsoft.Network/networkInterfaces', '${networkInterfaceName}${i}')
        }
      ]
    }
  }
  dependsOn: [
    networkInterfaceName_vmCount
  ]
}]


output publicIpAddress array = [for i in vmArray: reference(resourceId('Microsoft.Network/publicIPAddresses', '${publicIPAddressName}${i}'),'2020-07-01').ipAddress]
