/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     opencensus/proto/trace/v1/trace_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include "upb/def.h"
#include "opencensus/proto/trace/v1/trace_config.upbdefs.h"
#include "opencensus/proto/trace/v1/trace_config.upb.h"

static const char descriptor[1065] = {'\n', ',', 'o', 'p', 'e', 'n', 'c', 'e', 'n', 's', 'u', 's', '/', 'p', 'r', 'o', 't', 'o', '/', 't', 'r', 'a', 'c', 'e', '/', 
'v', '1', '/', 't', 'r', 'a', 'c', 'e', '_', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'p', 'r', 'o', 't', 'o', '\022', '\031', 'o', 'p', 
'e', 'n', 'c', 'e', 'n', 's', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '.', 't', 'r', 'a', 'c', 'e', '.', 'v', '1', '\"', '\234', 
'\004', '\n', '\013', 'T', 'r', 'a', 'c', 'e', 'C', 'o', 'n', 'f', 'i', 'g', '\022', '`', '\n', '\023', 'p', 'r', 'o', 'b', 'a', 'b', 'i', 
'l', 'i', 't', 'y', '_', 's', 'a', 'm', 'p', 'l', 'e', 'r', '\030', '\001', ' ', '\001', '(', '\013', '2', '-', '.', 'o', 'p', 'e', 'n', 
'c', 'e', 'n', 's', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '.', 't', 'r', 'a', 'c', 'e', '.', 'v', '1', '.', 'P', 'r', 'o', 
'b', 'a', 'b', 'i', 'l', 'i', 't', 'y', 'S', 'a', 'm', 'p', 'l', 'e', 'r', 'H', '\000', 'R', '\022', 'p', 'r', 'o', 'b', 'a', 'b', 
'i', 'l', 'i', 't', 'y', 'S', 'a', 'm', 'p', 'l', 'e', 'r', '\022', 'W', '\n', '\020', 'c', 'o', 'n', 's', 't', 'a', 'n', 't', '_', 
's', 'a', 'm', 'p', 'l', 'e', 'r', '\030', '\002', ' ', '\001', '(', '\013', '2', '*', '.', 'o', 'p', 'e', 'n', 'c', 'e', 'n', 's', 'u', 
's', '.', 'p', 'r', 'o', 't', 'o', '.', 't', 'r', 'a', 'c', 'e', '.', 'v', '1', '.', 'C', 'o', 'n', 's', 't', 'a', 'n', 't', 
'S', 'a', 'm', 'p', 'l', 'e', 'r', 'H', '\000', 'R', '\017', 'c', 'o', 'n', 's', 't', 'a', 'n', 't', 'S', 'a', 'm', 'p', 'l', 'e', 
'r', '\022', 'd', '\n', '\025', 'r', 'a', 't', 'e', '_', 'l', 'i', 'm', 'i', 't', 'i', 'n', 'g', '_', 's', 'a', 'm', 'p', 'l', 'e', 
'r', '\030', '\003', ' ', '\001', '(', '\013', '2', '.', '.', 'o', 'p', 'e', 'n', 'c', 'e', 'n', 's', 'u', 's', '.', 'p', 'r', 'o', 't', 
'o', '.', 't', 'r', 'a', 'c', 'e', '.', 'v', '1', '.', 'R', 'a', 't', 'e', 'L', 'i', 'm', 'i', 't', 'i', 'n', 'g', 'S', 'a', 
'm', 'p', 'l', 'e', 'r', 'H', '\000', 'R', '\023', 'r', 'a', 't', 'e', 'L', 'i', 'm', 'i', 't', 'i', 'n', 'g', 'S', 'a', 'm', 'p', 
'l', 'e', 'r', '\022', '7', '\n', '\030', 'm', 'a', 'x', '_', 'n', 'u', 'm', 'b', 'e', 'r', '_', 'o', 'f', '_', 'a', 't', 't', 'r', 
'i', 'b', 'u', 't', 'e', 's', '\030', '\004', ' ', '\001', '(', '\003', 'R', '\025', 'm', 'a', 'x', 'N', 'u', 'm', 'b', 'e', 'r', 'O', 'f', 
'A', 't', 't', 'r', 'i', 'b', 'u', 't', 'e', 's', '\022', '9', '\n', '\031', 'm', 'a', 'x', '_', 'n', 'u', 'm', 'b', 'e', 'r', '_', 
'o', 'f', '_', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '\030', '\005', ' ', '\001', '(', '\003', 'R', '\026', 'm', 'a', 'x', 
'N', 'u', 'm', 'b', 'e', 'r', 'O', 'f', 'A', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '\022', '>', '\n', '\034', 'm', 'a', 
'x', '_', 'n', 'u', 'm', 'b', 'e', 'r', '_', 'o', 'f', '_', 'm', 'e', 's', 's', 'a', 'g', 'e', '_', 'e', 'v', 'e', 'n', 't', 
's', '\030', '\006', ' ', '\001', '(', '\003', 'R', '\030', 'm', 'a', 'x', 'N', 'u', 'm', 'b', 'e', 'r', 'O', 'f', 'M', 'e', 's', 's', 'a', 
'g', 'e', 'E', 'v', 'e', 'n', 't', 's', '\022', '-', '\n', '\023', 'm', 'a', 'x', '_', 'n', 'u', 'm', 'b', 'e', 'r', '_', 'o', 'f', 
'_', 'l', 'i', 'n', 'k', 's', '\030', '\007', ' ', '\001', '(', '\003', 'R', '\020', 'm', 'a', 'x', 'N', 'u', 'm', 'b', 'e', 'r', 'O', 'f', 
'L', 'i', 'n', 'k', 's', 'B', '\t', '\n', '\007', 's', 'a', 'm', 'p', 'l', 'e', 'r', '\"', 'F', '\n', '\022', 'P', 'r', 'o', 'b', 'a', 
'b', 'i', 'l', 'i', 't', 'y', 'S', 'a', 'm', 'p', 'l', 'e', 'r', '\022', '0', '\n', '\023', 's', 'a', 'm', 'p', 'l', 'i', 'n', 'g', 
'P', 'r', 'o', 'b', 'a', 'b', 'i', 'l', 'i', 't', 'y', '\030', '\001', ' ', '\001', '(', '\001', 'R', '\023', 's', 'a', 'm', 'p', 'l', 'i', 
'n', 'g', 'P', 'r', 'o', 'b', 'a', 'b', 'i', 'l', 'i', 't', 'y', '\"', '\260', '\001', '\n', '\017', 'C', 'o', 'n', 's', 't', 'a', 'n', 
't', 'S', 'a', 'm', 'p', 'l', 'e', 'r', '\022', 'W', '\n', '\010', 'd', 'e', 'c', 'i', 's', 'i', 'o', 'n', '\030', '\001', ' ', '\001', '(', 
'\016', '2', ';', '.', 'o', 'p', 'e', 'n', 'c', 'e', 'n', 's', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '.', 't', 'r', 'a', 'c', 
'e', '.', 'v', '1', '.', 'C', 'o', 'n', 's', 't', 'a', 'n', 't', 'S', 'a', 'm', 'p', 'l', 'e', 'r', '.', 'C', 'o', 'n', 's', 
't', 'a', 'n', 't', 'D', 'e', 'c', 'i', 's', 'i', 'o', 'n', 'R', '\010', 'd', 'e', 'c', 'i', 's', 'i', 'o', 'n', '\"', 'D', '\n', 
'\020', 'C', 'o', 'n', 's', 't', 'a', 'n', 't', 'D', 'e', 'c', 'i', 's', 'i', 'o', 'n', '\022', '\016', '\n', '\n', 'A', 'L', 'W', 'A', 
'Y', 'S', '_', 'O', 'F', 'F', '\020', '\000', '\022', '\r', '\n', '\t', 'A', 'L', 'W', 'A', 'Y', 'S', '_', 'O', 'N', '\020', '\001', '\022', '\021', 
'\n', '\r', 'A', 'L', 'W', 'A', 'Y', 'S', '_', 'P', 'A', 'R', 'E', 'N', 'T', '\020', '\002', '\"', '\'', '\n', '\023', 'R', 'a', 't', 'e', 
'L', 'i', 'm', 'i', 't', 'i', 'n', 'g', 'S', 'a', 'm', 'p', 'l', 'e', 'r', '\022', '\020', '\n', '\003', 'q', 'p', 's', '\030', '\001', ' ', 
'\001', '(', '\003', 'R', '\003', 'q', 'p', 's', 'B', '\222', '\001', '\n', '\034', 'i', 'o', '.', 'o', 'p', 'e', 'n', 'c', 'e', 'n', 's', 'u', 
's', '.', 'p', 'r', 'o', 't', 'o', '.', 't', 'r', 'a', 'c', 'e', '.', 'v', '1', 'B', '\020', 'T', 'r', 'a', 'c', 'e', 'C', 'o', 
'n', 'f', 'i', 'g', 'P', 'r', 'o', 't', 'o', 'P', '\001', 'Z', 'B', 'g', 'i', 't', 'h', 'u', 'b', '.', 'c', 'o', 'm', '/', 'c', 
'e', 'n', 's', 'u', 's', '-', 'i', 'n', 's', 't', 'r', 'u', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', '/', 'o', 'p', 'e', 
'n', 'c', 'e', 'n', 's', 'u', 's', '-', 'p', 'r', 'o', 't', 'o', '/', 'g', 'e', 'n', '-', 'g', 'o', '/', 't', 'r', 'a', 'c', 
'e', '/', 'v', '1', '\352', '\002', '\031', 'O', 'p', 'e', 'n', 'C', 'e', 'n', 's', 'u', 's', '.', 'P', 'r', 'o', 't', 'o', '.', 'T', 
'r', 'a', 'c', 'e', '.', 'V', '1', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static _upb_DefPool_Init *deps[1] = {
  NULL
};

_upb_DefPool_Init opencensus_proto_trace_v1_trace_config_proto_upbdefinit = {
  deps,
  &opencensus_proto_trace_v1_trace_config_proto_upb_file_layout,
  "opencensus/proto/trace/v1/trace_config.proto",
  UPB_STRINGVIEW_INIT(descriptor, 1065)
};
