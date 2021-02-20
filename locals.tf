# root/kubernetes/locals.tf

locals {

  deployment = {
    nodered = {
      image       = "nodered/node-red:latest"
      int         = 1800
      ext         = 1800
      volumepath = "/data"

    }


    influxdb = {
      image       = "influxdb"
      int         = 8086
      ext         = 8086
      volumepath = "/var/lib/influxdb"

    }

    grafana = {
      image       = "grafana/grafana"
      int         = 3000
      ext         = 3000
      volumepath = "/var/lib/grafana"
    }
  }
}
