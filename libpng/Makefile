EE_OBJS_DIR = obj/
EE_LIB_DIR = lib/

EE_LIB = $(EE_LIB_DIR)libpng.a
# SOURCE_DIR = ../orig/libpng/
SOURCE_DIR = src/

EE_LDFLAGS += -L. -L$(PS2SDKUJ)/ports/lib
EE_INCS    += -I. -I./include -I.$(SOURCE_DIR) -I$(PS2SDKUJ)/ports/include
EE_LIBS    += -lz

EE_OBJS = png.o pngset.o pngget.o pngrutil.o pngtrans.o \
          pngwutil.o pngread.o pngrio.o pngwio.o pngwrite.o \
          pngrtran.o pngwtran.o pngmem.o pngerror.o pngpread.o
EE_OBJS := $(EE_OBJS:%=$(EE_OBJS_DIR)%)

TEST_OBJS = $(SOURCE_DIR)pngtest.o
TEST_BIN = pngtest.elf
TEST_CFLAGS = -I$(PS2SDKUJ)/ports/include -I$(SOURCE_DIR)
TEST_LIBS = -lz #-lm
TEST_LDFLAGS += -L$(PS2SDKUJ)/ee/lib -L$(PS2SDKUJ)/ports/lib $(EE_LIB)

all: pnglibconf.h $(EE_OBJS_DIR) $(EE_LIB_DIR) $(EE_LIB)

$(EE_LIB_DIR):
	mkdir -p $(EE_LIB_DIR)

$(EE_OBJS_DIR):
	mkdir -p $(EE_OBJS_DIR)

$(EE_OBJS_DIR)%.o : $(SOURCE_DIR)%.c
	$(EE_C_COMPILE) -c $< -o $@

pnglibconf.h: pngusr.h
	cp ./pngusr.h $(SOURCE_DIR)
	cd $(SOURCE_DIR) && CPPFLAGS=-DPNG_USER_CONFIG $(MAKE) -f scripts/pnglibconf.mak

$(TEST_BIN) : $(TEST_OBJS)
	$(EE_CC) $(TEST_CFLAGS) -o $(TEST_BIN) $(TEST_OBJS) $(TEST_LDFLAGS) $(TEST_LIBS)
	cp $(SOURCE_DIR)pngtest.png ./

install: all
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/include
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f $(EE_LIB) $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f $(SOURCE_DIR)png.h $(DESTDIR)$(PS2SDKUJ)/ports/include
	cp -f $(SOURCE_DIR)pngconf.h $(DESTDIR)$(PS2SDKUJ)/ports/include
	cp -f $(SOURCE_DIR)pnglibconf.h $(DESTDIR)$(PS2SDKUJ)/ports/include

sample: all $(TEST_BIN)

clean:
	rm -f -r $(SOURCE_DIR)pnglibconf.* $(SOURCE_DIR)pngusr.h $(EE_OBJS_DIR) $(EE_LIB_DIR) $(TEST_BIN) $(TEST_OBJS) pngtest.png pngout.png

include $(PS2SDKUJ)/Defs.make
include ../Makefile.eeglobal
