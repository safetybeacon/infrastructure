# Manage teams within the organisation

resource "github_team" "sre" {
	name = "sre"
	description = "Site Reliability Engineers"
	privacy = "closed"
}

resource "github_team" "developers" {
	name = "developers"
	description = "Software Engineers"
	privacy = "closed"
}
