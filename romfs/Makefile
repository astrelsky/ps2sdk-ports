EE_SRC_DIR = src/
EE_OBJS_DIR = obj/
EE_LIB_DIR = lib/

EE_LIB     = $(EE_LIB_DIR)libromfs.a

EE_INCS   += -I./include

EE_CFLAGS += -DSYS_LITTLE_ENDIAN -DSYS_NEED_ALIGNMENT

EE_OBJS   += romfs.o romfs_io.o
EE_OBJS   := $(EE_OBJS:%=$(EE_OBJS_DIR)%)

all: $(EE_OBJS_DIR) $(EE_LIB_DIR) $(EE_LIB)
	$(MAKE) -C tools/genromfs all

$(EE_OBJS_DIR):
	mkdir -p $(EE_OBJS_DIR)

$(EE_LIB_DIR):
	mkdir -p $(EE_LIB_DIR)

$(EE_OBJS_DIR)%.o : $(EE_SRC_DIR)%.c
	$(EE_C_COMPILE) -c $< -o $@

install: all
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/bin/
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/include/
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f $(EE_LIB) $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f include/*.h $(DESTDIR)$(PS2SDKUJ)/ports/include/
	cp -f tools/genromfs/genromfs $(DESTDIR)$(PS2SDKUJ)/bin/

clean:
	rm -f -r $(EE_OBJS_DIR) $(EE_LIB_DIR)
	$(MAKE) -C regress/ clean
	$(MAKE) -C tools/genromfs clean
	
sample: all
	$(MAKE) -C regress/

include $(PS2SDKUJ)/Defs.make
include ../Makefile.eeglobal
