variable "aws_accounts" {
  type = map(string)
}

variable "aws_region" {
  type = string
}

variable "DeployModule" {
  type    = bool
  default = true
}

/* Tags Variables */
variable "project-tags" {
  type = map(string)
  default = {
    Application = "Codepipeline-POC",
    CreatedBy   = "CodePipeline in DEV Account"
  }
}