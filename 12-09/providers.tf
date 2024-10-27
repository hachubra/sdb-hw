terraform {
    required_providers{
            yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


variable "yandex_cloud_token" {
  type = string
  description = "Данная переменная потребует ввести секретный токен в консоли при запуске terraform plan/apply"
}

provider "yandex" {
  #token     = var.yandex_cloud_token #секретные данные должны быть в сохранности!! Никогда не выкладывайте токен в публичный доступ.
  cloud_id  = "b1g1li51c4ebgmu7e9s6"
  folder_id = "b1gbldqcbvmq6hh0agh0"
  zone      = "ru-central1-b"
}

