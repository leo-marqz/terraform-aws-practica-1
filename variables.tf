
variable "tags" {
  type = map(string)
  default = {
    Client = "ABC Enterprise"
    Env = "dev"
    Impl = "leomarqz"
    Dept = "IT"
    Cloud = "Amazon Web Services"
    ICode = "Terraform"
    ICode_version = "1.0"
  }
}

variable "vpc_vrg" {
    type = string
    default = "10.0.0.0/16"
}

variable "subnets" {
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24"]
}
