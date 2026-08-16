using './main-rbac.bicep'

param parLandingZonesManagementGroupName = 'np-landingzones'
param parPlatformManagementGroupName = 'np-platform'
param parConnectivityManagementGroupName = 'np-connectivity'
param parManagementGroupExcludedPolicyAssignments = []
param parEnableTelemetry = true
