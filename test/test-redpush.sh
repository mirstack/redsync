test_redpush_fails_when_not_enough_arguments_given()
{
    assert \
        "redpush 2>&1" \
        "ERROR -- not enough arguments" \
        "hello world"
}

test_redpush_fails_when_too_many_arguments_given()
{
    assert \
        "redpush one two three 2>&1" \
        "ERROR -- invalid number of arguments" \
        "hello world"
}

test_redpush_fails_when_invalid_host_given()
{
    assert \
        "redpush invalid_host 6379 2>&1" \
        "CRITICAL -- Could not connect to Redis at invalid_host:6379: No address associated with hostname" \
        "hello world"
}

test_redpush_fails_when_invalid_port_given()
{
    assert \
        "redpush localhost 6390 2>&1" \
        "CRITICAL -- Could not connect to Redis at localhost:6390: Connection refused" \
        "hello world"
}

test_redpush_fails_when_invalid_packet_received()
{
    assert \
        "redpush 6379 2>&1" \
        "ERROR -- invalid packet received" \
        "invalid"
}

test_redpush_sends_message_when_valid_packet_receive()
{
    assert \
        "redpush 6379 2>&1" \
        "INFO -- published on 'hello' to 0 clients: world" \
        "hello world"
}
