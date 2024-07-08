FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = "\
    file://create-usb-gadgets.service \
    file://create-usb-gadgets.sh \
"

do_install_append () {
    install -m 0644 ${WORKDIR}/create-usb-gadgets.service ${D}${systemd_system_unitdir}/
    install -m 0755 ${WORKDIR}/create-usb-gadgets.sh ${D}${bindir}
}

SYSTEMD_SERVICE_${PN} += " \
    create-usb-gadgets.service \
"
