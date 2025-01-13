# Overview
This Kuiper image includes a variety of tools used to support network
and throughput testing using a Raspberry PI as a host.

The image was created as a simple, but useful example to understand
and demonstrate the EXTRA_SCRIPT capabilities of Kuiper 2.0 to customize
a Kuiper image.

## Configuration
This configuration is for the Raspberry PI only, includes a desktop,
and excludes all of the IIO and other tools.

## Extra Configuration
The following items are included as part of the extra configuration:

 - XRDP - For remote desktop 
 - iperf
 - iperf3
 - Wireshark
     - User analog added to Wireshark group for non-sudo usage
 - VS Code
 