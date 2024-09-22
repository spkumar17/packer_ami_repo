ami_name      = "ami-version-1.0.1-{{timestamp}}"
instance_type = "t2.micro"
region        = "ap-southeast-2"
source_ami    = "ami-080660c9757080771"
ssh_username  = "ubuntu"
ami_regions   =  [
  // "ap-southeast-2", # Sydney
  // "us-east-1",      # Virginia
   "ap-south-1",     # Mumbai
  // "ap-northeast-1"
 ]
