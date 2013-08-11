#!/bin/bash

test_redpulld_and_redpush_end_to_end_communication()
{
    out=/tmp/.test.$$.endtoend.out
    redpulld -s localhost 6379 test >$out &
    pid=$!

    sleep 0.5
    echo "test hello filthy animal" | redpush -s localhost 6379

    sleep 0.5
    kill $pid
    wait $pid &>/dev/null

    assert \
        "cat $out" \
        "hello filthy animal"

    #rm $out
}
