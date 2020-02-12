provider "tfe" {
    hostname = "app.terraform.io"
}

resource "tfe_organization" "stacy_provider_vartest" {
    name = "stacy_provider_vartest"
    email = var.email
}

resource "tfe_oauth_client" "github" {
    organization = tfe_organization.stacy_provider_vartest.name
    api_url = "https://api.github.com"
    http_url = "https://github.com"
    oauth_token = var.TF_VAR_GITHUB_TOKEN
    service_provider = "github"
}

resource "tfe_workspace" "noodles_the_dog" {
    name = "noodles-the-dog"
    organization = tfe_organization.stacy_provider_vartest.name
    vcs_repo {
        identifier = "acespacecase/terraform-variables"
        oauth_token_id = tfe_oauth_client.github.oauth_token_id
    }
}

resource "tfe_variable" "pet_name_length" {
    key = "pet_name_length"
    value = "5"
    category = "terraform"
    workspace_id = tfe_workspace.noodles_the_dog.id
}

resource "tfe_variable" "chosen_separator" {
    key = "chosen_separator"
    value = " ... "
    description = "stilasdfl testing"
    category = "terraform"
    workspace_id = tfe_workspace.noodles_the_dog.id
}

resource "tfe_variable" "separate" {
    key = "separate"
    value = "value"
    description = "stiasdfll testing"
    category = "terraform"
    workspace_id = tfe_workspace.noodles_the_dog.id
}

resource "tfe_variable" "prefix" {
    key = "TF_VAR_prefix"
    value = "madam"
    description = "lasasdft test" 
    category = "env"
    workspace_id = tfe_workspace.noodles_the_dog.id
}
