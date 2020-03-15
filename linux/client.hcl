client {
  enabled       = true
  gc_max_allocs = 1000
  max_kill_timeout = "120s"
  options {
    "driver.raw_exec.enable" = "1"
  }
}