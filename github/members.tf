# Manage users within the organisation
# Possible roles: "admin" or "member"

resource "github_membership" "tobyscott25" {
	username = "tobyscott25"
	role = "admin"
}
