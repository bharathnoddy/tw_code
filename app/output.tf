output "EC2name" {
  value = "${aws_instance.app.id}"
}

output "ip" {
  value = "${aws_instance.app.public_ip}"
}
