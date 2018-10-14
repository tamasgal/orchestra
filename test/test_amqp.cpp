#include "../externals/catch.hpp"
#include <amqp_tcp_socket.h>
#include <amqp.h>

unsigned int amqp_api_check() {
    amqp_socket_t *socket = NULL;
    amqp_connection_state_t conn;
    amqp_bytes_t queuename;
    return 0;
}

TEST_CASE( "AMQP API Check", "[amqp]" ) {
    REQUIRE(0 == amqp_api_check());
}
