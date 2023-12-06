variable default_tags {
    type = map(string)
    # in the original code this was optional
    # however, this is used to generate the bucket name
    # so this should be mandatory
    # ideally we'd add validation too
    # see https://developer.hashicorp.com/terraform/language/expressions/custom-conditions
}