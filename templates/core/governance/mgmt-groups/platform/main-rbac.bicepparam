using './main-rbac.bicep'

param parPlatformManagementGroupName = 'np-platform'
param parConnectivityManagementGroupName = 'np-connectivity'
param parManagementGroupExcludedPolicyAssignments = [
  'Enable-DDoS-VNET'
]
param parEnableTelemetry = true
