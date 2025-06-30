terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"

  /*backend "s3" {
    bucket   = "terraform-state-bucket-of-julia-teplov"
    key      = "terraform.tfstate"
    region   = "ru-central1"
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }*/

}

/*provider "yandex" {
  # token     = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = var.service_account_key_json
}*/

data "terraform_remote_state" "setup" {
  backend = "remote"

  config = {
    organization = "JulieJool"
    workspaces = {
      name = "terr-setup"
    }
  }
}

provider "yandex" {
  service_account_key_file =({
    service_account_id   = data.terraform_remote_state.setup.outputs.service_account_id
    private_key          =  jsonencode(data.terraform_remote_state.setup.outputs.secret_key)
  })
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
}
