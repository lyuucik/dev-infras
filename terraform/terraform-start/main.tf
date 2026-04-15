module "yandex_vm" {
  source = "./modules/yandex_vm" # Обязательно добавьте ./
  cores = var.cores
  ram = var.ram
  ssh-key = var.ssh-key
}
