using './main.bicep'

// General Parameters
param parLocations = [
  'westus2'
]
param parEnableTelemetry = true

param landingZonesCorpConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'np-corp'
  managementGroupParentId: 'np-landingzones'
  managementGroupIntermediateRootName: 'np-alz'
  managementGroupDisplayName: 'Nerdy Potato Corp'
  managementGroupDoNotEnforcePolicyAssignments: [
    'Deny-HybridNetworking'
    'Deny-Public-Endpoints'
    'Deny-Public-IP-On-NIC'
  ]
  managementGroupExcludedPolicyAssignments: [
    'Deploy-Private-DNS-Zones'
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

// Private DNS deployment remains excluded while NETWORK_TYPE is none.
param parPolicyAssignmentParameterOverrides = {}
