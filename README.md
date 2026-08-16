# Azure Landing Zones management

This repository defines a cost-conscious Azure Landing Zones hierarchy for the existing `nerdypotato.onmicrosoft.com` lab. It is configuration only: subscription placement is performed by the generated Bicep deployment after review, never by direct Azure CLI management-group operations.

## Architecture

| Scope | Configuration |
| --- | --- |
| Tenant / parent management group | `3b14ce70-8bea-4d11-9e2c-6b4a04c8010d` |
| Intermediate root | `np-alz` |
| Region | `westus2` only |
| Networking | `NETWORK_TYPE=none`; no hub or Virtual WAN workflow steps |
| Platform management | `np-platform-management` contains `67251182-3e62-45e7-a062-d8d77bb1cd15` |
| Online landing zones | `np-landingzones-online` contains `7e1b60b8-d616-4396-9de2-fc917930d02e`, `25ce2c45-140d-4d23-b6f6-87bb708d08af`, and `e13130f9-3958-40e9-bb2f-c40cdebcfbb6` |
| Empty structural groups | Connectivity, Identity, Security, Corp, Local, Sandbox, and Decommissioned |

Identity, Security, Management, Purview, organizational Copilot budgets, and other shared services remain together in the MGMT subscription. A subscription can have only one management-group parent, so MGMT is placed only under `np-platform-management`.

## Existing-workload safety

The initial baseline intentionally separates visibility from enforcement:

- Generated audit-only assignments remain active, including resource/location, Trusted Launch, unused-resource cost, zone-resiliency, and Application Gateway WAF audits.
- Deny, deny-action, and guardrail assignments are created with `DoNotEnforce` so compliance can be reviewed before enforcement.
- Deploy/modify assignments are excluded. This prevents automatic Defender, monitoring agent, backup, SQL security, diagnostic setting, DDoS, private DNS, or other resource deployment.
- Cross-management-group RBAC templates exclude assignments that are withheld, preventing role grants for absent policy assignments.
- Core logging is disabled by default in delivery. Its parameters use 30-day retention, a 0.5 GB/day cap, and no Change Tracking solution for a later explicit decision.

The existing Power Platform injection VNets, Cloud Shell storage/Event Grid resources, Azure Maps resources, Static Web Apps, storage accounts, GitHub managed identities, and `Microsoft.SentinelPlatformServices/msg-resources-f9f3` must not be deleted or reconfigured by the initial deployment. Core logging stays off until the existing `rgSpaidFamilySentinel` workspace and diagnostic topology are inventoried; do not create a duplicate Sentinel or Log Analytics configuration.

## Delivery controls

Continuous delivery is manual-only. Every deployment input defaults to `false`, `skip_what_if` defaults to `false`, and no networking input or step is exposed. OIDC and the generated reusable workflow remain unchanged; no repository secrets are required.

### First deployment sequence

1. Review the pull-request CI What-If. It must show only `westus2`, the intended management-group hierarchy, the four subscription-parent changes, audit assignments, and `DoNotEnforce` assignments. Reject the plan if it proposes networking, enforcement, workload deletion/modification, Sentinel enablement, diagnostic settings, Defender plans/agents, backup, or other resource deployment. CI also previews core logging because the generated CI template includes it; those resources are informational and out of scope for the first deployment.
2. After approval and merge, manually dispatch CD with `skip_what_if=false`; enable only **Governance - Intermediate Root**, **Governance - Landing Zones**, and **Governance - Platform**. Leave child groups, RBAC, sandbox, decommissioned, and core logging disabled. Review and approve the workflow What-If before applying the parent hierarchy and staged policy baseline.
3. Manually dispatch CD again with `skip_what_if=false`; enable only **Governance - Landing Zone Children** and **Governance - Platform Children**. Review and approve the What-If before creating the child groups and placing MGMT under `np-platform-management` and the three workload/free subscriptions under `np-landingzones-online`.
4. Leave **Cross-MG RBAC** and **Core Logging** disabled. Enable individual excluded policies or logging only in later pull requests after validating existing resources, costs, exemptions, identities, and remediation scope.

No Azure deployment workflow should be run or approved as part of repository customization.
