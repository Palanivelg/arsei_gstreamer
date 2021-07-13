# arsei_gstreamer

AR SEI applications using the modified gstreamer library

**Installation steps:**

1. Install OpenVino 2021.2
2. Clone the Intel Media SDK source code from,
   https://github.com/Intel-Media-SDK/MediaSDK
3. Apply the patch MSDK.diff and build Media SDK using the depicted instructions.
4. Clone the gstreamer source code from,
   https://gitlab.freedesktop.org/gstreamer/gst-build.git
5. Apply the patch gst_plugins_bad.diff to the gst_plugins_bad and follow the instructions here,
   https://gstreamer.freedesktop.org/documentation/installing/building-from-source-using-meson.html?gi-language=c
6. Note: mediasdk needs to be enabled (-Dgst-plugins-bad:msdk=enabled) while configuring meson 
7. After building the source, install the built files to /usr
   Note: This can be achieved by setting -Dprefix=/usr in meson stage
8. Reboot the machine

Tested on Intel Gen-12 TGL NUC, Ubuntu 20.04

**Environment Setup for the terminal**

1. source arsei_set_vars.sh
2. source /opt/intel/openvino/bin/setupvars.sh
3. Execute the following commands to test,

***Sample Command lines***

**Playback Application**
./build_and_run.sh <Compressed file> <compression scheme>
./build_and_run.sh input/head-pose-face-detection-female-and-male_768x432_30p_300f.h264 h264
./build_and_run.sh input/head-pose-face-detection-female-and-male_768x432_30p_300f.h265 h265

**Detect on YUV & Encode as H.264 compressed files**
./build_and_run.sh <YUV file> <compression scheme>
./build_and_run.sh input/head-pose-face-detection-female-and-male_768x432_30p.yuv h264

**Classification & Encode (input:H.264 and output:H.265)**
./build_and_run.sh <Compressed file> <input compression> <output compression>
./build_and_run.sh input/msdk_encoded.h264 h264 h265
