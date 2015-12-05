SWIFTC=swiftc
UNAME=$(shell uname)

ifeq ($(UNAME), Darwin)
XCODE=$(shell xcode-select -p)
SDK=$(XCODE)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk
TARGET=x86_64-apple-macosx10.10
SWIFTC=swiftc -target $(TARGET) -sdk $(SDK)
endif

.PHONY: all clean

all:
	swift build --configuration release
	$(SWIFTC) -o HelloWorld -I.build/release main.swift \
		-Xlinker .build/release/Commander.a \
		-Xlinker .build/release/Currasow.a \
		-Xlinker .build/release/Inquiline.a \
		-Xlinker .build/release/Nest.a -Xlinker -all_load

clean:
	swift build --clean
	rm -f HelloWorld

