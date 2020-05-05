server {
    enabled = true
    bootstrap_expect = 1
	
	#Specifies the minimum time a job must be in the terminal state before it is eligible for garbage collection. This is specified using a label suffix like "30s" or "1h".
	job_gc_threshold = "999h"
}

client {
  enabled       = true
  gc_max_allocs = 1000
  max_kill_timeout = "120s"
  options {
    "driver.raw_exec.enable" = "1"
  }
}

telemetry {
  collection_interval = "1s"
  #disable_hostname = true
  prometheus_metrics = true
  publish_allocation_metrics = true
  publish_node_metrics = true
}