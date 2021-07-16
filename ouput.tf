output network_interface_ids {
  value       = ["${module.testvpc.network_interface_private_ids}"]
}
