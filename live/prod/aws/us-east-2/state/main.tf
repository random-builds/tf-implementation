data "aws_caller_identity" "current" {}

module "tf_state" {
  source = "github.com/random-builds/tf-module-internal//terraform-state?ref=eace237"

  base_bucket_name  = "tf-state-${data.aws_caller_identity.current.account_id}"
  s3_module_version = "4.2.2"

  providers = {
    aws        = aws.primary
    aws.backup = aws.backup
  }
}