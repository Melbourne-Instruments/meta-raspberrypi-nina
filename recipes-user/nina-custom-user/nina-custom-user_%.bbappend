DESCRIPTION = "Adds nina also to kmem group, required for user space access to shared memory"

#override base recipe's USERADD_PARAM_${PN}
USERADD_PARAM_${PN} = "-g xenomai -G audio,kmem,sudo -p '${NINA_PASSWD}' -m -d ${HOME_DIR} -s /bin/bash nina"