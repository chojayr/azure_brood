#!/usr/bin/env ruby
##
##

require "azure"
require "yaml"
require "pp"


Azure.configure do |config|
    ymlval = YAML.load(open('azure_account.yaml'))
    
    config.storage_account_name = ymlval["storage_account_name"]
    config.storage_access_key   = ymlval["storage_access_key"]
    
    config.management_certificate = ymlval["management_certificate"]
    config.subscription_id        = ymlval["subscription_id"]
    config.management_endpoint    = ymlval["management_endpoint"]
end


virtual_machine_service = Azure::VirtualMachineManagementService.new

vmlist = virtual_machine_service.list_virtual_machines

pp vmlist

