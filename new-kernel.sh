#! /bin/bash
cd /usr/src/linux && \
    zcat /proc/config.gz > .config && \
    make olddefconfig && \
    make modules_prepare && \
    emerge @module-rebuild && \
    make -j13 && \
    make modules_install && \
    make install && \
    genkernel --install --no-ramdisk-modules --lvm initramfs && \
    grub-mkconfig -o /boot/grub/grub.cfg && \
    cp .config $HOME/Dropbox/config/kernel-config-$(basename $(pwd -P))

