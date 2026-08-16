using './main-rbac.bicep'

param parCorpManagementGroupName = 'np-corp'
param parConnectivityManagementGroupName = 'np-connectivity'
param parManagementGroupExcludedPolicyAssignments = [
  'Deploy-Private-DNS-Zones'
]
param parEnableTelemetry = true
