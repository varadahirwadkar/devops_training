locals {
  minions = ["bob", "kevin", "stewart"]
}
resource "null_resource" "minions" {
  for_each = toset(local.minions)
  triggers = {
    name = each.value
  }
}
output "minions" {
  value = null_resource.minions
}

locals {
  heights = {
    bob     = "short"
    kevin   = "tall"
    stewart = "medium"
  }
}
resource "null_resource" "heights" {
  for_each = local.heights
  triggers = {
    name   = each.key
    height = each.value
  }
}
output "heights" {
  value = null_resource.heights
}

/*
Outputs:

heights = {
  "bob" = {
    "id" = "1889748357956358575"
    "triggers" = tomap({
      "height" = "short"
      "name" = "bob"
    })
  }
  "kevin" = {
    "id" = "7534034073350216780"
    "triggers" = tomap({
      "height" = "tall"
      "name" = "kevin"
    })
  }
  "stewart" = {
    "id" = "6020148863221453955"
    "triggers" = tomap({
      "height" = "medium"
      "name" = "stewart"
    })
  }
}
minions = {
  "bob" = {
    "id" = "1769264584204373470"
    "triggers" = tomap({
      "name" = "bob"
    })
  }
  "kevin" = {
    "id" = "2232708761189509519"
    "triggers" = tomap({
      "name" = "kevin"
    })
  }
  "stewart" = {
    "id" = "465760403317474504"
    "triggers" = tomap({
      "name" = "stewart"
    })
  }
}
*/