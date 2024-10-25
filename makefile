BRANCH=update-emscripten
EMCC_VERSION=3.1.68
LOVE_VERSION=11.5
LOVE_HASH=6eb8d54
MEGASOURCE_HASH=48811d0

MEGASOURCE_PATCHNAME=megasource-lovejs-$(LOVE_VERSION)x$(EMCC_VERSION)v$(PATCH_VERSION)-$(MEGASOURCE_HASH).patch
LOVE_PATCHNAME=love-lovejs-$(LOVE_VERSION)x$(EMCC_VERSION)v$(PATCH_VERSION)-$(LOVE_HASH).patch

COMPAT_FILE_LOCATION=love.js/build/compat/
RELEASE_FILE_LOCATION=love.js/build/release/

.PHONY: patch
patch: patch_megasource patch_love

build:
	./build.sh $(BRANCH) $(LOVE_VERSION) $(EMCC_VERSION)

patch_megasource:
	 ./patch.sh megasource $(BRANCH) $(MEGASOURCE_HASH) ../patches/$(MEGASOURCE_PATCHNAME)

patch_love:
	 ./patch.sh love $(BRANCH) $(LOVE_HASH) ../patches/$(LOVE_PATCHNAME)
