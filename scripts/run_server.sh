#!/bin/bash

hugo serve \
  --disableFastRender \
  --baseURL "http://192.168.0.203:1313" \
  --log \
  --verbose \
  --verboseLog \
  --navigateToChanged \
  --bind "0.0.0.0"
