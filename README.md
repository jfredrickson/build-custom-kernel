# build-custom-kernel

A script to build a Fedora kernel with an AMD AGESA patch to work around an issue that prevents GPU passthrough from working. It could also be extended to include arbitrary kernel patches.

## AGESA Issue

* [Patch source](https://clbin.com/VCiYJ) (created by [/u/hansmoman](https://www.reddit.com/r/VFIO/comments/bqeixd/apparently_the_latest_bios_on_asrockmsi_boards/eo4neta/))
* [Problem introduced in AGESA 0.0.7.2](https://www.reddit.com/r/Amd/comments/bh3qqz/agesa_0072_pci_quirk/)
* [Problem still exists in AGESA 1.0.0.1](https://www.reddit.com/r/VFIO/comments/bvqxnt/psa_amd_agesa_1001_does_not_fix_the_pci/)
* [Alternative patching method](https://passthroughpo.st/agesa_fix_fedora/)
