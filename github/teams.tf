# Manage teams within the organisation
# See: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team
# Privacy must be one of "secret" (default), or "closed".

resource "github_team" "sre" {
	name = "sre"
	description = "Site Reliability Engineers"
	privacy = "closed"
}

resource "github_team" "developers" {
	# ID: 7006504
	name = "developers"
	description = "Software Engineers"
	privacy = "closed"
}
