# Manage users within the organisation
# Possible roles: "admin" or "member"

# Core team
resource "github_membership" "tobyscott25" {
	username 	= "tobyscott25"
	role		= "admin"
}


# Contractors
resource "github_membership" "t4ke0" {
	username 	= "t4ke0"
	role 		= "member"
}