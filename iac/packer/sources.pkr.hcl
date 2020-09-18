source "virtualbox-iso" "iac_automation" {
  guest_os_type = "Ubuntu_64"
  iso_url = "http://releases.ubuntu.com/12.04/ubuntu-12.04.5-server-amd64.iso"
  iso_checksum = "md5:769474248a3897f4865817446f9a4a53"
  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  disk_size = 20
  ssh_port          = 22
  ssh_wait_timeout  = "15m"
  shutdown_command = "echo 'ubuntu' | sudo -S shutdown -P now"
vboxmanage = [
   ["modifyvm", "{{.Name}}", "--memory", "1024"],
   ["modifyvm", "{{.Name}}", "--cpus", "2"],
]
boot_command = [
  "<esc><esc><enter><wait>",
  "/install/vmlinuz noapic ",
  "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
  "debian-installer=en_US auto locale=en_US kbd-chooser/method=us ",
  "hostname={{ .Name }} ",
  "fb=false debconf/frontend=noninteractive ",
  "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA ",
  "keyboard-configuration/variant=USA console-setup/ask_detect=false ",
  "initrd=/install/initrd.gz -- <enter>"
]
}

build {
  sources = ["sources.virtualbox-iso.iac_automation"]
}
