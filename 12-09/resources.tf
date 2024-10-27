resource "yandex_mdb_postgresql_cluster" "ntlg-ha-pg" {
  name        = "ha-terraform-pg-cluster"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.ntlg-ha-pg.id

  config {
    version = 15
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 10
    }
  }

  maintenance_window {
    type = "ANYTIME"
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.ntlg-ha-pg1.id
    assign_public_ip = true
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.ntlg-ha-pg2.id
    assign_public_ip = true
  }

}

resource "yandex_vpc_network" "ntlg-ha-pg" {}

resource "yandex_vpc_subnet" "ntlg-ha-pg1" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.ntlg-ha-pg.id
  v4_cidr_blocks = ["10.1.0.0/24"]
}

resource "yandex_vpc_subnet" "ntlg-ha-pg2" {
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.ntlg-ha-pg.id
  v4_cidr_blocks = ["10.2.0.0/24"]
}

resource "yandex_mdb_postgresql_database" "ntlg-ha-pg" {
  cluster_id = yandex_mdb_postgresql_cluster.ntlg-ha-pg.id
  name       = "db1_terraform"
  owner      = yandex_mdb_postgresql_user.ntlg-ha-pg.name
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"
  extension {
    name = "uuid-ossp"
  }
  extension {
    name = "xml2"
  }
}

resource "yandex_mdb_postgresql_user" "ntlg-ha-pg" {
  cluster_id = yandex_mdb_postgresql_cluster.ntlg-ha-pg.id
  name       = "user1"
  password   = "ZaDBlove!"
}
