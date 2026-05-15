<!-- @canonical: hexa-aura/clip/doc/benchtop_v0_design.md — §A.6.1 stage A paper-design hardening -->
<!-- @authored: 2026-05-15 (hexa-aura Cycle 4) -->
---
domain: hexa-aura/clip
stage: A (paper-design hardening — §A.6.1)
rsc_able: false (docs-layer; not a verify/* script)
falsifier: F-AURA-1 / F-AURA-2 / F-AURA-4 (informs the BOM, does not close them)
---

# HEXA-AURA benchtop v0 — paper design (stage A, §A.6.1)

> **One sentence**: the first non-code artifact toward v2.0.0 — a **paper BOM +
> block diagram + interface table + safety spec** for a bench rig that would
> *test* (not deploy) the F-AURA-2 coil-field and F-AURA-4 thermal claims
> against a phantom skull, with **no in-vivo, no human, no implant**.
>
> **Status**: PAPER DESIGN ONLY. Nothing here is built, sourced, or funded.
> This is `.roadmap.hexa_aura §A.6.1 stage A` — the docs-layer pitch-deck
> precursor. It does **not** close F-AURA-1/2/4 (those stay OPEN); it does not
> change `saturation_check`, `falsifier_check`, or any `verify/*` result. T4
> (a built rig, measurements, IRB/FDA) is §A.6 steps 1–5, out of RSC scope.

---

## §0 n=6 anchor (carried from the pillars, not re-derived)

| Lattice quantity | Bench-rig projection |
|------------------|----------------------|
| φ(6) = 2         | 2 coil tiles on the rig arm (left/right mastoid emulation) |
| σ·n/10 = 3.6 g   | clip-arm mass target the structural mock must hold |
| sopfr(6) = 5 mm  | phantom temporal-bone slab thickness (skull-emulating) |
| τ(6) = 4         | 4 instrumentation lanes: B-probe · therm/IR · drive-DAC · watchdog-ADC |
| J₂ = 24          | ≤ 24 mm coil envelope; 24-channel macro readout fan |
| μ(6) = 1         | 1 μm coil litho pitch (fab spec, not bench-fabbed at v0) |
| φ/τ = 0.5 K      | ΔT ceiling the IR camera must resolve below |

The bench rig **measures whether** the n=6 design targets hold against a
phantom — it does not assume them.

---

## §1 BOM (paper — indicative classes, not sourced part numbers)

| # | Item | Class / spec | Maps to | Qty |
|---|------|--------------|---------|-----|
| 1 | Phantom skull slab | tissue-equiv ε_r/σ gel + 5 mm bone-equiv layer | sopfr=5 mm | 1 |
| 2 | Coil tile mock | planar PCB or e-beam test coupon, ~3 mm loop, N≈144 | F-AURA-2 | 2 |
| 3 | Coil driver | low-noise current source, ≤ 50 mW budget, µs pulse | F-AURA-2c | 1 |
| 4 | Field probe | fluxgate / OPM head OR calibrated pickup loop | F-AURA-2b | 1 |
| 5 | Thermal sensor | fibre-optic temp probes ×6 + IR camera (ΔT ≤ 0.5 K res) | F-AURA-4c | 1 set |
| 6 | Watchdog ADC | EEG-grade front-end, ≥ 1 kS/s, for the seizure-watchdog model | F-AURA-4d | 1 |
| 7 | Structural mock | Ti-6Al-4V or PEEK clip-arm coupon, τ=4 anchor points | F-AURA-1a/1b | 1 |
| 8 | Jaw-motion stage | 2.5 Hz actuator emulating chewing torque | F-AURA-1a | 1 |
| 9 | DAQ + host | multi-lane logger, time-synced, open-format export | all | 1 |

> No vendor/part numbers: per AGENTS.tape g3, external suppliers carry their own
> invariants — this BOM names *classes*, not a procurement list.

---

## §2 Block diagram (ASCII)

```
        ┌──────────────────────────────────────────────┐
        │              host + DAQ (lane sync)           │
        └───┬───────────┬───────────┬───────────┬───────┘
       drive│       B-probe│      thermal│     watchdog│   (τ=4 lanes)
        ┌───▼───┐   ┌──────▼──┐   ┌─────▼────┐   ┌─────▼────┐
        │ driver│   │ fluxgate│   │ FO temp  │   │ EEG ADC  │
        │ ≤50 mW│   │ /OPM    │   │ ×6 + IR  │   │ watchdog │
        └───┬───┘   └────▲────┘   └────▲─────┘   └────▲─────┘
            │ µs pulse   │ B(z)        │ ΔT          │ rhythm
        ┌───▼────────────┴─────────────┴─────────────┴───┐
        │   coil tile ×φ2  ──►  [ 5 mm phantom bone ]  ──►│  cortex-equiv gel
        │   (μ=1µm pitch, N≈144, ≤24 mm)                  │  (probe plane)
        └───────────────▲────────────────────────────────┘
                         │ τ=4-pt anchor on structural mock
                  ┌──────┴───────┐
                  │ jaw stage 2.5│  (F-AURA-1a chewing emulation)
                  └──────────────┘
```

---

## §3 Interface table

| Interface | From → To | Signal | Spec (paper) | Falsifier probed |
|-----------|-----------|--------|--------------|------------------|
| I1 | driver → coil | current pulse | ≤ 50 mW avg, µs, 200 Hz frame | F-AURA-2c |
| I2 | coil → phantom | B(z) field | through 5 mm bone-equiv | F-AURA-2a/2b |
| I3 | phantom → B-probe | residual field | fT–pT range, SNR > 5 | F-AURA-2b |
| I4 | coil/phantom → thermal | ΔT(t) | steady ΔT ≤ 0.5 K, ≤ 3·τ_th settle | F-AURA-4c |
| I5 | phantom → watchdog ADC | rhythm proxy | FAR ≤ 1 % @ clinical sens. | F-AURA-4d |
| I6 | jaw stage → mock | torque | 2.5 Hz, wobble < 3° | F-AURA-1a |
| I7 | all → host | time-synced log | open format, lane-aligned | all |

---

## §4 Safety spec (bench, not clinical)

- **No biological tissue, no animal, no human** at stage A/v0 — phantom only.
- Coil drive hard-capped at the §A.6 / pillar-4 budget (≤ 50 mW; ≤ φ=2 W/kg
  equivalent in the gel; ΔT ≤ φ/τ = 0.5 K) — the rig **trips** above cap.
- λ=2 redundant thermal cutoff (independent of the DAQ) and a hardware
  current limiter, mirroring the pillar-4 `λ=2` redundant-lane rule.
- All claims this rig could produce are **bench parity**, not clinical
  validation — they would feed §A.6 step 3 (sim/bench parity), never a
  medical-device claim.

---

## §5 What this is NOT (honest scope)

`benchtop_v0_design.md` is a **paper design**. It is not built, not sourced,
not funded, not scheduled. It does not:

- close F-AURA-1/2/3/4 or move any sub-ID off OPEN;
- change `verify/*` (`saturation_check` still emits
  `__HEXA_AURA_RSC_SATURATED__ STOP`; `falsifier_check` still 100 % code-layer
  with 15 sub-IDs OPEN; green-core run_all unchanged);
- constitute IRB/FDA/KFDA submission material.

It is the §A.6.1 **stage A** artifact — the docs-layer precursor to a funding
pitch. Stage B = the FEM-class `verify/numerics_*_fem*.hexa` rung (done,
Cycle 3–4). Stages C/D and §A.6 steps 1–5 (collab → fund → bench → in-vivo →
regulatory) remain unstarted and out of RSC code-layer scope.
