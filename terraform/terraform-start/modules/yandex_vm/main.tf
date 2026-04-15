

# нельзя просто создать вирт машину
# для каждого ресурса необходимо сеть и подсеть
# внутр сеть доступная только для одного окружения, извне доступа нет
# просто создать сеть и брать ip не получиться, потому что есть подсеть
# в подсети описываем диапозон адресов для наших ресурсов

# создание сет
resource "yandex_vpc_network" "network-1" {
# мин данных
    name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
    name = "subnet1"
    network_id = yandex_vpc_network.network-1.id
    v4_cidr_blocks = ["10.10.10.0/24"]
}

resource "yandex_compute_instance" "my_vm" {
    name = "linux-vm"
    platform_id = "standard-v1"
    network_interface {
      subnet_id = yandex_vpc_subnet.subnet-1.id
      nat = true
    }
    resources {
        cores = var.cores
        memory = var.ram
    }
    # используем диск по умолчанию (15гб)
    boot_disk {
        initialize_params {
            image_id = "fd8i5gvlr8t2tcesgf2g"
        }
    }
    metadata = {
      ssh-keys = "unbuntu:${var.ssh-key}"
    }
}

