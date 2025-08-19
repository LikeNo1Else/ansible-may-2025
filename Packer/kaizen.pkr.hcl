packer {
  required_plugins {
    amazon = {
      version = "1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "my-image-{{ timestamp }}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami = "ami-00ca32bbc84273381"

  ssh_username = "ec2-user"
  ssh_keypair_name = "ansible-key"
  ssh_private_key_file = "~/.ssh/id_rsa"
 
#   ami_regions = [
#     "us-east-2",
#     "us-west-1",
#     "us-west-2"
#   ]
 
#  ami_user = [
#  ]

}

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    script = "kaizen.sh"
  }
}
