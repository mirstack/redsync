test_redpulld_fails_when_not_enough_arguments_given()
{
    assert \
        "redpulld 2>&1" \
        "ERROR -- not enough arguments"
}

test_redpulld_fails_when_too_many_arguments_given()
{
    assert \
        "redpulld one two three four 2>&1" \
        "ERROR -- invalid number of arguments"
}

test_redpulld_fails_when_invalid_host_given()
{
    assert \
        "redpulld invalid_host 6379 test 2>&1" \
        "CRITICAL -- Error -5 connecting invalid_host:6379. No address associated with hostname."
}

test_redpulld_fails_when_invalid_port_given()
{
    assert \
        "redpulld localhost 6390 test 2>&1" \
        "CRITICAL -- Error 111 connecting localhost:6390. Connection refused."
}

test_redpulld_works_fine_when_correct_parameters_given()
{
    out=/tmp/.test.$$.redpulld.out

    redpulld localhost 6379 test &>$out &
    pid=$!
    sleep 0.5
    kill $pid
    wait $pid &>/dev/null

    assert \
        "cat $out" \
        "INFO -- subscribed to channel: test"

    rm $out
}
