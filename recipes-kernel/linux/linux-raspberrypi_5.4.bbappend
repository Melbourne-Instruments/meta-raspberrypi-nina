SUMMARY = "This is the Xenomai enabled kernel running in the NINA OS"
DESCRIPTION = "This recipe is taken from https://github.com/s-vincent/meta-raspberrypi-rt-sv.git"
HOMEPAGE = "https://github.com/agherzan/meta-raspberrypi"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_remove = "\
    file://0002-RT-DMA-patch-for-spi-and-i2s-drivers.patch \
    file://0005-Patch-for-rt-safe-spi_bcm2835.patch \
"

SRC_URI_append = "\
    file://1.patch \
    file://2.patch \
    file://3.patch \
    file://4.patch \
    file://git/arch/arm/boot/dts/overlays/melbinst-nina-overlay.dts \
    file://rpi-kernel-misc.cfg \
"

KERNEL_MODULE_AUTOLOAD += "i2c_dev"

do_configure_append () {
    ${S}/scripts/kconfig/merge_config.sh -m ${B}/.config ${WORKDIR}/*.cfg
}

do_prepare_kernel () {
    linux_src="${S}"
    xenomai_src="${WORKDIR}/xenomai-src"

    rm -rf ${xenomai_src}
    git clone https://source.denx.de/Xenomai/xenomai.git -b stable/v3.2.x ${xenomai_src}

    ${xenomai_src}/scripts/prepare-kernel.sh --arch=arm64 --linux=${linux_src} --default
}
