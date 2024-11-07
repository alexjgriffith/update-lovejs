TARGET=release
PROJECT_NAME=game

LOVEFILE=$(PROJECT_NAME).love

update:
	$(shell cd game && find -type f | LC_ALL=C sort | env TZ=UTC zip -r -q -9 -X ../${LOVEFILE} -@)
	./scripts/update-sample.sh

serve:
	$(shell cd game && find -type f | LC_ALL=C sort | env TZ=UTC zip -r -q -9 -X ../${LOVEFILE} -@)
	./scripts/update-sample.sh
	$(shell cd $(TARGET); echo "Serving " $(LOVEFILE) ; python3 ../scripts/serve.py)

# $(LOVEFILE):
# 	$(shell cd game && find -type f | LC_ALL=C sort | env TZ=UTC zip -r -q -9 -X ../$@ -@)

clean: ; rm $(LOVEFILE) index.html
