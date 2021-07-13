/*******************************************************************************
 * Copyright (C) 2018-2020 Intel Corporation
 *
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

#include <algorithm>
#include <dirent.h>
#include <gio/gio.h>
#include <gst/gst.h>
#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <stdlib.h>

#include "gst/videoanalytics/video_frame.h"

using namespace std;

gchar const *input_file = NULL;
gboolean no_display = FALSE;
gchar const *comp_scheme = NULL;

// This structure will be used to pass user data (such as memory type) to the
// callback function.
static GOptionEntry opt_entries[] = {
    {"input", 'i', 0, G_OPTION_ARG_STRING, &input_file, "Path to input video file", NULL},
    {"compression", 'c', 0, G_OPTION_ARG_STRING, &comp_scheme, "Compression scheme of input file", NULL},    
    {"no-display", 'n', 0, G_OPTION_ARG_NONE, &no_display, "Run without display", NULL},   
    GOptionEntry()};


// Sample recieves video with faces as an argument
// If video file is not passed as an argument obviously, an attempt will be made
// to use camera
int main(int argc, char *argv[]) {
    // Parse arguments
    GOptionContext *context = g_option_context_new("playback");
    g_option_context_add_main_entries(context, opt_entries, "playback");
    g_option_context_add_group(context, gst_init_get_option_group());
    GError *error = NULL;
    gboolean h264_compression_scheme = FALSE;
    if (!g_option_context_parse(context, &argc, &argv, &error)) {
        g_print("option parsing failed: %s\n", error->message);
        return 1;
    }
    
    // Construct the pipeline
    // If video file is not passed as an argument, an attempt will be made to use
    // camera
    gchar const *video_source = NULL;
    std::string input_str;
    if (input_file) {
        input_str = (input_file);
        if (input_str.find("/dev/video") != std::string::npos) {
            video_source = "v4l2src device";
        } else if (input_str.find("://") != std::string::npos) {
            video_source = "urisourcebin buffer-size=4096 uri";
        } else {
            video_source = "filesrc location";
        }
    } else {
        input_file = "/dev/video0";
        video_source = "v4l2src device";
    }
    
    // Compression scheme of the input file
    std::string compr_str;
    if (comp_scheme) {
    	compr_str = (comp_scheme);
      if (compr_str.find("h264") != std::string::npos) {
          h264_compression_scheme = TRUE;
      } else if (compr_str.find("h265") != std::string::npos) {
          h264_compression_scheme = FALSE;
      } else {
          h264_compression_scheme = TRUE;
      }
    } else {
          h264_compression_scheme = TRUE;
    }    	

    gchar const *preprocess_pipeline;
    
		if (h264_compression_scheme == FALSE) {
    	preprocess_pipeline = "h265parse ! msdkh265dec ! videoconvert n-threads=4 ! videoscale n-threads=4 ";
    }
		else {
    	preprocess_pipeline = "h264parse ! msdkh264dec ! videoconvert n-threads=4 ! videoscale n-threads=4 ";
		}
		
    gchar const *sink = no_display ? "identity signal-handoffs=false ! fakesink sync=false"
                                   : "fpsdisplaysink video-sink=autovideosink sync=false";

    // Build the pipeline
    auto launch_str = g_strdup_printf("%s=%s ! %s !"
                                      "gvawatermark name=gvawatermark ! videoconvert n-threads=4 ! %s",
                                      video_source, input_file, preprocess_pipeline, sink);

    g_print("PIPELINE: %s \n", launch_str);
    GstElement *pipeline = gst_parse_launch(launch_str, NULL);
    g_free(launch_str);

    // Start playing
    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    // Wait until error or EOS
    GstBus *bus = gst_element_get_bus(pipeline);

    int ret_code = 0;
    GstMessage *msg = gst_bus_poll(bus, (GstMessageType)(GST_MESSAGE_ERROR | GST_MESSAGE_EOS), -1);

    if (msg && GST_MESSAGE_TYPE(msg) == GST_MESSAGE_ERROR) {
        GError *err = NULL;
        gchar *dbg_info = NULL;

        gst_message_parse_error(msg, &err, &dbg_info);
        g_printerr("ERROR from element %s: %s\n", GST_OBJECT_NAME(msg->src), err->message);
        g_printerr("Debugging info: %s\n", (dbg_info) ? dbg_info : "none");

        g_error_free(err);
        g_free(dbg_info);
        ret_code = -1;
    }

    if (msg)
        gst_message_unref(msg);

    // Free resources
    gst_object_unref(bus);
    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);

    return ret_code;
}
