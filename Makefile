PROGNAME = orchestra
GIT_VERSION := $(shell git --no-pager describe --tags --always)
GIT_COMMIT  := $(shell git rev-parse --verify HEAD)
GIT_DATE    := $(firstword $(shell git --no-pager show --date=format:'%Y-%m-%dT%H:%M:%S%z' --format="%ad" --name-only))
BUILD_DATE  := $(shell date +%Y-%m-%dT%H:%M:%S%z)
# If working tree is dirty, append dirty flag
ifneq ($(strip $(shell git status --porcelain 2>/dev/null)),)
 GIT_VERSION := $(GIT_VERSION)-D
endif

CFLAGS = -Wall -std=c++11 \
	 -DGIT_VERSION=\"$(GIT_VERSION)\"\
	 -DGIT_COMMIT=\"$(GIT_COMMIT)\"\
	 -DGIT_DATE=\"$(GIT_DATE)\"\
	 -DBUILD_DATE=\"$(BUILD_DATE)\"
LIBS = -lrabbitmq
CC = g++
RM = /bin/rm -f


BIN_DIR = ./bin
SRC_DIR = ./src
SRC_TEST_DIR = ./test
BUILD_DIR = ./build
SRC_TEST_LIST = $(wildcard $(SRC_TEST_DIR)/test_*.cpp)

.PHONY:  test clean

$(PROGNAME): $(SRC_DIR)/$(PROGNAME).cpp
	@echo Nothing to build...
	gcc $(CFLAGS) $? -o $@

test: $(BIN_DIR)/test_$(PROGNAME)
	$(BIN_DIR)/test_$(PROGNAME)

junit.xml: $(BIN_DIR)/test_$(PROGNAME)
	$(BIN_DIR)/test_$(PROGNAME) -r junit > $@

$(BUILD_DIR)/catch.o: $(SRC_TEST_DIR)/catch.cpp
	${CC} ${CFLAGS} -c $? -o $@

$(BIN_DIR)/test_$(PROGNAME): $(BUILD_DIR)/catch.o $(SRC_TEST_LIST) 
	$(CC) $(CFLAGS) $(LIBS) $? -o $@

clean:
	${RM} ${BIN_DIR}/*
	${RM} ${BUILD_DIR}/*.o
