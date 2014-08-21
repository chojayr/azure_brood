#!/usr/bin/env ruby
##
##

require "azure"
require "pp"
require "yaml"
require "net/http"
require "uri"
require "json"


Azure.configure do |config|
  ymlval = YAML.load(open('azure_account.yaml'))

  config.storage_account_name = ymlval["storage_account_name"]
  config.storage_access_key   = ymlval["storage_access_key"]

  config.management_certificate = ymlval["management_certificate"]
  config.subscription_id        = ymlval["subscription_id"]
  config.management_endpoint    = ymlval["management_endpoint"]
end

yml = YAML.load(open('hostname.yaml'))
ymlhost = yml["host"]

ymlhost.each do |vm|
  virtual_machine_service = Azure::VirtualMachineManagementService.new

  virtual_machine_service.delete_virtual_machine("#{vm}")
end

