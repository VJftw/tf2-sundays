terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "vjpatelme-terraform-state"
    key            = "tf2-sundays.tfstate"
    dynamodb_table = "vjpatelme-terraform-state-lock"
    encrypt        = true
  }
}

provider "scaleway" {
  zone   = "fr-par-1"
  region = "fr-par"
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "hlds" {
  type  = "DEV1-S"
  image = "ubuntu_bionic"

  name = "tf2-sundays"

  security_group_id = scaleway_instance_security_group.hlds.id

  ip_id = scaleway_instance_ip.public_ip.id
}

resource "scaleway_instance_security_group" "hlds" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action   = "accept"
    port     = "22"
    ip_range = "0.0.0.0/0"
  }

  # HLDS
  inbound_rule {
    action   = "accept"
    port     = "27015"
    ip_range = "0.0.0.0/0"
    protocol = "ANY"
  }

  # HLTV
  inbound_rule {
    action   = "accept"
    port     = "27020"
    ip_range = "0.0.0.0/0"
  }

}