variable "do_size_master" {
  type        = string
  description = "Escolha um plano para o nó master"
  default     = "s-2vcpu-2gb"
}

variable "do_size_worker" {
  type        = string
  description = "Escolha um plano para o nó worker"
  default     = "s-2vcpu-2gb"
}

variable "do_region" {
  type        = string
  description = "Escolha a região"
  default     = "nyc1"
}

variable "do_token" {
  type        = string
  description = "Informe seu token da digitalocean"
}

variable "do_ssh_keys" {
  type        = list(string)
  description = "Informe suas chaves ssh da digitalocean"
}

variable "do_tags" {
  type        = list(string)
  description = "Informe suas tags para identificar este projeto"
  default     = ["k8s", "kubernetes", "kubeadm"]
}

variable "pvt_key" {
  type        = string
  description = "Informe o caminho da sua chave ssh privada"
}
