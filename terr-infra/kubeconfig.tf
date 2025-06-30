data "yandex_kubernetes_cluster" "k8s_cluster" {
  cluster_id = yandex_kubernetes_cluster.k8s_cluster.id
}

output "kubeconfig" {
  description = "Kubeconfig for the Kubernetes cluster"
  value       = data.yandex_kubernetes_cluster.k8s_cluster.kubeconfig
}
