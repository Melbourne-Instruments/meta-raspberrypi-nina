# meta-raspberrypi-nina

This is an added layer on top of the [meta-raspberrypi](https://github.com/agherzan/meta-raspberrypi) layer maintained by Andrei Gherzan.

# Dependencies

All the necessary layers needed by `meta-raspberrypi` are also required by this layer.
Additionally, this layer also depends on [meta-nina](https://github.com/Melbourne-Instruments/meta-nina) and [meta-swupdate-nina](https://github.com/Melbourne-Instruments/meta-swupdate-nina) for the NINA swupdate feature.

Any new recipe that is common for products built with NINA Pi as a platform should be in this layer.

Customizations done through bbappend recipes for meta-raspberrypi or OE recipes which are
common to products built with NINA Pi as a platform shall also be in this layer.

# Main components

The key contributions of this layer to NINA OS image are:

  * Custom Linux kernel with I-Pipe and Xenomai enabled.
  * U-boot configuration and boot scripts for NINA Pi.
  * Elk System configurations.
  * SWUpdate configuration for NINA Pi.
  * Other system-related modifications.

---
Copyright 2021-2023 Melbourne Instruments, Australia.
