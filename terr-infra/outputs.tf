# Вывод ID созданного кластера
output "kubernetes_cluster_id" {
  description = "ID of the created Kubernetes cluster"
  value       = yandex_kubernetes_cluster.k8s_cluster.id
}

/*# Получение информации о нодах через data-источник
data "yandex_kubernetes_node_group" "node_group" {
  node_group_id = yandex_kubernetes_node_group.node_group.id
}*/

/*output "node_ips" {
  description = "IP addresses and other details of the Kubernetes nodes"
  value = [
    for node in data.yandex_kubernetes_node_group.node_group : {
      name        = node.cloud_status.id
      status      = node.status
      zone        = node.spec.zone_id # Если зона доступна в данных
      subnet_id   = node.spec.subnet_id # Если подсеть доступна в данных
      internal_ip = node.kubernetes_status.pod_network_ipv4_address # Или другое поле, содержащее внутренний IP
      external_ip = node.cloud_status.external_ipv4_address # Или другое поле, содержащее внешний IP
    }
  ]
}*/
/*# Получение информации о мастер-ноде через data-источник
data "yandex_kubernetes_cluster" "k8s_cluster" {
  cluster_id = yandex_kubernetes_cluster.k8s_cluster.id
}*/

/*output "master_details" {
  value = {
    external_endpoint = data.yandex_kubernetes_cluster.k8s_cluster.master[0].endpoints.external_v4_endpoint
    internal_endpoint = data.yandex_kubernetes_cluster.k8s_cluster.master[0].endpoints.internal_v4_endpoint
    locations         = [for loc in data.yandex_kubernetes_cluster.k8s_cluster.master : loc.locations]
  }
}*/
