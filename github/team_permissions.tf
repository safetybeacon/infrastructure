# Manage team permissions to repositories
# See: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository
# Possible permissions: "pull" (default), "triage", "push", "maintain", "admin" or the name of an existing custom repository role within the organisation.

resource "github_team_repository" "infrastructure" {
	team_id 		= "${github_team.sre.id}"
	repository 		= "${github_repository.infrastructure.name}"
	permission 		= "push"
}

resource "github_team_repository" "beacon-api" {
	team_id 		= "${github_team.developers.id}"
	repository 		= "${github_repository.beacon-api.name}"
	permission 		= "push"
}