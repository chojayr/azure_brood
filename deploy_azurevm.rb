#!/usr/bin/env ruby
##
##

require "azure"
require "yaml"
require "net/http"
require "uri"
require "json"


Azure.configure do |config|
    ymlval = YAML.load(open('azure.yaml'))
    #2 properties to use Storage
    config.storage_account_name = ymlval["storage_account_name"]
    config.storage_access_key   = ymlval["storage_access_key"]

    # 3 properties to use Service Management. 
    config.management_certificate = ymlval["management_certificate"]
    config.subscription_id        = ymlval["subscription_id"]
    config.management_endpoint    = ymlval["management_endpoint"]
end

yml = YAML.load(open('hostname.yaml'))
ymlhost = yml["host"]

ymlhost.each do |vm|

  virtual_machine_service = Azure::VirtualMachineManagementService.new
  
  #This is to create VM and to start deployment
  params = {
    :vm_name => "#{vm}",
    :vm_user => 'mapua',
    :image => 'a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-R2-201407.01-en.us-127GB.vhd',
    :password => 'mapuatest2014!',
    :location => 'Southeast Asia'
  }

  option = { 
    :cloud_service_name => "#{vm}",
    :deployment_name => "#{vm}",
    :tcp_endpoints => '80,8080,8443:443', #ports you need to open
    :certificate_file => '/home/llavina/.ssh/pem/llavina.pem',
    :vm_size => 'Basic_A1'
  }

  virtual_machine_service.create_virtual_machine(params,option)
  
end
