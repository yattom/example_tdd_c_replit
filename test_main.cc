#include <gtest/gtest.h>

extern "C"
{
#include "main.h"
}

using namespace ::testing;

TEST(Main, Value)
{
  ASSERT_EQ(42, calc());
}