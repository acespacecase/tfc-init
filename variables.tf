resource "tfe_variable" "pet_name_length" {
    key = "pet_name_length"
    value = "5"
    category = "terraform"
    workspace_id = tfe_workspace.noodles_the_dog.id
}

resource "tfe_variable" "chosen_separator" {
    key = "chosen_separator"
    value = " ... "
    category = "terraform"
    workspace_id = tfe_workspace.noodles_the_dog.id
}

resource "tfe_variable" "prefix" {
    key = "TF_VAR_prefix"
    value = "madam"
    category = "env"
    workspace_id = tfe_workspace.noodles_the_dog.id
}

variable "TF_VAR_GITHUB_TOKEN" {}
variable "email" {}