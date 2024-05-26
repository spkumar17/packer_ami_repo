build {
  name    = "hq-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

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

  // post-processor "vagrant" {}
  // post-processor "compress" {}
}

