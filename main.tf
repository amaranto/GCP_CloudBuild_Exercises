module "ej1" {
  source = "./ej1/"
  project_id = "earevalo-89"
  vm_name = "vm1"
  vm_is_public = true
  vm_ssh_users = [
    {
      "username" = "eze_m_arevalo"
    }
]

vm_users = [
  {
    "email" = "eze.m.arevalo@gmail.com"
  },
  {
    "email" = "Fabio.rincon@arroyoconsulting.net"
  },
  
  {
    "email" = "andres.zapata@arroyoconsulting.net"
  },
  {
    "email" = "carlos.albarran@arroyoconsulting.net"
  },
]

project_editor_users = [
  {
    "email" = "carlos.albarran.ddl@gmail.com"
  }
]

}

module "ej2" {
  source = "./ej2/"
  project_id = "earevalo-89"
  project_users = [ "Fabio.rincon@arroyoconsulting.net",  "andres.zapata@arroyoconsulting.net", "carlos.albarran@arroyoconsulting.net"]



}
