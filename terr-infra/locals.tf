locals {
  service_account_id = jsondecode(var.service_account_key_json).service_account_id
}

# Локальная переменная для списка subnet_ids
locals {
  subnet_ids = join(",", [for subnet in yandex_vpc_subnet.subnet : subnet.id])
}
