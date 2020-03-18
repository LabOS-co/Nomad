data_dir = "/opt/consul"
retry_join = ["REPLACE_ME_WITH_IP"]
ui = true
bind_addr = "{{ GetPrivateIP }}"

performance {
  raft_multiplier = 1
}