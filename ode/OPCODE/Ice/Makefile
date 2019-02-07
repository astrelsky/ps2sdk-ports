EE_LIB_DIR=../../lib/
LIB_ICE=$(EE_LIB_DIR)libice.a

EE_CFLAGS += -DDISABLE_TIMERS
EE_CFLAGS += -DNO_SIGNAL_H -DDEBUG_ERROR -DDEBUG_VIDEO -DUSE_MATH_H
EE_CFLAGS += -DENABLE_PS2SDK

ICE_OBJS  = IceAABB.o IceContainer.o IceHPoint.o IceIndexedTriangle.o \
	IceMatrix3x3.o IceMatrix4x4.o IceOBB.o IcePlane.o IcePoint.o \
	IceRandom.o IceRay.o IceRevisitedRadix.o IceSegment.o \
	IceTriangle.o IceUtils.o

EE_INCS  = -I../../include -I../../OPCODE

all: $(LIB_ICE) 

$(LIB_ICE): $(ICE_OBJS)
	$(EE_AR) cru $(LIB_ICE) $(ICE_OBJS)

install: all
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/include/ode
	mkdir -p $(DESTDIR)$(PS2SDKUJ)/ports/lib
	cp -f $(LIB_ICE) $(DESTDIR)$(PS2SDKUJ)/ports/lib

clean:
	rm -f $(LIB_ICE) $(LIB_ICEMAIN) $(ICE_OBJS)

include $(PS2SDKUJ)/Defs.make
include ../../../Makefile.eeglobal
