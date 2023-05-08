resource "null_resource" "remote"{
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file(var.private_key)
    host  = aws_instance.ec2_thkee_dev.private_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt install update -y",
      "sudo apt install xrdp -y",
      "sudo systemctl enable xrdp",
      "sudo add-apt-repository ppa:gnome3-team/gnome3 -y",
      "sudo apt install gnome-shell ubuntu-gnome-desktop -y",
      "echo 'ubuntu:ubuntu' | sudo chpasswd"
    ]
  }
}
