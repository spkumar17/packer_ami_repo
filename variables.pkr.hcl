# Common
variable "profile" {
  type        = string
  description = "AWS profile name"
}

variable "instance" {
  type = string
}

variable "region" {
  type = string
}

# Ubuntu
variable "ami_name" {
  type = string
}

variable "ssh_username" {
  type = string
}

variable "source_ami" {
  type = string
  validation {
    condition     = length(var.source_ami) > 4 && substr(var.source_ami, 0, 4) == "ami-"
    error_message = "The source_ami_ubuntu value must be a valid source_ami_ubuntu, starting with \"ami-\"."
  }
}

variable "ami_regions" {
  type = list(string)
}
