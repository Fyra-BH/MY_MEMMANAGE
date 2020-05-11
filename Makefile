# 目标
TARGET :=out
#build 目录
BUILD_DIR=build

CC :=gcc

SZ :=size
# 头文件目录
INCDIRS:=\
mem
# 源文件目录
SRCDIRS:=\
mem \
./ 

INCLUDE:= $(patsubst %, -I %, $(INCDIRS))

CFILES:=$(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.c))
# 库
LIBS:=\
# -lpthread

OBJECTS:=$(addprefix $(BUILD_DIR)/,$(notdir $(CFILES:.c=.o)))

.PHONLYS:clean

VPATH:=$(SRCDIRS)

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	$(CC) -c -g -m32 $<  $(INCLUDE) -o $@

$(BUILD_DIR)/$(TARGET):$(OBJECTS)
	$(CC) $(OBJECTS) -m32 -o $@ $(LIBS)

$(BUILD_DIR):
	mkdir $@

clean:
# echo CFILES=$(CFILES)
	rm -rf $(BUILD_DIR)



