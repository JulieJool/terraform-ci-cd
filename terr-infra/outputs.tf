# Получение информации о нодах через data-источник
data "yandex_kubernetes_node_group" "node_group" {
  node_group_id = yandex_kubernetes_node_group.node_group.id
}

output "node_ips" {
  description = "IP addresses and other details of the Kubernetes nodes"
  value = [
    for instance in data.yandex_kubernetes_node_group.node_group.instances : {
      name        = instance.name
      status      = instance.status
      zone        = instance.zone_id
      subnet_id   = instance.subnet_id
      internal_ip = instance.internal_ip
      external_ip = instance.external_ip
    }
  ]
}

/*# Получение информации о мастер-ноде через data-источник
data "yandex_kubernetes_cluster" "k8s_cluster" {
  cluster_id = yandex_kubernetes_cluster.k8s_cluster.id
}*/

output "master_details" {
  value = {
    external_endpoint = data.yandex_kubernetes_cluster.k8s_cluster.master[0].endpoints.external_v4_endpoint
    internal_endpoint = data.yandex_kubernetes_cluster.k8s_cluster.master[0].endpoints.internal_v4_endpoint
    locations         = [for loc in data.yandex_kubernetes_cluster.k8s_cluster.master : loc.locations]
  }
}
