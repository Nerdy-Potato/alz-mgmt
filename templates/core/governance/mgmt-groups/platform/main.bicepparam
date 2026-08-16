using './main.bicep'

// General Parameters
param parLocations = [
  'westus2'
]
param parEnableTelemetry = true

param platformConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'np-platform'
  managementGroupParentId: 'np-alz'
  managementGroupIntermediateRootName: 'np-alz'
  managementGroupDisplayName: 'Nerdy Potato Platform'
  managementGroupDoNotEnforcePolicyAssignments: [
    'DenyAction-DeleteUAMIAMA'
    'Enforce-ASR'
    'Enforce-Encrypt-CMK0'
    'Enforce-GR-APIM0'
    'Enforce-GR-AppServices0'
    'Enforce-GR-Automation0'
    'Enforce-GR-BotService0'
    'Enforce-GR-CogServ0'
    'Enforce-GR-Compute0'
    'Enforce-GR-ContApps0'
    'Enforce-GR-ContInst0'
    'Enforce-GR-ContReg0'
    'Enforce-GR-CosmosDb0'
    'Enforce-GR-DataExpl0'
    'Enforce-GR-DataFactory0'
    'Enforce-GR-EventGrid0'
    'Enforce-GR-EventHub0'
    'Enforce-GR-KeyVault'
    'Enforce-GR-KeyVaultSup0'
    'Enforce-GR-Kubernetes0'
    'Enforce-GR-MachLearn0'
    'Enforce-GR-MySQL0'
    'Enforce-GR-Network0'
    'Enforce-GR-OpenAI0'
    'Enforce-GR-PostgreSQL0'
    'Enforce-GR-ServiceBus0'
    'Enforce-GR-SQL0'
    'Enforce-GR-Storage0'
    'Enforce-GR-Synapse0'
    'Enforce-GR-VirtualDesk0'
    'Enforce-Subnet-Private'
  ]
  managementGroupExcludedPolicyAssignments: [
    'Deploy-GuestAttest'
    'Deploy-MDFC-DefSQL-AMA'
    'Deploy-VM-ChangeTrack'
    'Deploy-VM-Monitoring'
    'Deploy-vmArc-ChangeTrack'
    'Deploy-vmHybr-Monitoring'
    'Deploy-VMSS-ChangeTrack'
    'Deploy-VMSS-Monitoring'
    'Enable-AUM-CheckUpdates'
  ]
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  'Deploy-VM-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-ct-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-vmi-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-ct-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-vmi-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmArc-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-ct-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmHybr-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-vmi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-MDFC-DefSQL-AMA': {
    parameters: {
      userWorkspaceResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
      dcrResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-mdfcsql-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'DenyAction-DeleteUAMIAMA': {
    parameters: {
      resourceName: {
        value: 'mi-alz-${parLocations[0]}'
      }
    }
  }
}
