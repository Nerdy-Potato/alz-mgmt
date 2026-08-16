using './main.bicep'

// Retained for static validation only. NETWORK_TYPE is none and no workflow invokes this template.
param parLocations = [
  'westus2'
]
param parGlobalResourceLock = {
  name: 'GlobalResourceLock'
  kind: 'None'
  notes: 'This lock was created by the ALZ Bicep Accelerator.'
}
param parTags = {}
param parEnableTelemetry = true

param parHubNetworkingResourceGroupNamePrefix = 'rg-alz-conn'
param parDnsResourceGroupNamePrefix = 'rg-alz-dns'
param parDnsPrivateResolverResourceGroupNamePrefix = 'rg-alz-dnspr'

// An empty hub list makes accidental direct deployment a no-op.
param hubNetworks = []
