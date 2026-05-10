<!-- @canonical: hexa-aura/coil/doc/rt-sc-nanocoil.md — pillar 2 of 4 (coil / channel) -->
<!-- @authored: 2026-05-10 (hexa-aura v1.0.0) -->
---
domain: hexa-aura/coil
pillar: 2
pillar_name: HEXA-RT-SC-NANOCOIL
falsifier: F-AURA-2
requires:
  - to: mastoid-clip
  - to: cortical-interface
  - to: cortical-safety
crosslink:
  - hexa-rtsc (room-temperature superconductor — critical-current substrate)
---

<!-- @own(sections=[WHY, COMPARE, REQUIRES, STRUCT, FLOW, VERIFY, EVOLVE], strict=false, order=sequential, prefix="§") -->

# HEXA-RT-SC-NANOCOIL — room-temperature superconducting nano-coil tile (pillar 2/4)

> **One sentence**: the read/write transducer of the post-aural BCI is a
> **planar nano-coil tile** lithographed at μ=1 μm pitch from a
> room-temperature superconductor (RT-SC, supplied as a substrate claim by
> sister `hexa-rtsc`), carrying **σ²=144 bidirectional channels per tile** and
> **J₂=24 channels per macro-tile**, tiled to a **n^τ = 6⁴ = 1296-channel
> hexagonal cortical-column lattice** (Neuralink-N1 1024-ch parity·+), all
> inside the 3.6 g clip thermal budget. The coil *senses* cortical magnetic
> fields (MEG-class) on the read side and *induces* focal E-fields (TMS-class,
> but micro-targeted) on the write side — φ=2 directions per channel.
>
> **Falsifier**: F-AURA-2 (sub-IDs F-AURA-2a/2b/2c) — `.roadmap.hexa_aura §B.2`.
> Academically UNPROVEN at v1.0.0; verify/* PASS = lattice + parity arithmetic.

---

## §0 n=6 constants — coil pillar

```
  n = 6        σ(6) = 12      τ(6) = 4      φ(6) = 2      μ(6) = 1
  σ·φ = n·τ = J₂ = 24         σ² = 144      σ³ = 1728     n^τ = 6⁴ = 1296
  sopfr(6) = 5                σ - φ = 10
```

| Lattice quantity   | Coil projection |
|--------------------|-----------------|
| μ(6) = 1           | 1 μm nano-coil lithography pitch (loop-to-loop) |
| σ²(6) = 144        | 144 bidirectional channels / tile (σ=12 rows × σ=12 cols micro-grid) |
| J₂ = 24            | 24 channels / macro-tile (σ·φ = n·τ = J₂); a macro-tile = 6 micro-tiles read-multiplexed |
| n^τ = 6⁴ = 1296    | 1296-channel hexagonal cortical-column lattice (Neuralink-N1 1024-ch parity·+) |
| σ³(6) = 1728       | 1728-electrode-equivalent virtual array (super-resolution beamforming across tiles) |
| τ(6) = 4           | 4 multiplex phases per read frame (sense-A · sense-B · null · calibrate) |
| φ(6) = 2           | φ=2 directions per channel (read = pick-up loop / write = drive loop, time-shared) |
| sopfr(6) = 5       | designed for ≤ 5 mm bone path; ≤ 5 ms read-frame period |
| σ - φ = 10         | write-gradient design target ≈ 10 V/m·mm focal contrast vs background |

Full-head array: tile the 1296-ch hex lattice across both clips (φ=2) and over
the σ=12 cortical zones → **σ⁴-class ≈ 1.44 M** addressable channels
(σ² × σ² = 144 × 144·... headline "1.44 M ch" in the atlas docs; the *tile*
unit is the load-bearing number — 144 ch/tile, J₂=24 ch/macro-tile).

---

## §1 WHY (how the coil changes your life)

Every existing brain interface forces a trade you can feel: invasive arrays
(Utah, Neuralink) get high channel counts but need a craniotomy and degrade in
1–2 years; non-invasive options (EEG, MEG, TMS) avoid surgery but are either
low-bandwidth (scalp EEG) or room-sized and unfocused (MEG dewar, TMS figure-8
coil ≈ 70 mm). The coil is the piece that's supposed to break that trade:
**superconducting → high SNR at low power; nano-litho → focal; room-temperature
→ fits in 3.6 g with no cryostat.**

Once the transducer's geometry is fixed by n=6 (μ=1 μm pitch, σ²=144 ch/tile,
1296-ch hex lattice), three wastes may collapse:

1. **Channel-count vs invasiveness** — σ²=144 ch/tile, tiled to 1296 ch (then
   1.44 M full-head), with **zero implanted material** (the coil sits in the
   clip, μ=1 mm off the skin) ← σ²=144, n^τ=1296 ← OEIS A000203
2. **Power vs sensitivity** — an RT-SC pick-up loop has ~zero resistive loss,
   so it reaches MEG-class field sensitivity (fT-class) on a ~mW budget
   instead of a cryocooler ← τ(6)=4 multiplex phases keep the duty cycle low
   ← OEIS A000005
3. **Focus vs reach** — μ=1 μm pitch + σ³=1728-equivalent beamforming across
   tiles gives a write spot ≈ a cortical column wide, vs TMS's centimeter blob
   ← φ(6)=2, σ - φ = 10 ← OEIS A000010

| Effect | Current best (non-invasive) | After HEXA-RT-SC-NANOCOIL | Perceived change |
|--------|------------------------------|----------------------------|------------------|
| channels (non-invasive) | ≈ 256 (high-density EEG) | σ²=144/tile → 1296/head → 1.44 M | bandwidth of an implant, no surgery |
| read field sensitivity | OPM-MEG ≈ 15 fT/√Hz | RT-SC pick-up ≈ SQUID-class (few fT/√Hz), portable | MEG in a clip |
| write spatial focus | TMS figure-8 ≈ 1–2 cm | nano-litho beamformed ≈ 1 cortical column | "write to *this* neuron group" |
| operating temperature | SQUID ≈ 4 K (liquid He) | RT-SC ≈ ambient | no cryostat → wearable |
| power (read) | OPM-MEG ≈ W/sensor | RT-SC ≈ mW (τ=4 duty cycle) | days on a 0.6 g cell |
| lifetime | invasive arrays 1–2 yr | external coil, τ=4-layer coating → φ·σ = 24 yr | fit once |
| latency | MEG ≈ ms; TMS ≈ ms | sopfr=5 ms read frame, closed-loop | feels instantaneous |

**One-sentence summary**: a μ=1 μm-pitch RT-SC nano-coil tile carrying σ²=144
bidirectional channels gets implant-class bandwidth and MEG-class read
sensitivity at mW power and ambient temperature — which is the only reason the
whole thing fits in a 3.6 g hidden clip.

---

## §2 COMPARE (baselines this pillar is measured against)

`verify/numerics_coil_parity.hexa` compares the coil's channel count, claimed
field sensitivity and write-gradient targets against **published** systems:

| Reference                               | Channels / sensors | Read sens. or write field         | Form factor / temp | Relevance to F-AURA-2 |
|-----------------------------------------|--------------------|------------------------------------|--------------------|------------------------|
| SQUID-MEG (e.g. MEGIN TRIUX)            | ≈ 306 sensors      | ≈ 2–3 fT/√Hz                       | room-sized dewar, 4 K | the read sensitivity bar the RT-SC pick-up loop must approach |
| OPM-MEG (QuSpin zero-field magnetometer)| ≈ 1 per unit; arrays ~50–100 | ≈ 7–15 fT/√Hz             | thimble, ~150 °C cell, W/unit | the *wearable* MEG bar; RT-SC must beat its power, match its sensitivity |
| TMS figure-8 coil (Magstim/MagVenture)  | 1 (one focal spot) | ≈ 1–2 T at coil face, ≈ 70–150 V/m induced in cortex | benchtop, ~70 mm outer | the write-side E-field bar; RT-SC must reach a *micro-focal* version |
| Neuralink N1                            | 1024 (64 thr × 16) | electrical µV-class, invasive       | implanted coin, ambient | the invasive channel-count bar; n^τ=1296 is parity·+ |
| Utah array (BrainGate)                  | 96–100             | electrical, invasive                | 4×4 mm bed of needles | the classic invasive bar; degrades 1–2 yr |
| Synchron Stentrode                      | 16                 | endovascular electrical             | stent in sup. sagittal sinus | the "minimally invasive" bar; RT-SC is *non*-invasive |
| Argus II / Orion (visual prosthesis)    | 60                 | epiretinal / cortical electrical    | implanted             | sets the bandwidth pillar 3 must exceed for AR-glass parity |

**Honest gaps** (all OPEN):
- F-AURA-2a: no RT-SC nano-coil tile has been shown to produce a *micro-focal*
  (column-scale) write E-field; TMS does it at cm scale. `numerics_coil.hexa`
  checks the *beamforming arithmetic* (array factor of σ³=1728 equivalent
  elements at μ=1 μm pitch), not a measured field map.
- F-AURA-2b: no room-temperature pick-up loop has been shown to reach SQUID
  fT/√Hz sensitivity *through 5 mm of bone*. `numerics_coil_parity.hexa`
  compares to OPM/SQUID *published* noise floors; the through-bone term is a
  modelled attenuation, not data.
- F-AURA-2c: the switching-power → ΔT chain is owned by pillar 4
  (`cortical-safety`); this pillar exports the dissipation number, pillar 4
  checks it against ΔT ≤ φ/τ = 0.5 K.

---

## §3 REQUIRES

| Requires                         | From                          | Why |
|----------------------------------|-------------------------------|-----|
| RT-SC material with high J_c at ambient | sister `hexa-rtsc`       | zero-loss loops at room temperature is the enabling claim; if `hexa-rtsc` is wrong, F-AURA-2 falls |
| 3.6 g mass + power + venting budget | pillar 1 (`mastoid-clip`)   | the tile + driver must fit 1.2 g + 1.2 g of the clip; dissipation must vent through the shell |
| ΔT ≤ 0.5 K, SAR ≤ 2 W/kg, charge-density ≤ Shannon k≤1.5 | pillar 4 (`cortical-safety`) | the write field is *capped* by safety, not by physics — the coil must hit targets *under* the cap |
| cortical target geometry (zone map, column scale) | pillar 3 (`cortical-interface`) | beamforming aim points; column ≈ 0.5 mm sets the focal-spot spec |
| litho process at μ=1 μm pitch     | (own / standard MEMS fab)     | the nano-coil grid is a planar multilayer thin-film stack |

---

## §4 STRUCT (the tile, layer by layer)

```
   ── skin side (μ=1 mm clearance, no contact) ──
   ┌──────────────────────────────────────────────┐
   │ biocompatible coating  (τ=4 layers — pillar 4)│
   ├──────────────────────────────────────────────┤
   │ RT-SC drive layer    — write loops, μ=1 μm pitch│  φ=2 (write)
   ├──────────────────────────────────────────────┤
   │ RT-SC pick-up layer  — read loops, μ=1 μm pitch│  φ=2 (read)
   │   σ=12 rows × σ=12 cols = σ² = 144 channels   │
   ├──────────────────────────────────────────────┤
   │ gradiometer / null layer (τ=4 phase: null)    │  common-mode rejection
   ├──────────────────────────────────────────────┤
   │ interconnect + mux ASIC (J₂=24 ch/macro-tile) │  6 micro-tiles → 1 macro
   ├──────────────────────────────────────────────┤
   │ ground plane / EM shield                       │
   └──────────────────────────────────────────────┘
   ── clip-interior side (to driver + radio + MCU) ──

   Tiling:  6 micro-tiles → 1 macro-tile (J₂=24 multiplexed ch)
            n^τ = 6⁴ = 1296 ch  per cortical-column lattice per clip
            σ=12 zones × φ=2 clips → ≈ σ⁴-class 1.44 M ch full head
```

- **Read path** — superconducting pick-up loops sense the µT→fT cortical
  magnetic field (the magnetic counterpart of the µV LFP). Zero loop
  resistance → Johnson-Nyquist noise floor is set by the readout SQUID/SQIF
  stage, not the loop → SQUID-class sensitivity *at room temperature*.
- **Write path** — drive loops carry a pulsed current; superposed across the
  σ³=1728-equivalent array they synthesize a focal ∂B/∂t, which by Faraday
  induces a focal E-field ≈ a cortical column wide. The E-field amplitude is
  *capped by pillar 4*, well below seizure threshold; the *focus* is the new
  thing vs TMS, not the strength.
- **Multiplex (τ=4 phases)** — sense-A · sense-B · null · calibrate, ≤ sopfr=5 ms
  per full frame → 200 Hz read rate, fast enough for closed-loop.
- **Macro-tiling (J₂=24)** — 6 micro-tiles share one mux ASIC and report 24
  channels upstream per macro-tile; this is where σ·φ = n·τ = J₂ shows up in
  the data plane, not just the arithmetic.

---

## §5 FLOW (one closed-loop cycle)

```
  t=0      drive layer fires write pulse (E-field capped by pillar 4)
   │       ── settle ──
  τ/4      pick-up layer reads cortical response  (sense-A)
   │
  2τ/4     pick-up layer reads again              (sense-B)  → motion/artifact reject
   │
  3τ/4     null layer reads ambient               (null)     → common-mode subtract
   │
  4τ/4 = sopfr ms   calibrate loop self-checks    (calibrate)→ drift correction
   │
  decode (≤ sopfr ms total, pillar 3) → next write target
   └──────────────────────────────────────────────────────► loop
```

- The write pulse and the read window are **time-shared on the φ=2 loop set**
  — never both energized → bounds peak dissipation (pillar 4).
- If `calibrate` detects loop drift beyond μ=1 % → drop the affected micro-tile
  from the macro-tile (graceful degradation: 6 → 5 micro-tiles, 144 → 120 ch).

---

## §6 VERIFY (what `verify/*.hexa` checks here)

| Tier | Script                          | Checks |
|------|---------------------------------|--------|
| T1   | `verify/calc_coil.hexa`         | σ²=144 = σ·σ; J₂=24 = σ·φ = n·τ; n^τ=1296 = 6⁴; σ³=1728; 6 micro-tiles → 1 macro-tile (6×... = 144 ch reported as 24/macro after read-mux); μ=1 μm pitch; τ=4 multiplex phases ≤ sopfr=5 ms — pure integer arithmetic |
| T2   | `verify/numerics_coil.hexa`     | math_pure re-derivation: array factor of an N=σ³=1728-equivalent uniform line/grid array at μ=1 μm pitch → main-lobe width ≈ column scale; pick-up loop SNR ≈ Φ_signal / Φ_noise with zero loop resistance → SQUID-stage-limited; through-5mm-bone attenuation factor bounded; read frame 200 Hz from 1/(sopfr ms) |
| T3   | `verify/numerics_coil_parity.hexa` | parity vs published: SQUID-MEG ≈ 2–3 fT/√Hz, OPM-MEG ≈ 7–15 fT/√Hz (the read bar); TMS figure-8 ≈ 70–150 V/m cortical induced field, ≈ 70 mm coil (the write bar — RT-SC aims a micro-focal version *below* this amplitude); Neuralink N1 1024 ch, Utah 96 ch, Stentrode 16 ch (channel-count parity → 1296 is parity·+); Argus II / Orion 60 electrodes (the bar pillar 3 must clear) |

`verify/cross_doc_audit.hexa` checks the 144 / 24 / 1296 / 1728 tokens here
match `clip` (budget), `cortex` (uses the channels), `safety` (caps the write
field), and `.roadmap.hexa_aura §A.1`.

**Not verified** (raw#10 C3): a fabricated RT-SC tile; a measured through-bone
field map; the RT-SC material itself (deferred to `hexa-rtsc`); biocompatibility
of the coating (pillar 4 + clinical). Those are §A.6 Stage-1+.

---

## §7 EVOLVE

- **v1.1.0** — `hexa-rtsc` cross-verify: import its critical-current-density
  datasheet and re-run `numerics_coil.hexa` with the real J_c instead of the
  arithmetic placeholder (T2 → live-data boundary).
- **v1.2.0** — `numerics_coil_fem.hexa` (§A.6.1 stage B): FEMM/SimNIBS-class
  coil-field FEM parity for the write side, and a Johnson-Nyquist + SQIF
  readout-chain noise model for the read side.
- **Stage-1+ (§A.6)** — fab a single μ=1 μm-pitch micro-tile (144 ch) on a
  standard MEMS line; characterize loop Q, SNR vs frequency, and write
  beamforming on a saline phantom, then a skull phantom.
- The **σ³=1728-equivalent virtual array** (super-resolution beamforming
  across physical tiles) is the headline upside lever; its proof is a measured
  point-spread function on the phantom rig — pure RSC can only check the array
  factor *arithmetic*.

---

## §8 Honest scope (raw#10 C3)

`HEXA-RT-SC-NANOCOIL` is a **transducer design spec**: the geometry (μ=1 μm
pitch), the channel topology (σ²=144 ch/tile, J₂=24 ch/macro-tile, 1296-ch hex
lattice, σ³=1728-equivalent beamforming), the read principle (zero-resistance
superconducting pick-up → SQUID-class sensitivity at ambient temperature) and
the write principle (focal Faraday E-field, *capped by pillar 4*). It does
**not** demonstrate: a built tile, a measured field map, the RT-SC material
(see `hexa-rtsc`), through-bone coupling, coating biocompatibility, or any
clearance. `verify/calc_coil.hexa` + `numerics_coil.hexa` +
`numerics_coil_parity.hexa` PASS = the *channel arithmetic closes, the array
factor gives a column-scale main lobe, and the sensitivity/field targets sit
relative to published MEG/TMS/implant numbers as claimed* — nothing more.

F-AURA-2 (2a/2b/2c) remains **OPEN**. If `hexa-rtsc` is falsified, F-AURA-2
is **DEMOTED** (no ambient-SC → cryostat → does not fit 3.6 g).
