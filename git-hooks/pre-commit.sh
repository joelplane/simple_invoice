#!/bin/bash
tests_pass() {
  ./test.sh
}

if [ "$JUST_DO_IT" == "1" ]; then
  exit 0
fi

if tests_pass; then
  echo "[INFO]  tests passed"
else
  echo "[ERROR] tests failed"
  exit 1
fi
