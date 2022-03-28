CC = clang
CXX = clang++
override CFLAGS += -g -Wno-everything -pthread -lm -I googletest-release-1.11.0/googletest -I googletest-release-1.11.0/googletest/include -lstdc++

COMPILE.c =  $(CC) $(CFLAGS) -c
COMPILE.cc = $(CXX) $(CFLAGS) -c

SRCS = googletest-release-1.11.0/googletest/src/gtest-all.cc googletest-release-1.11.0/googletest/src/gtest_main.cc $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.c' -print) test_main.c
OBJS = $(shell echo $(SRCS) | sed 's/\.\(c\|cc\)/.o/g')

main: $(OBJS)
	$(CXX) $(CFLAGS) $(OBJS) -o main

clean:
	rm -f $(OBJS) main
