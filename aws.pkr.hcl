source "amazon-ebs" "ubuntu" {
  profile       = var.profile
  ami_name      = "${var.ami_name}-${local.timestamp}"
  instance_type = var.instance
  region        = var.region
  source_ami    = var.source_ami
  ssh_username  = var.ssh_username
  ami_regions   = var.ami_regions
}
