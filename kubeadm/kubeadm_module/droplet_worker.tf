resource "digitalocean_droplet" "worker" {
  depends_on = [digitalocean_droplet.master]
  count      = 2
  image      = "ubuntu-20-04-x64"
  name       = "worker-${count.index + 1}"
  region     = var.do_region
  size       = var.do_size_worker
  ssh_keys   = var.do_ssh_keys
  tags       = var.do_tags

  provisioner "remote-exec" {
    inline = local.remote_exec_inline

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }

  provisioner "local-exec" {
    command = "echo '${self.name} ansible_host=${self.ipv4_address} ansible_ssh_user=root ansible_ssh_private_key_file=${var.pvt_key} ansible_python_interpreter=/usr/bin/python3' > ../ansible/inventory/${self.name}"
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/inventory/${self.name} ../ansible/scripts/global-install.yml"
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/inventory/${self.name} ../ansible/scripts/worker-install.yml"
  }
}
