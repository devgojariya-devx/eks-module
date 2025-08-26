resource "kubernetes_deployment" "simple_node_app"{
  metadata {
    name = "simple-node-app"
    namespace = kubernetes_namespace.example.metadata[0].name
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "simple-node-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "simple-node-app"
        }
      }
      spec {
        container {
          image = ""
          name = "simple-node-app"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}