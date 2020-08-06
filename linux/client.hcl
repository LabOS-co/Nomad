client {
  enabled       = true
  gc_max_allocs = 1000
  max_kill_timeout = "120s"
  options {
    "driver.raw_exec.enable" = "1"
    "docker.volumes.enabled" = "1"
  }
}

telemetry {
  collection_interval = "1s"
  #disable_hostname = true
  prometheus_metrics = true
  publish_allocation_metrics = true
  publish_node_metrics = true
}