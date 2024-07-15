# Copyright 2024 dah4k
# SPDX-License-Identifier: EPL-2.0

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
    config.vm.hostname = "siftworkstation"

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.linked_clone = true
        vb.memory = 8192
        vb.cpus = 4
    end

    # Disable default sharing current directory
    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provision "shell", privileged: false, inline: "touch $HOME/.hushlogin"
    config.vm.provision "shell", privileged: false, path: "files/apt_upgrade.sh"
    config.vm.provision "shell", privileged: false, path: "files/install_dissect.sh"
end
