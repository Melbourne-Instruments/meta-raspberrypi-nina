SUMMARY = "Realtek 802.11n WLAN Adapter Linux driver"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://Kconfig;md5=983a0e5b562df29edcd0fdf128c825ec"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

inherit module

SRC_URI = "git://github.com/morrownr/8821cu-20210916.git;branch=main;protocol=https \
           file://1.patch \
          "
SRC_URI[sha256sum] = "563085b08718f77b1c0408e26dacb7ecbe885948e0dfad8d0b62cfb43c1afc04"          
SRCREV = "69c903b75bde36293c66b25c051916a74dbadf58"
S = "${WORKDIR}/git"

MODULE_INSTALL_DIR = "/lib/modules/${KERNEL_VERSION}"

do_install() {
    install -d ${D}${MODULE_INSTALL_DIR}
    install -m 0644 ${S}/*.ko ${D}${MODULE_INSTALL_DIR}
}

FILES_${PN} += "${MODULE_INSTALL_DIR}/*"

RPROVIDES_${PN} += "kernel-module-8821cu-${KERNEL_VERSION}"