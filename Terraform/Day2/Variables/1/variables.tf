variable "lists"{
    default = ["abc", "xyz"]
    type = list(string)
}

variable "maps"{
    default = {
        "a" :1, "b":2
    }
    type = map(number)
}

variable "sets"{
    default = ["abc", "xyz"]
    type = set(string)
}

variable "info"{
    type = object({
        name = string
        age  = number
        fav_food = list(string)
        isactive = bool

    })
    default = {
      age = 11
      fav_food = [ "pizza" ]
      isactive = false
      name = "abc"
    }
}

variable "moti"{
    type = tuple([string, number])
    default = [
    "dog", 2]
    description = "first value is category and second is age"
}