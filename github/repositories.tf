# Manage repositories within the organisation

# resource "github_repository" ".github" {
# 	name = ".github"
# }
# Terraform can't manage repos that begin with a period.

resource "github_repository" "beacon-api" {
	name 					= "beacon-api"
	description 			= "Safety Beacon API"
	vulnerability_alerts 	= true
	has_issues 				= true
	has_projects 			= true
	has_wiki 				= true
}

resource "github_repository" "infrastructure" {
	name 					= "infrastructure"
	description 			= "Infrastructure as Code"
	vulnerability_alerts 	= true
	has_issues 				= true
	has_projects 			= true
	has_wiki 				= true
}

resource "github_repository" "website" {
	name 					= "website"
	description 			= "Safety Beacon's website"
	homepage_url 			= "https://safetybeacon.app"
	vulnerability_alerts 	= true
	has_issues 				= true
	has_projects 			= true
	has_wiki 				= true
}
