#!/bin/bash

PATH="./bin:$PATH"

. ./test/assert.sh
. ./test/test-redpulld.sh
. ./test/test-redpush.sh
. ./test/test-end-to-end.sh

suite=$(typeset -F | sed 's/declare -f //' | grep '^test')

for test in ${suite[@]}; do
    $test
done

assert_end examples
