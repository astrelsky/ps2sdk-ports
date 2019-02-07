EE_OBJS_DIR = ../obj/
EE_LIB_DIR = ../lib/

EE_LIB = $(EE_LIB_DIR)libid3tag.a
EE_OBJS = compat.o crc.o debug.o field.o file.o frame.o frametype.o \
	genre.o latin1.o parse.o render.o tag.o ucs4.o utf16.o utf8.o \
	util.o version.o
EE_OBJS := $(EE_OBJS:%=$(EE_OBJS_DIR)%)

EE_CFLAGS += -DHAVE_CONFIG_H -DHAVE_SYS_TYPES_H -DHAVE_ERRNO_H \
	-DHAVE_UNISTD_H -DHAVE_FCNTL_H -I$(PS2SDKUJ)/common/include/sys/ 

EE_INCS += -I$(PS2SDKUJ)/ports/include -I../include
EE_LDFLAGS += -L$(PS2SDKUJ)/ports/lib

all: $(EE_OBJS_DIR) $(EE_LIB_DIR) $(EE_LIB)

$(EE_OBJS_DIR):
	mkdir -p $(EE_OBJS_DIR)

$(EE_LIB_DIR):
	mkdir -p $(EE_LIB_DIR)

$(EE_OBJS_DIR)%.o : %.c
	$(EE_C_COMPILE) -c $< -o $@

install: all
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/include
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f $(EE_LIB) $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f ../include/id3tag.h $(DESTDIR)$(PS2SDKUJ)/ports/include

clean:
	rm -f -r $(EE_OBJS_DIR) $(EE_LIB_DIR)

sample:

include $(PS2SDKUJ)/Defs.make
include ../../../Makefile.eeglobal
