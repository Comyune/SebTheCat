#!/bin/bash

hugo serve \
  --disableFastRender \
  --debug \
  --log \
  --verbose \
  --verboseLog \
  --path-warnings \
  --renderToDisk \
  --navigateToChanged \
  --templateMetrics \
  --templateMetricsHints \
  --baseURL http://192.168.0.203:1313 \
  --bind 0.0.0.0 \
  --logFile tmp/log.txt
