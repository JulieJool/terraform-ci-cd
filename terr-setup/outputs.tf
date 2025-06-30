# Вывод информации о созданном сервисном аккаунте
output "service_account_key_id" {
  description = "ID"
  value       = yandex_iam_service_account.terr-sa.id
}

output "service_account_name" {
  description = "Name of the created service account"
  value       = yandex_iam_service_account.terr-sa.name
}

# Вывод информации о созданном бакете
output "bucket_name" {
  description = "Name of the created S3 bucket for Terraform state storage"
  value       = yandex_storage_bucket.terraform-state-bucket.bucket
}

output "bucket_acl" {
  description = "Access Control List (ACL) of the created S3 bucket"
  value       = yandex_storage_bucket.terraform-state-bucket.acl
}

# Выходные переменные для передачи ключа
output "access_key" {
  value     = yandex_iam_service_account_static_access_key.terr-sa-static-key.access_key
  sensitive = true
}

output "secret_key" {
  value     = yandex_iam_service_account_static_access_key.terr-sa-static-key.secret_key
  sensitive = true
}
