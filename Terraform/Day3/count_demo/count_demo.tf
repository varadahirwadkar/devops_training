
variable "dummy" {
  type    = list(string)
  default = ["one", "two", "three"]
}

output "show" {
  value = var.dummy.*
}

/*
Outputs:

show = tolist([
  "one",
  "two",
  "three",
])
*/


resource "null_resource" "simple" {
  count = 2
}
output "simple" {
  value = null_resource.simple
}
/*
OP:
simple = [
  {
    "id" = "7718493230270750329"
    "triggers" = tomap(null) 
  },
  {
    "id" = "6336366914116081210"
    "triggers" = tomap(null) 
  },
]
*/
locals {
  names = ["bob", "kevin", "stewart"]
}
resource "null_resource" "names" {
  count = length(local.names)
  triggers = {
    name = local.names[count.index]
  }
}
output "names" {
  value = null_resource.names
}

/*
Outputs:

names = [
  {
    "id" = "1519409339572682814"
    "triggers" = tomap({
      "name" = "bob"
    })
  },
  {
    "id" = "116902255571025365"
    "triggers" = tomap({
      "name" = "kevin"
    })
  },
  {
    "id" = "6881538432043715246"
    "triggers" = tomap({
      "name" = "stewart"
    })
  },
]
*/

