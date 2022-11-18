# Terraform entry point

terraform {
	required_providers {
		github = {
			source  = "integrations/github"
			version = "~> 4.0"
		}
	}
}

# Configure the GitHub Provider
provider "github" {
	owner = "safetybeacon" # Must be set, otherwise Terraform will try to manage your personal GitHub resources!
	# token = "" # Personal GitHub Access token, allows Terraform to manage GitHub on your behalf. But instead of this, we use the GITHUB_TOKEN environment variable.
}

# Configure the Organisation
# resource "github_organization_settings" "safetybeacon" {

#     # billing_email 		= "" # Private
#     company 			= "Safety Beacon"
#     blog 				= "https://safetybeacon.app"
#     # email 				= "" # Public email
#     # twitter_username 	= ""
#     location 			= "Australia"
#     name 				= "Safety Beacon"
#     description 		= "The digital \"angel shot\""

#     has_organization_projects = true
#     has_repository_projects = true
#     default_repository_permission = "read"
#     members_can_create_repositories = true
#     members_can_create_public_repositories = true
#     members_can_create_private_repositories = true
#     members_can_create_internal_repositories = true
#     members_can_create_pages = true
#     members_can_create_public_pages = true
#     members_can_create_private_pages = true
#     members_can_fork_private_repositories = false # Forked repos can kept when removed from organisation
#     web_commit_signoff_required = true
#     advanced_security_enabled_for_new_repositories = false
#     dependabot_alerts_enabled_for_new_repositories = true
#     dependabot_security_updates_enabled_for_new_repositories = true
#     dependency_graph_enabled_for_new_repositories = false
#     secret_scanning_enabled_for_new_repositories = false
#     secret_scanning_push_protection_enabled_for_new_repositories = false
# }
