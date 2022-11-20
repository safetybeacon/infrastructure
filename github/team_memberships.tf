# Manage team memberships
# See: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership
# Possible roles: "maintainer" or "member"

# Core team
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

# Contractors
resource "github_team_membership" "t4ke0_in_developers" {
	team_id = "${github_team.developers.id}"
	username = "t4ke0"
	role = "member"
}
