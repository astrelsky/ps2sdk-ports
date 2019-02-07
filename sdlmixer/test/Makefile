BINS = sample.elf

EE_CFLAGS = -DUSE_RWOPS
EE_INCS = -I../include -I$(PS2SDKUJ)/ports/include -I$(PS2SDKUJ)/ports/include/SDL
EE_LIBS = -L../lib -L$(PS2SDKUJ)/ports/lib -lsdlmixer -lsdl

all: $(BINS)

install:

%.elf : %.o
	$(EE_CXX) $(EE_LDFLAGS) -o $@ $< $(EE_LIBS)

clean:
	rm -f $(BINS) $(OBJS)

include $(PS2SDKUJ)/Defs.make
include ../../Makefile.eeglobal
