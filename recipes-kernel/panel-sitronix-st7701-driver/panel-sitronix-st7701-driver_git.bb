SUMMARY = "Recipe for Sitronix St7701 panel driver"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=4a0f8ad6a793571b331b0e19e3dd925c"
PV = "1.0.0"

SRC_URI = "git://github.com/Melbourne-Instruments/panel-sitronix-st7701-driver.git"
SRCREV = "8aa2c3bd4167e4a2d137b48cc15f801ef912d21f"

inherit module

S = "${WORKDIR}/git"

MODULE_INSTALL_DIR = "/lib/modules/${KERNEL_VERSION}"

do_install() {
    # Install the kernel module to standard location on rootfs
    install -d ${D}${MODULE_INSTALL_DIR}
    install -m 0644 ${S}/*.ko ${D}${MODULE_INSTALL_DIR}
}

FILES_${PN} += "${MODULE_INSTALL_DIR}/*"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.
RPROVIDES_${PN} = "kernel-module-panel-sitronix-st7701-${KERNEL_VERSION}"
