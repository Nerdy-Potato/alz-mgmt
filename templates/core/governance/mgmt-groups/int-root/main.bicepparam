using './main.bicep'

// General Parameters
param parLocations = [
  'westus2'
]
param parEnableTelemetry = true

param intRootConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'np-alz'
  managementGroupParentId: '3b14ce70-8bea-4d11-9e2c-6b4a04c8010d'
  managementGroupDisplayName: 'Nerdy Potato Azure Landing Zones'
  // Keep the four generated audit assignments active. Stage blocking assignments without enforcement.
  managementGroupDoNotEnforcePolicyAssignments: [
    'Deny-Classic-Resources'
    'Deny-UnmanagedDisk'
    'Enforce-ACSB'
  ]
  // Resource-deploying assignments are withheld until existing services and costs are reviewed.
  managementGroupExcludedPolicyAssignments: [
    'Deploy-ASC-Monitoring'
    'Deploy-AzActivity-Log'
    'Deploy-Diag-LogsCat'
    'Deploy-MCSB2-Monitoring'
    'Deploy-MDEndpoints'
    'Deploy-MDEndpointsAMA'
    'Deploy-MDFC-Config-H224'
    'Deploy-MDFC-OssDb'
    'Deploy-MDFC-SqlAtp'
    'Deploy-SvcHealth-BuiltIn'
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
  'Deploy-MDFC-Config-H224': {
    parameters: {
      logAnalytics: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourcegroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
      emailSecurityContact: {
        value: 'security@yourcompany.com'
      }
      ascExportResourceGroupName: {
        value: 'rg-alz-asc-${parLocations[0]}'
      }
      ascExportResourceGroupLocation: {
        value: parLocations[0]
      }
    }
  }
  'Deploy-AzActivity-Log': {
    parameters: {
      logAnalytics: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourcegroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
      logsEnabled: {
        value: 'True'
      }
    }
  }
  'Deploy-Diag-LogsCat': {
    parameters: {
      logAnalytics: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourcegroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-SvcHealth-BuiltIn': {
    parameters: {
      resourceGroupLocation: {
        value: parLocations[0]
      }
      actionGroupResources: {
        value: {
          actionGroupEmail: ['triage@yourcompany.com']
          eventHubResourceId: []
          functionResourceId: ''
          functionTriggerUrl: ''
          logicappCallbackUrl: ''
          logicappResourceId: ''
          webhookServiceUri: []
        }
      }
    }
  }
  'Deploy-AzSqlDb-Auditing': {
    parameters: {
      logAnalyticsWorkspaceResourceId: {
        value: '/subscriptions/67251182-3e62-45e7-a062-d8d77bb1cd15/resourcegroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
    }
  }
}
