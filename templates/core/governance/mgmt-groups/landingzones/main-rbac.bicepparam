using './main-rbac.bicep'

param parLandingZonesManagementGroupName = 'np-landingzones'
param parPlatformManagementGroupName = 'np-platform'
param parConnectivityManagementGroupName = 'np-connectivity'
param parManagementGroupExcludedPolicyAssignments = [
  'Deploy-VM-ChangeTrack'
  'Deploy-VM-Monitoring'
  'Deploy-vmArc-ChangeTrack'
  'Deploy-VMSS-ChangeTrack'
  'Deploy-vmHybr-Monitoring'
  'Deploy-VMSS-Monitoring'
  'Deploy-MDFC-DefSQL-AMA'
  'Enable-DDoS-VNET'
]
param parEnableTelemetry = true
