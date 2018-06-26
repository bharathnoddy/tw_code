variable "ACCESS_ID" {
  type = "string"
}

variable "SECRET_KEY" {
  type = "string"
}

variable "REGION" {
  type = "string"
  default = "ap-south-1"
}

variable "AMI" {
  type = "string"
  default = "ami-5b673c34"
}

variable "KEY_NAME" {
  type = "string"
  default = "bharath-coreos"
}

variable "SECURITY_GROUP" {
  type = "list"
  default = ["sg-e53f5c8e","sg-f27fda9a"]
}
