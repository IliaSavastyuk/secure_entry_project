# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\Meow\\Desktop\\secure_entry_project\\vitis\\Secure_Platform\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "C:\\Users\\Meow\\Desktop\\secure_entry_project\\vitis\\Secure_Platform\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "C:\\Users\\Meow\\Desktop\\secure_entry_project\\vitis\\Secure_Platform\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "C:\\Users\\Meow\\Desktop\\secure_entry_project\\vitis\\Secure_Platform\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
