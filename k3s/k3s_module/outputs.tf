output "master" {
  value = digitalocean_droplet.master.ipv4_address
  description = "IP node master"
}