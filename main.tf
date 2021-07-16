
module testvpc {
  source = "./modules/vnet"
   rg_name = "revanth"
   rg_location = "eastus"
   vnet_name = "projectvnet"
   vnet_location = "eastus"
   vnet_address_space = ["10.1.0.0/16"]
   subnet_names =["Application_Gateway_subnet", "management_subnet", "sqlsubnet"]
   subnet_prefixes =[["10.1.1.0/24"], ["10.1.2.0/24"], ["10.1.5.0/24"]] 
   pub_subnet_names ="websubnet"
   pub_subnet_prefixes =["10.1.3.0/24"]
   private_subnet_names = "appsubnet"
   private_subnet_prefixes =["10.1.4.0/24"]
   public_ip_names = ["pip_1", "pip_2"]
   pip_location = "eastus"  
   nsg_name = "nsg1"
   nsg_location = "eastus" 
   nsg2_name = "nsg2"
   nsg2_location = "eastus"
   netwrkif_names = ["ntif1", "ntif2"]
   netwrkif_loc ="eastus"
   ip_config_netwrkif_names = ["ipconfig1", "ipconfig2"]
   private_netwrkif_names = ["printif1", "printif2"]
   private_netwrkif_loc = "eastus"
   ip_config_private_netwrkif_names = ["priipconfig1", "priipconfig2"]
}

module testvm {
  source = "./modules/vm"
  rg_name = "${module.testvpc.resource_group_name}"
  ntif_id = "${module.testvpc.network_interface_ids}"
  avzone =["1", "2"]
  vm_names =["webvm1", "webvm2"]
  vm_location = "eastus"
  privatentif_id = "${module.testvpc.network_interface_private_ids}"
  vmapp_names =["appvm1", "appvm2"] 
}
