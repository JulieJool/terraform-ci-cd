/*# Создание бакета для хранения стейт-файла
resource "yandex_storage_bucket" "terraform-state-bucket" {
  bucket     = "terraform-state-bucket-of-julia-teplov"
  access_key = yandex_iam_service_account_static_access_key.terr-sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.terr-sa-static-key.secret_key
  acl    = "private"
  force_destroy = true
  depends_on = [yandex_resourcemanager_folder_iam_member.editor-sa]
}*/
