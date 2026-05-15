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
# COIL.log.tape — append-only event history (v1.2 split)
# Sibling: COIL.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A commit_495e30f :: coil [d=2026-05-15 ok]
  => "Cycle 3+4 closure-deepening: + verify/numerics_coil_fem.hexa (discretized on-axis Maxwell near-field, central-FD ∂B/∂z → analytic at O(h²); bone-decay + reciprocity) + verify/numerics_coil_fem_parity.hexa (vs exact Biot–Savart loop · TMS figure-8 · SQUID/OPM floor, g3/f1). RT-SC material claim still → hexa-rtsc. T2/T3 depth, NOT closure — F-AURA-2/2a/2b stay OPEN; green-gate deferred (run_all 19 unchanged); sat-1/STOP/100% code-layer 3-tier unchanged."
  |> "verify/numerics_fem_cross_pillar.hexa (coupled chain: RT-SC R=0 ⇒ safety thermal cap closes)"

@A commit_stageC :: coil [d=2026-05-15 ok]
  <- commit_495e30f
  => "Cycle 5 §A.6.1 stage C: + firmware/sim/coil_driver_sim.hexa — DAC→RL drive-chain sim (12-bit current DAC, µs write pulse, τ=4/200 Hz frame, ≤50 mW). Prototype of MCU firmware, NOT firmware; sim-only, no hardware-in-the-loop. ISOLATED in firmware/sim/ — not a verify/* script (not in run_all green core / lint / saturation). Firmware-sim layer NOT closure: F-AURA-2/2c stay OPEN; sat-1/STOP/100% code-layer 3-tier unchanged; T4 = §A.6."
