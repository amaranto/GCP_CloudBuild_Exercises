variable project_id {
  type = string
}

variable gcr {
    type = object({
        location = string
    })

    default = {
            location = "US"
    }
}

variable project_users {
    type = list
    default = []
}