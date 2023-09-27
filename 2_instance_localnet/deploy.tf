resource "openstack_compute_keypair_v2" "keypair" {
  name = var.keypair_name
  public_key = "${file("../my_tf_keypair.pub")}"
}

resource "openstack_networking_network_v2" "network" {
  name = var.network_name
}

resource "openstack_networking_subnet_v2" "subnet" {
  name = var.subnet_name
  network_id = openstack_networking_network_v2.network.id
  cidr = "10.254.254.0/24"
  ip_version = 4
  dns_nameservers = ["1.1.1.1", "9.9.9.9"]
}

resource "openstack_compute_instance_v2" "instance" {
  name = var.instance_name
  flavor_name = var.instance_flavor

  block_device {
    uuid                  = data.openstack_images_image_v2.image.id
    source_type           = "image"
    volume_size           = var.boot_vol_capacity
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  key_pair = openstack_compute_keypair_v2.keypair.name

  network {
    uuid = openstack_networking_network_v2.network.id
  }
}
