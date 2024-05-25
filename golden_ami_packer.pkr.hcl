packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# which ami to use as the base and where to save it
source "amazon-chroot" "amazon-linux" {                 #To modify an AMI directly without starting an instance  ---> amazon-chroot
  region          = "ap-southeast-2"
  ami_name        = "ami-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-080660c9757080771"
  ssh_username    = "ubuntu"
  ami_users      = ["437151017659"]
  ami_regions     = [
                      "ap-southeast-2", #Sydney
                      "us-east-1" ,#Virginia
                      "ap-south-2", #Hyderabad
                      "ap-south-1", #mumbai


                    ]
}

# what to install, configure and file to copy/execute
build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]


  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
}

  provisioner "shell" {
  inline = [
    "chmod a+x /tmp/provisioner.sh",
    "ls -la /tmp",
    "pwd",
    "cat /tmp/provisioner.sh",
    "/bin/bash -x /tmp/provisioner.sh"
  ]
}
}