locals {
    default_tags = {
      component     = "XXX-myapp-s3-bucket <component>"
      #env_suffix    = "XXX <env_suffix>" # this isn't defined here as in the original, but rather is gleaned from the folder name
    }
}
