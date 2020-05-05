data_dir = "/opt/consul"
server = true
bootstrap_expect = 1
ui = true
bind_addr = "{{ GetPrivateIP }}"

performance {
  raft_multiplier = 1
}