resource "aws_instance" "mongodb" {
  ami           = "${ var.ami-id }"
  instance_type = "${ var.instance-type }"
  key_name = "${ var.key-name }"
  associate_public_ip_address = true

  source_dest_check = true
  subnet_id = "${ element( split(",", var.subnet-ids), 0 ) }"
  
  # Storage
  root_block_device {
    volume_size = "${ var.volume_size["root"] }"
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
      "${ var.security-group-id }",
      "${ var.default-group-id }"
  ]
  
  tags {
    builtWith = "terraform"
    depends-id = "${ var.depends-id }"
    kz8s = "${ var.name }"
    Name = "kz8s-${ var.name }-mongodb"
    role = "mongodb"
    visibility = "private"
  }
}

resource "null_resource" "dummy_dependency" {
  depends_on = [ "aws_instance.mongodb" ]
}
