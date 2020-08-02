#!/bin/bash

hugo serve \
  --noHTTPCache \
  --disableFastRender \
  --debug \
  --log \
  --verbose \
  --verboseLog \
  --navigateToChanged
