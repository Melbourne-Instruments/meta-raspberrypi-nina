RPIFW_DATE = "20220209"
SRCREV = "577aef2bc2f8e9dcd6955a85cf0621cc73b29db7"
SRC_URI[sha256sum] = "c0706054eaa1132c2e39dd5ec2070cb7d3e3f736024354e7fe456fcd6bfdde7f"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DEPENDS_append = " dtc-native"

SRC_URI_append = "\
    file://1.patch;patchdir=${RPIFW_S} \
"

do_deploy_append() {
    dtc -O dtb -o ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/dt-blob.bin ${RPIFW_S}/extra/dt-blob.dts
}