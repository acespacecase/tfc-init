provider "tfe" {
    hostname = "staging-app.terraform.io"
}

resource "tfe_organization" "stacy_provider" {
    name = "stacy_provider"
    email = var.email
}

resource "tfe_oauth_client" "github" {
    organization = tfe_organization.stacy_provider.name
    api_url = "https://api.github.com"
    http_url = "https://github.com"
    oauth_token = var.TF_VAR_GITHUB_TOKEN
    service_provider = "github"
}

resource "tfe_workspace" "noodles_the_dog" {
    name = "noodles-the-dog"
    organization = tfe_organization.stacy_provider.name
    vcs_repo {
        identifier = "acespacecase/terraform-variables"
        oauth_token_id = tfe_oauth_client.github.oauth_token_id
    }
}