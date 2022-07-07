module "demo" {
  source = "./modules/demo"
  count  = var.DeployModule ? 1 : 0
}