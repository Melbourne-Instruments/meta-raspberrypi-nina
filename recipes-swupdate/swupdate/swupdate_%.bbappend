FILESEXTRAPATHS_prepend := "${THISDIR}/swupdate:"

do_install_append () {
    rm -f ${D}${systemd_system_unitdir}/swupdate.service
}

SYSTEMD_SERVICE_${PN} = ""
SYSTEMD_SERVICE_${PN}-progress = ""
SYSTEMD_SERVICE_${PN}-usb = ""