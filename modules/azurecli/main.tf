# data "external" "test" {
#    program = ["az", "account", "show","--output", "none"]
  #  program = ["az", "account", "set", "--subscription", "05023169-6eea-4c86-98a0-344e01053193", "--output", "tsv"]

  # program = ["bash", "-c", "az resource show --ids ${local.app_service_environment_id}/capacities/virtualip --query '{internalIpAddress: internalIpAddress}' | jq -c"]
 # program = ["bash", "-c", "az account set --subscription 05023169-6eea-4c86-98a0-344e01053193 | jq -c"]

# }

# output "value" {
#   value = "${data.external.test.result}"
# }

# # TF-UPGRADE-TODO: Block type was not recognized, so this block and its contents were not automatically upgraded.
# provisioner "local-exec" {
#   command = "az account set --05023169-6eea-4c86-98a0-344e01053193"
# }


resource "null_resource" "azure-cli" {
  
  provisioner "local-exec" {
    # Call Azure CLI Script here
    #command = "az group create -l westus -n rgjaimetes"
    #command = "az account set --subscription 05023169-6eea-4c86-98a0-344e01053193"
    command = "az account show"
  }
}
