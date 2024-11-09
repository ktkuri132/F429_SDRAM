##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [4.3.0-B58] date: [Wed Jul 17 15:59:56 CST 2024]
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = temp


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

# link script
LDSCRIPT = CORE/STM32F429IGTx_FLASH.ld

######################################
# source
######################################
# ASM sources
ASM_SOURCES =  CORE/startup_stm32f429_439xx.s


# ASM sources
ASMM_SOURCES = 



# C defines
#C_DEFS =  -DUSE_STDPERIPH_DRIVER 
C_DEFS += -DSTM32F429_439xx


# C sources

C_SOURCES = $(wildcard USER/*.c)

C_SOURCES += $(wildcard CORE/*.c)

C_SOURCES += $(wildcard BSP/*.c)
C_SOURCES += $(wildcard BSP/gpio/*.c)
C_SOURCES += $(wildcard BSP/systick/*.c)
C_SOURCES += $(wildcard BSP/usart/*.c)

C_SOURCES += $(wildcard RTOS/*.c)
C_SOURCES += $(wildcard RTOS/portable/ARM_CM4F/*.c)
C_SOURCES += $(wildcard RTOS/portable/MemMang/*.c)
#C_SOURCES += $(wildcard SYSTEM/delay/*.c)
#C_SOURCES += $(wildcard SYSTEM/sys/*.c)
#C_SOURCES += $(wildcard SYSTEM/usart/*.c)

#C_SOURCES += $(wildcard HADRWARE/LCD/*.c)
#C_SOURCES += $(wildcard HADRWARE/SDRAM/*.c)
#C_SOURCES += $(wildcard HADRWARE/TOUCH/*.c)
#C_SOURCES += $(wildcard HADRWARE/JY61_USART/*.c)

#C_SOURCES += $(wildcard Lib/src/*.c)

# C++ sources
#CXX_SOURCES = $(wildcard Lib/src/*.cpp)


# C includes
C_INCLUDES =  -ICORE/

C_INCLUDES += -IBSP/
C_INCLUDES += -IBSP/gpio/
C_INCLUDES += -IBSP/systick/
C_INCLUDES += -IBSP/usart/

C_INCLUDES += -IRTOS/
C_INCLUDES += -IRTOS/portable/ARM_CM4F/
C_INCLUDES += -IRTOS/include/

#C_INCLUDES += -ILibraries/CMSIS/include/
#C_INCLUDES += -ILibraries/STM32F4xx_StdPeriph_Driver/inc/

#C_INCLUDES += -ISYSTEM/delay/
#C_INCLUDES += -ISYSTEM/sys/
#C_INCLUDES += -ISYSTEM/usart/

#C_INCLUDES += -IHADRWARE/LCD/
#C_INCLUDES += -IHADRWARE/SDRAM/
#C_INCLUDES += -IHADRWARE/TOUCH/
#C_INCLUDES += -IHADRWARE/JY61_USART/

#C_INCLUDES += -ILib/inc/

# C++ includes
CXX_INCLUDES =

# ASM includes
# AS defines
AS_DEFS = 





#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
CXX= $(GCC_PATH)/$(PREFIX)g++
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
CXX= $(PREFIX)g++
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CXXFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections
CXXFLAGS += $(CFLAGS) $(CXX_INCLUDES)
ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
CXXFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"
CXXFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################


# libraries  锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟接撅拷态锟斤拷山锟斤拷_read ,_wirtet锟斤拷锟斤拷
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nosys.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
#
# list of C++ objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(CXX_SOURCES:.cpp=.o)))
vpath %.cpp $(sort $(dir $(CXX_SOURCES)))
#
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASMM_SOURCES:.S=.o)))
vpath %.S $(sort $(dir $(ASMM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@
#锟剿达拷锟斤拷锟斤拷c++锟侥憋拷锟斤拷
$(BUILD_DIR)/%.o: %.cpp Makefile | $(BUILD_DIR)
	$(CXX) -c $(CXXFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.cpp=.lst)) $< -o $@
#
$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@
$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CXXFLAGS) $< -o $@


$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@


$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		


clean:
	-rm -fR $(BUILD_DIR)/*.o
	-rm -fR $(BUILD_DIR)/*.d
	-rm -fR $(BUILD_DIR)/*.lst


dol:
	echo "this is a test function"  
	openocd -f interface/cmsis-dap.cfg -f target/stm32f4x.cfg -c init -c "reset halt; wait_halt; flash write_image erase ./${BUILD_DIR}/$(TARGET).bin 0x08000000" -c reset -c shutdown

rebuild_run:
	make clean
	make -j20 
	make dol
	echo "program is running......"
build_run:
	make -j20 
	make dol
	echo "program is running......"
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***