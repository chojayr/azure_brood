### azure_brood

###### Another lame script to create or delet VM on Windows Azure

###### How to use?
###### Basically You need to install first the required gem
<pre>
* azure
* yaml
* json
</pre>

* You need to supply the account information on "azure_account.yaml"
```yaml
---
storage_account_name: ##the storage account name 
storage_access_key: ##storage access key 
management_certificate: ## *.pem location 
subscription_id: ##your account subscription id 
management_endpoint: 'https://management.core.windows.net'
```

* Supply the desired VM name on "hostname.yaml"
```yaml
---
host:
  - my_vm_name01
  - my_vm_name02
  - my_vm_name03
  - my_vm_name04
  - my_vm_name04
```

Once the gems that required are installed on your system and you provide all
the information needed on the yaml file.

* To deploy vm and supply the info on the guacamole
<pre>
$ ruby deploy_azurevm.rb

NOTE: This deploy script will spawn all the VM you supply on the
"hostname.yaml"
</pre>


* To list all the VM created
<pre>
$ ruby list_azurevm.rb
</pre>

* To list the available public images
<pre>
$ ruby image_azurevm.rb
</pre>

* To list locations
<pre>
$ ruby location_azurevm.rb
</pre>

* To Delete the VM's included on the hostname.yaml
<pre>
$ ruby destroy_azurevm.rb
</pre>


