# Draw Face Attributes C++ Sample

This sample demonstrates the extraction of the analytics meta data from the video stream, perform classification on the meta data and re-encodes the stream with enhanced meta data in the form of ARSEI message.

## How It Works
The sample utilizes GStreamer function `gst_parse_launch` to construct the pipeline from string representation. Then callback function is set on source pin of `msdkh264enc\msdkh265enc` element in the pipeline.

The callback is invoked on every frame, it loops through inference metadata attached to the frame, performs classification (age & gender) and adds labels and to the  inference meta data. 

## Models

The sample uses by default the following pre-trained models from OpenVINO™ Toolkit [Open Model Zoo](https://github.com/openvinotoolkit/open_model_zoo)
*   __age-gender-recognition-retail-0013__ age and gender estimation on detected faces

> **NOTE1**: Before running samples (including this one), run script `download_models.sh` once (the script located in `samples` top folder) to download all models required for this and other samples.
> **NOTE 2**: The gstreamer library needs to be re-built with the patch in the repository.

## Running

```sh
./build_and_run.sh [INPUT_VIDEO] input_compression_scheme(h264/h265) output_compression_scheme(h264/h265)
```

The script `build_and_run.sh` compiles the C++ sample into subfolder under `$PWD/build`, then runs the executable file.

If no input parameters specified, the sample by default streams video example from HTTPS link (utilizing `urisourcebin` element) so requires internet conection.
The command-line parameter INPUT_VIDEO allows to change input video and supports
* local video file
* web camera device (ex. `/dev/video0`)
* RTSP camera (URL starting with `rtsp://`) or other streaming source (ex URL starting with `http://`)

## Sample Output

The sample
* prints GSreamer pipeline string as passed to function `gst_parse_launch`
* starts the pipeline and creates a compressed h.264/h.265 bitstream with analytics data in the form of ARSEI

