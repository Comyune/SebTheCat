#!/bin/bash

hugo serve \
  --disableFastRender \
  --baseURL "http://192.168.0.203:1313" \
  --bind "0.0.0.0" \ 
  --debug \
  --log \
  --verbose \
  --verboseLog \
  --navigateToChanged
