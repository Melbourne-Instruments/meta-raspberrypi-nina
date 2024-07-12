SUMMARY = "Recipe for RPI rtdm audio driver"
HOMEPAGE = "https://github.com/Melbourne-Instruments/rpi-rtdm-audio-driver"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=4a0f8ad6a793571b331b0e19e3dd925c"
PV = "1.0.0"

SRC_URI = "git://github.com/Melbourne-Instruments/rpi-rtdm-audio-driver.git"
SRCREV = "25b369ea8870c5114d77dcf237ad01c9ccb16bbc"

inherit module

S = "${WORKDIR}/git"
MODULE_INSTALL_DIR = "/lib/modules/${KERNEL_VERSION}"

do_compile_prepend () {
    export SIMULATE_NINA_HAT=0
}

do_install() {
    install -d ${D}${MODULE_INSTALL_DIR}
    install -m 0644 ${S}/*.ko ${D}${MODULE_INSTALL_DIR}
}

FILES_${PN} += "${MODULE_INSTALL_DIR}/*"

RPROVIDES_${PN} += "kernel-module-audio-rtdm-${KERNEL_VERSION}"
RPROVIDES_${PN} += "kernel-module-bcm2835-spi-nina-${KERNEL_VERSION}"
