#!/bin/bash

if [ "${TEST_MM2}" == "True" ]; then
    /tests/run_mm2_tests.sh
fi

if [ "${TEST_KMD}" == "True" ]; then
    /tests/run_kmd_tests.sh
fi
