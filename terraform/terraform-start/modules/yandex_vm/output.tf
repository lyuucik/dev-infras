
output "nat_ip_address" {
  value = yandex_compute_instance.my_vm.network_interface[0].nat_ip_address
}
