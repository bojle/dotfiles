#!/bin/bash

wget -nc 'https://raw.githubusercontent.com/onnx/onnx/main/onnx/onnx.proto' -O /tmp/onnx.proto
protoc --decode=onnx.ModelProto -I /tmp onnx.proto < $1 > $1.txt
