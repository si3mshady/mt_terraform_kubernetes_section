# root/kubernetes/main.tf

resource "kubernetes_deployment" "threeapps" {
  for_each = local.deployment
  metadata {
    name = "${each.key}-deployment"
    labels = {
      app =  "threeapps"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "threeapps"
      }
    }

    template {
      metadata {
        labels = {
          app = "threeapps"
        }
      }

      spec {
        container {
          image = each.value.image
          name  =  "${each.key}-container"
          volume_mount {
              name = "${each.key}-vol"
              mount_path = each.value.volumepath
          }
         
          port {
            container_port = each.value.int
            host_port      = each.value.ext
          }
        }
        volume {
          name = "${each.key}-vol"
          empty_dir {
            medium = ""
          }
        }
      }
    }
  }
}
