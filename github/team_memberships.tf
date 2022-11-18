# Manage team memberships
# Possible roles: maintainer, member

resource "github_team_membership" "toby_in_sre" {
	team_id = "${github_team.sre.id}"
	username = "tobyscott25"
	role = "maintainer"
}

resource "github_team_membership" "toby_in_developers" {
	team_id = "${github_team.developers.id}"
	username = "tobyscott25"
	role = "maintainer"
}