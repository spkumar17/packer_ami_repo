# Define which plugins are required
required_plugins {
  amazon = {
    version = ">= 0.0.2"
    source  = "github.com/hashicorp/amazon"
  }
}

# Define the builder block
build {
  name = "hq-packer"

  # Specify the builder
  builder "amazon-chroot" "ubuntu" {
    region        = "ap-southeast-2"
    ami_name      = "ami-version-1.0.1-{{timestamp}}"
    instance_type = "t2.micro"
    source_ami    = "ami-080660c9757080771"
    ssh_username  = "ubuntu"
    ami_regions     = [
                      "ap-southeast-2", #Sydney
                      "us-east-1" ,#Virginia
                      "ap-south-2", #Hyderabad
                      "ap-south-1", #mumbai


                    ]

  }

  # Define what to install, configure, and execute
  provisioner "file" {
    source      = "provisioner.sh"
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
