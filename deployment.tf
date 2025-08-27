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
        topology_spread_constraint {
          max_skew = 1
          topology_key = "kubernetes.io/hostname"
          when_unsatisfiable = "DoNotSchedule"
          label_selector {
            match_labels = {
              app = "simple-node-app"
            }
          }
        }
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