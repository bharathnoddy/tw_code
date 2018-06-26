provider "aws" {
  access_key = "${var.ACCESS_ID}",
  secret_key = "${var.SECRET_KEY}",
  region = "${var.REGION}"
}



resource "aws_instance" "static"{
  ami = "${var.AMI}",
  instance_type = "t2.micro",
  availability_zone  = "ap-south-1a"
  key_name  = "${var.KEY_NAME}",
  vpc_security_group_ids = ["${var.SECURITY_GROUP}"]

provisioner "file" {
    source      = "filelist"
    destination = "/tmp/filelist"

  connection {
            type = "ssh"
            user = "ec2-user"
            private_key = "${file("/Users/nadarb/Downloads/bharath-coreos.pem")}" # with or without
            agent = false # true/false
        }
      }


provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/filelist/user_data.sh",
     "sudo /tmp/filelist/user_data.sh"
    ]
    connection {
              type = "ssh"
              user = "ec2-user"
              private_key = "${file("/Users/nadarb/Downloads/bharath-coreos.pem")}" # with or without
              agent = false # true/false
          }
  }

}
