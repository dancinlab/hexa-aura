#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# CLIP.tape — architecture-current (editable per v1.2)
# Event history → CLIP.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "clip" :: identity-claim [d=2026-05-15 active]
  kind = "HEXA-Aura family · pillar 1/4 · mastoid form-factor"
  brief = "BTE clip pair anchored on temporal-bone mastoid · φ=2 clips · σ·n/10 = 3.6 g/side · sopfr=5 mm bone window · τ=4-point passive anchor"
  parent = "dancinlab/hexa-aura"
  pillar_name = "HEXA-MASTOID-CLIP"
  falsifier = "F-AURA-1"
  spec = "clip/doc/mastoid-clip.md"
  sibling-log = "CLIP.log.tape"

@L l1 := "clip-pillar-layout" :: structure [active]
  spec -> "clip/doc/mastoid-clip.md (§0 lattice + §1 WHY + §2 COMPARE + §3 REQUIRES + §4 STRUCT + §5 FLOW + §6 VERIFY + §7 EVOLVE + §8 scope)"
  t1_calc -> "verify/calc_clip.hexa"
  t2_numerics -> "verify/numerics_clip.hexa"
  t2_solver -> "verify/numerics_clip_solver.hexa (damped torsional oscillator I·θ'' + b·θ' + κ·θ = M_jaw)"
  t3_parity -> "verify/numerics_clip_parity.hexa (BTE hearing-aid · Shokz · AirPods · Cochlear-N7 · Google-Glass)"
  cli -> "cli/hexa-aura.hexa clip"

@D d_mass := "3.6-g-per-side" :: clip [required active]
  rule = "σ·n/10 = 3.6 g/side → n·n/10 = 7.2 g pair (AirPods-Pro 5.4 g class)"
  why = "device-count collapse (18 → φ=2) requires mass ≤ hearing-aid BTE class"
  authority = ".roadmap.hexa_aura §B.1"

@D d_window := "sopfr-5mm-bone-window" :: clip [required active]
  rule = "≤ 5 mm temporal-bone thickness window; avoid mastoid air cells; sopfr(6) = 2+3 = 5"
  authority = ".roadmap.hexa_aura §A.1 + §B.1"

@D d_anchor := "tau-4-point-passive-anchor" :: clip [required active]
  rule = "τ=4 anchor points: helix root · mastoid tip · ear-canal entry · concha cymba; no glue, no surgery"
  authority = "clip/doc/mastoid-clip.md §0"

@F f_aura_1a := "passive-3.6g-anchor-jaw-motion" :: falsifier [active]
  status = "OPEN"
  claim = "a 3.6 g/side passive anchor cannot hold position against jaw/chewing motion"
  closure = "T1 ✓ + T2 ✓ + T3 ✓ = 100% code-layer (T4 in-vivo unstarted)"

@F f_aura_1b := "rt-sc-fit-3.6g" :: falsifier [active]
  status = "OPEN"
  claim = "RT-SC coil + driver + battery + radio cannot fit in σ·n/10 = 3.6 g at hearing-aid-BTE density"

@F f_aura_1c := "bone-conduction-hair-hidden" :: falsifier [active]
  status = "OPEN"
  claim = "bone-conduction back-channel cannot survive being hidden under hair (no skin-contact mic/speaker)"

@X x_roadmap := ".roadmap.hexa_aura §B.1" :: roadmap [active]
  scope = "F-AURA-1 sub-ID detail table"
