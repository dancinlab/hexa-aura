# hexa-aura/build/Makefile — pandoc + xelatex 5-PDF rebuild (OPTIONAL).
#
# Builds the 4 pillar specs + the main atlas doc (neuro) into build/out/*.pdf.
# Soft-guarded: a host without the optional LaTeX packages still produces a
# clean ASCII-fallback PDF (see header.tex). hexa-aura ships ZERO hard build
# deps — this is a convenience target only.
#
# Usage:
#   make check     # probe the toolchain (pandoc + xelatex + hexa)
#   make all       # build all 5 PDFs into build/out/
#   make clip      # build just the clip pillar PDF
#   make coil | cortex | safety | atlas
#   make verify    # cross-link to the verify pipeline (hexa run cli verify all)
#   make size      # ls -lh build/out/
#   make clean     # rm -rf build/out/

ROOT      := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)
OUT       := $(ROOT)/build/out
HEADER    := $(ROOT)/build/header.tex
PANDOC    := pandoc
PANDOCFLAGS := --pdf-engine=xelatex -V geometry:margin=2.2cm -V mainfont="DejaVu Serif" \
               -V monofont="DejaVu Sans Mono" --include-in-header=$(HEADER) \
               --toc --toc-depth=3 -V colorlinks=true

PILLARS := clip coil cortex safety
clip_SRC   := $(ROOT)/clip/doc/mastoid-clip.md
coil_SRC   := $(ROOT)/coil/doc/rt-sc-nanocoil.md
cortex_SRC := $(ROOT)/cortex/doc/cortical-interface.md
safety_SRC := $(ROOT)/safety/doc/cortical-safety.md
atlas_SRC  := $(ROOT)/docs/neuro.md

.PHONY: all check clean size verify $(PILLARS) atlas

all: $(PILLARS) atlas

$(OUT):
	mkdir -p $(OUT)

clip: | $(OUT)
	$(PANDOC) $(PANDOCFLAGS) -o $(OUT)/hexa-aura-clip.pdf $(clip_SRC) || \
	$(PANDOC) --pdf-engine=xelatex -V geometry:margin=2.2cm -o $(OUT)/hexa-aura-clip.pdf $(clip_SRC)

coil: | $(OUT)
	$(PANDOC) $(PANDOCFLAGS) -o $(OUT)/hexa-aura-coil.pdf $(coil_SRC) || \
	$(PANDOC) --pdf-engine=xelatex -V geometry:margin=2.2cm -o $(OUT)/hexa-aura-coil.pdf $(coil_SRC)

cortex: | $(OUT)
	$(PANDOC) $(PANDOCFLAGS) -o $(OUT)/hexa-aura-cortex.pdf $(cortex_SRC) || \
	$(PANDOC) --pdf-engine=xelatex -V geometry:margin=2.2cm -o $(OUT)/hexa-aura-cortex.pdf $(cortex_SRC)

safety: | $(OUT)
	$(PANDOC) $(PANDOCFLAGS) -o $(OUT)/hexa-aura-safety.pdf $(safety_SRC) || \
	$(PANDOC) --pdf-engine=xelatex -V geometry:margin=2.2cm -o $(OUT)/hexa-aura-safety.pdf $(safety_SRC)

atlas: | $(OUT)
	$(PANDOC) $(PANDOCFLAGS) -o $(OUT)/hexa-aura-atlas-neuro.pdf $(atlas_SRC) || \
	$(PANDOC) --pdf-engine=xelatex -V geometry:margin=2.2cm -o $(OUT)/hexa-aura-atlas-neuro.pdf $(atlas_SRC)

check:
	@echo "== hexa-aura build toolchain probe =="
	@command -v $(PANDOC) >/dev/null 2>&1 && $(PANDOC) --version | head -1 || echo "pandoc: MISSING"
	@command -v xelatex >/dev/null 2>&1 && xelatex --version | head -1 || echo "xelatex: MISSING (ASCII-fallback PDFs only)"
	@command -v hexa >/dev/null 2>&1 && echo "hexa: present" || echo "hexa: not on PATH (CLI/verify need it)"
	@echo "header.tex: $(HEADER)"
	@echo "out dir:    $(OUT)"

verify:
	cd $(ROOT) && HEXA_AURA_ROOT=$(ROOT) hexa run cli/hexa-aura.hexa verify all

size:
	@ls -lh $(OUT) 2>/dev/null || echo "(build/out/ empty — run 'make all')"

clean:
	rm -rf $(OUT)
