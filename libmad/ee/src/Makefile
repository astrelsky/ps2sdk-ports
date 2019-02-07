EE_OBJS_DIR = ../obj/
EE_LIB_DIR = ../lib/

EE_LIB =  $(EE_LIB_DIR)libmad.a
EE_OBJS = bit.o decoder.o fixed.o frame.o huffman.o layer12.o layer3.o \
	stream.o synth.o timer.o version.o 
EE_OBJS := $(EE_OBJS:%=$(EE_OBJS_DIR)%)

EE_CFLAGS += -DHAVE_CONFIG_H -DHAVE_SYS_TYPES_H -DHAVE_ERRNO_H -DHAVE_UNISTD_H \
	-DHAVE_FCNTL_H -I$(PS2SDKUJ)/common/include/sys/  -I../include

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
	cp -f ../include/mad.h $(DESTDIR)$(PS2SDKUJ)/ports/include

clean:
	rm -f -r $(EE_OBJS_DIR) $(EE_LIB_DIR)

sample:

include $(PS2SDKUJ)/Defs.make
include ../../../Makefile.eeglobal
