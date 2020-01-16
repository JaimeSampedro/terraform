module "rsg" {
  source      = "git::https://github.com/JaimeSampedro/terraform.az.rsg.git"
  name     = var.name
  location = var.location
  environment = var.environment
  department  = var.department

}
# https://github.com/JaimeSampedro/terraform.git
# https://github.com/JaimeSampedro/terraform/tree/master/modules/rsg.git

# "git::https://gitlab.alm.gsnetcloud.corp/ccoe/iac.az.modules.rsg.git?ref=0ffffc109749ccb6c2fc522d1ef6ec2fdc80875d"