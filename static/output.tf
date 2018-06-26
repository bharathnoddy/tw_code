output "EC2name" {
  value = "${aws_instance.static.id}"
}

output "ip" {
  value = "${aws_instance.static.public_ip}"
}
