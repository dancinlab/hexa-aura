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
# SAFETY.log.tape — append-only event history (v1.2 split)
# Sibling: SAFETY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A commit_495e30f :: safety [d=2026-05-15 ok]
  => "Cycle 3+4 closure-deepening: + verify/numerics_safety_fem.hexa (discretized 1D Pennes operator residual on ΔT0·exp(−r/L_th) → 0 at O(h²); ΔT0 ≤ φ/τ=0.5 K cap) + verify/numerics_safety_fem_parity.hexa (vs Pennes-1948 · brain k · perfused-tissue L_th · CEM43/ICNIRP, g3/f1 parity-or-safer). T2/T3 depth, NOT closure — F-AURA-4/4b/4c stay OPEN; green-gate deferred (run_all 19 unchanged); sat-1/STOP/100% code-layer 3-tier unchanged. T4 (SAR/thermal/regulatory) still §A.6, out of scope."
  |> "verify/numerics_fem_cross_pillar.hexa (coupled chain: SAR_design ⇒ Pennes ΔT_ss ≤ 0.5 K)"

@A commit_stageC :: safety [d=2026-05-15 ok]
  <- commit_495e30f
  => "Cycle 5 §A.6.1 stage C: + firmware/sim/watchdog_adc_sim.hexa — EEG-watchdog ADC→detector sim (16-bit ADC ≥1 kS/s, sliding-window energy detector, deterministic synthetic burst, μ=1→1% FAR floor, λ=2 redundant lanes). Prototype of MCU watchdog firmware, NOT firmware; sim-only. ISOLATED in firmware/sim/ — not a verify/* script. Firmware-sim layer NOT closure: F-AURA-4/4d stay OPEN; sat-1/STOP/100% code-layer 3-tier unchanged; T4 (real-EEG ROC) = §A.6."
