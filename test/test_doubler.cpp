#include "../externals/catch.hpp"

unsigned int doubler( unsigned int x ) {
    return x * 2;
}

TEST_CASE( "Doubler doubles", "[doubler]" ) {
    REQUIRE(2 == doubler(1));
    REQUIRE(4 == doubler(2));
}
