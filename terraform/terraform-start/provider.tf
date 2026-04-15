
terraform {
  required_version = ">= 0.13"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex" # ВАЖНО: именно yandex-cloud, а не hashicorp
      version = ">= 0.13"   
    }
  }
}

provider "yandex" {
  zone = "ru-central1-a"
}
