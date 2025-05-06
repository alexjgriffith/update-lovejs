MEGASOURCE=$(CURDIR)/megasource
EMSDK=$(CURDIR)/emsdk

BRANCH=js-lua-interface
EMCC_VERSION=4.0.8
LOVE_VERSION=115
LOVEJS_VERSION=beta1
LOVE_HASH=6eb8d54
MEGASOURCE_HASH=48811d0

MEGASOURCE_PATCHNAME=megasource-lovejs-$(LOVE_VERSION)x$(EMCC_VERSION)v$(PATCH_VERSION)-$(MEGASOURCE_HASH).patch
LOVE_PATCHNAME=love-lovejs-$(LOVE_VERSION)x$(EMCC_VERSION)v$(PATCH_VERSION)-$(LOVE_HASH).patch

compile:
	./scripts/build.sh $(MEGASOURCE) $(EMSDK)

.PHONY: release
release:
	./scripts/release.sh $(LOVE_VERSION) $(LOVEJS_VERSION)

.PHONY: patch
patch: patch_megasource patch_love

patch_megasource:
	 ./patch.sh megasource $(BRANCH) $(MEGASOURCE_HASH) ../patches/$(MEGASOURCE_PATCHNAME)

patch_love:
	 ./patch.sh love $(BRANCH) $(LOVE_HASH) ../patches/$(LOVE_PATCHNAME)
