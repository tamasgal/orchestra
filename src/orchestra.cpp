#include <stdio.h>
#include "orchestra.h"

namespace orch {

    int add(int a, int b) {
        return a + b;
    }


    void print_version() {
        printf("Orchestra\n");
        printf("GIT VERSION - %s\n", GIT_VERSION);
        printf("GIT COMMIT  - %s\n", GIT_COMMIT);
        printf("GIT DATE    - %s\n", GIT_DATE);
        printf("BUILD DATE  - %s\n", BUILD_DATE);
    }

}
