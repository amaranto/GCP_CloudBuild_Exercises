module "ej1" {
  source = "./ej1/"
  project_id = "earevalo-89"
  vm_name = "vm1"
  vm_is_public = true
  vm_ssh_users = [
    {
      "username" = "eze_m_arevalo"
    },
    {
      "username" = "fabio_rincon",
      "pubkey" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrTNv7QaldSoVyKoR2dwOAXoFMd6nE8/M/ERfeyTvlPIRVc/iT7qtGTOxRwHh130fLyVvjG2qvNvBVNFfPr/R9Dm+575TktbsGpXAPa94XcdC03dbgAKS1H2MvzIdDL6jUxCEyeTAUVKCK32lsqYwCV43MV45KMHi0b+9H1odyeEBcrDuyOpUPCn/zmMbU2ofQALiUTBpDPVAR8psIMM6Zf6Hgj2NzeuI12LiFNEfFnrtEZtAkUWGcqfO1lHLoQuGlF0aQKVaAF9NiB/Av0x4Ti8vrUL6GxlViLpTMFNam2eElih1sRCkII7FUh2dThotVk6tVwUGT9OxLF+ZpVF+H Fabio.rincon@arroyoconsulting.net"
    },
    
    {
      "username" = "andres_zapata",
      "pubkey" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRhqeF8tls0DZUlhaC3Dsb4I9T/txGRYBHjXytp8gJXnGW+pwNYAOSvLB4wcyJhmXv43owo9aQ3TE5vrm2GO/bDNvx/VFSviA2/naRlwHV5yQiBZyV8AGE12eQZoo7lrXgX50QmCOG6Quko5UTW4d3qccGXYdzzTJfrR39xoCgS/wsDCM0TAhxb+JTbOoMOuSIU+fwhNjLA2/Si2irDK1K4lATkDGbenua+uSjBx9hIT8fA9PkoibhPUZm8MBDSkeRxBAMzqOqBjRw5y26JQpSC3jMUXIkyNupCZlR3ICJa+vvFo7I45hpC78BDyImu6/2KSZ22lRO+VKKFGrvRCYX andres.zapata@arroyoconsulting.net"
    },
    {
      "username" = "carlos_albarran",
      "pubkey" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO/hK9ByYmdMPkT/yCL2IAlVFRSEUfxlypj29tfvn+1uERybazhNQmwC4+3RZcsweVhUTl0Tx+J4aJ0yYn3WW6izcuzRyexaMBixmXCcGo5JxcdF3JmWo52d0t3UShksKL4u0BNjxFwwumAqBInGftBU1afot063pIrt75SwIXJuVqKAJxC+uXCVAziSMlDv+zdPOuLJuvuPpEF2FPI1LMqb1aluEABxoHIE9ITxkd/jbbsikw6a0g9sHIt7VXP3opVp/ym+Z/yP/8kzB1nL7RZ5BdoA0NX1zDwoQyqX5uX9mdJnUqF1EeNt7Z0EL78Z99v14YCCjY1EsydpREZUHL carlos.albarran@arroyoconsulting.net"
    }    
]

vm_users = [
  {
    "email" = "eze.m.arevalo@gmail.com"
  }
]

project_editor_users = []

}

module "ej2" {
  source = "./ej2/"
  project_id = "earevalo-89"
  project_users = []

}
