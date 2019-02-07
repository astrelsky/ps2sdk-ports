#! /bin/sh

#Copied from ps2toolchain.
## Check if $PS2DEV is set.
if test ! $PS2DEV; then { echo "ERROR: Set \$PS2DEV before continuing."; exit 1; } fi

 ## Check if $PS2SDKUJ is set.
if test ! $PS2SDKUJ; then { echo "ERROR: Set \$PS2SDKUJ before continuing."; exit 1; } fi

## Determine GNU Make command.
if command -v gmake >/dev/null; then
	GNUMAKE=gmake
else
	GNUMAKE=make
fi

cp -fr builds src/
cd src/

echo "Building FreeType..."
$GNUMAKE setup ps2 --silent; $GNUMAKE --silent

## Install the library.
echo "Copying library files..."
mkdir -p $PS2SDKUJ/ports/lib
cp -f objs/libfreetype.a $PS2SDKUJ/ports/lib

## Install the include files.
echo "Copying include files..."
mkdir -p $PS2SDKUJ/ports/include
cp -fR include/* $PS2SDKUJ/ports/include

## Post-installation cleanup.
echo "Cleaning up..."
$GNUMAKE clean --silent
$GNUMAKE distclean --silent

echo "FreeType built and installed."
