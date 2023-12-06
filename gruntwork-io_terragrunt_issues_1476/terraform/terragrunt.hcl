
# remote_state { ... }

locals {
    account_hcl = read_terragrunt_config(find_in_parent_folders("account.hcl")).locals
    region_hcl = read_terragrunt_config(find_in_parent_folders("region.hcl")).locals
    tags_hcl = read_terragrunt_config(find_in_parent_folders("tags.hcl")).locals
    split_path = regexall("[^\\/]+", path_relative_to_include())
    leaf_folder = local.split_path[length(local.split_path)-1]
    env_suffix = regex("^([^-]+)",local.leaf_folder)[0]
}

inputs = {
    default_tags = merge(
        local.account_hcl.default_tags, 
        local.tags_hcl.default_tags,
        {env_suffix = local.env_suffix}
    )
}

generate tgvariables {
  path = "_generated.tgvariables.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  variable default_tags {
    type = map(string)
  }
  EOF
}
