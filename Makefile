PROGNAME = orchestra
CFLAGS = -Wall -std=c++11
CC = g++
RM = /bin/rm -f

BIN_DIR = ./bin
SRC_DIR = ./src
SRC_TEST_DIR = ./test
BUILD_DIR = ./build
SRC_TEST_LIST = $(wildcard $(SRC_TEST_DIR)/test_*.cpp)

.PHONY:  test clean

all:
	@echo Nothing to build...

test: $(BIN_DIR)/test_$(PROGNAME)
	$(BIN_DIR)/test_$(PROGNAME)

junit.xml: $(BIN_DIR)/test_$(PROGNAME)
	$(BIN_DIR)/test_$(PROGNAME) -r junit > $@

$(BUILD_DIR)/catch.o: $(SRC_TEST_DIR)/catch.cpp
	${CC} ${CFLAGS} -c $? -o $@

$(BIN_DIR)/test_$(PROGNAME): $(BUILD_DIR)/catch.o $(SRC_TEST_LIST) 
	$(CC) $(CFLAGS) $? -o $@

clean:
	${RM} ${BIN_DIR}/*
	${RM} ${BUILD_DIR}/*.o
