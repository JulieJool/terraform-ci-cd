/*data "yandex_kubernetes_cluster" "k8s_cluster" {
  cluster_id = yandex_kubernetes_cluster.k8s_cluster.id
}

output "kubeconfig" {
  description = "Kubeconfig for the Kubernetes cluster"
  value = data.yandex_kubernetes_cluster.k8s_cluster.kubernetes_config
}*/


resource "null_resource" "get_kubeconfig" {
  triggers = {
    cluster_id = yandex_kubernetes_cluster.k8s_cluster.id
  }

  provisioner "local-exec" {
    command = <<EOT
      yc managed-kubernetes cluster get-credentials ${self.triggers.cluster_id} --external --force
    EOT
  }

  depends_on = [yandex_kubernetes_node_group.node_group]
}
