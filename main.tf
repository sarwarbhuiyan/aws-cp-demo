provider "aws" {
    region = var.region
}

resource "aws_instance" "cp_demo" {
    ami = var.ami_image
    instance_type = var.instance_size
    key_name = var.key_name
    security_groups = [var.security_group]
    root_block_device {
      volume_type = "gp3"
      volume_size = "100"
 
    }
   tags = {
            Name = var.instance_name
            Owner = var.instance_owner 
    }

    provisioner "remote-exec" {
      inline = ["sudo yum update -y && sudo yum install python -y"]
    }

    provisioner "local-exec" {
    command = <<EOT
        sleep 30;
        >inventory.ini;
	echo "[cp-demo]" | tee -a inventory.ini;
	echo "${aws_instance.cp_demo.public_ip} ansible_user=${var.ansible_user} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      	export ANSIBLE_HOST_KEY_CHECKING=False;
	ansible-playbook -u ${var.ansible_user} --private-key ${var.private_key} -i inventory.ini ./playbook.yml
    	EOT
    }
  
    connection {
      type = "ssh"
      private_key = "${file(var.private_key)}"
      user        = "${var.ansible_user}"
      host        = self.public_ip
    }
}
