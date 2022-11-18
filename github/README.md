# GitHub Terraform
https://learn.hashicorp.com/tutorials/terraform/github-user-teams


## Configure your credentials

### Generate yourself a GitHub PAT (Personal Access Token)

Terraform uses your GitHub PAT to manage GitHub on your behalf. Create one with at least the following permissions:
1. The `repo` permisison for full control of private repositories.
2. The `admin:org` permission for full control of orgs and teams, read and write org projects
3. The `delete_repo` permission to delete repositories

You will need to set `GITHUB_TOKEN` to your GitHub PAT for Terraform to use it.
```bash
$ export GITHUB_TOKEN=<Your GitHub PAT>
```
