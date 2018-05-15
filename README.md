# Consul AutoPilot - Automated Upgrades

Consul is an integral part of an application environment, and the high availability during an upgrade is an important part of ensuring your applications are not affected. Upgrades may not just be a version change of Consul. If you have adopted an immutable infrastructure approach with your virtual machines, this process will work well for that use case too.

## Reference Material
- [Packer for building an image](https://www.packer.io/downloads.html)

## Estimated Time to Complete
_30 Minutes_

## Personas
A Consul administrator 

## Challenge
In this instance, we are rolling images monthly, as part of a patching strategy. To ensure we can upgrade without a problem, we need a way to upgrade, while ensuring there is data convergence. This includes ensuring data convergence has completed, while removing the old servers from the cluster.

## Solution
By utilizing [Consul AutoPilot](https://www.consul.io/docs/guides/autopilot.html), we take advantage of an automated capability in Consul to bring the new servers into the cluster, allow for them to converge their data, and then automatically remove the old servers from the cluster.

## Prerequisites
- Have AWS Access keys ready to go

## Steps

## Step 1: Setup your AMI Images

### Clone a repo:

[Repo to Clone](https://github.com/AdamCavaliere/Consul-AutoPilot)

### Consul Vault Config:

Configure your environment variables:

```export CONSUL_ENT_URL=https://s3.amazonaws.com/binaries-azc/consul-enterprise_1.0.7%2Bent_linux_amd64.zip
export CONSUL_VERSION=1.0.7
```

From the root directory where you cloned the repo: `cd packer-images/vault/`

`packer build vault.json`

*Copy the AMI ID for later use.*

### Consul AMI Config:
```sh
cd ../consul
packer build consul.json```

*Copy the AMI ID for later use.*

### AWS Components

#### AWS KMS Key for Auto-Unseal

Create an AWS KMS Key following the defaults all the way through for creation. 

AWS —> IAM —> Encryption Keys
Create key —> Enter Alias Name —> Next Step —> Optional Tags —> Next Step
Defne Key Administration - Choose who can manage the key - no bearing on Auto Unseal
Define Key Usage Permission - Choose the key which vault will use to access this key for auto unseal

Copy the Key ID after it is created.

E.g.: c1636bfe-08ef-4ca9-9002-41a37eb39fac

### Step n: _Step Title_
_Summary of what will be completed in this step._

#### UI
_[Link to docs for this command if available]()_
##### Request
_UI request screenshot(s)_

##### Response
_UI response screenshot(s)_

#### CLI
_[Link to CLI docs for this command if available]()_

##### Request
```sh
$ <CLI request command>
```

_[Link to specific CLI request command in accompanying guide script]()_

##### Response
```
$ <CLI request response output>
```


#### cURL
_[Link to API docs for this command if available]()_

##### Request
```sh
$ <curl request command>
```

_[Link to specific cURL request command in accompanying guide script]()_

##### Response
```
$ <curl request response output>
```

#### PowerShell
_[Link to API docs for this command if available]()_

##### Request
```sh
$ <PowerShell Invoke-RestMethod request command>
```

_[Link to specific PowerShell request command in accompanying guide script]()_

##### Response
```
$ <PowerShell Invoke-RestMethod response output>
```

#### Terraform
_[Link to docs for resources to be provisioned if available]()_

##### Request
```sh
$ <terraform apply command>
```

_[Link to specific Terraform config accompanying guide script]()_

##### Response
```
$ <terraform apply command output>
```

#### Validation
_Summary of test(s) used to validate the step was completed successfully._

##### Request
```sh
$ <validation command>
```

_[Link to specific validation command in accompanying guide script]()_

##### Response
```
<validation output>
```


#### Documentation
- _[Any reference content that might be valuable]()_

## Next Steps
### _Persona_
- _[Link to next guide that each persona should complete next]()_

