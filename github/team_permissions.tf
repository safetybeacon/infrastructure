# Manage team permissions to repositories
# Possible permissions: push, 

resource "github_team_repository" "infrastructure" {
	team_id = "${github_team.sre.id}"
	repository = "${github_repository.infrastructure.name}"
	permission = "push"
}