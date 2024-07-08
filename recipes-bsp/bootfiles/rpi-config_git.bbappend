FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

VC4DTBO = "vc4-kms-v3d-pi4"

do_deploy_append() {
     echo "dtparam=i2c_vc=off" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "force_turbo=1" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "gpu_freq=500" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "disable_splash=1" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "ignore_lcd=1" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "dtparam=i2s=off" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "dtoverlay=disable-bt" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "dtoverlay=dwc2" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
     echo "dtoverlay=melbinst-nina" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
}
