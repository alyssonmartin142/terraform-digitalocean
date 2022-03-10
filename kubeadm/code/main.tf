module "kubeadm" {
  source         = "../kubeadm_module"
  do_size_master = var.do_size_master
  do_size_worker = var.do_size_worker
  do_region      = var.do_region
  do_token       = var.do_token
  do_ssh_keys    = var.do_ssh_keys
  do_tags        = var.do_tags
  pvt_key        = var.pvt_key
}
