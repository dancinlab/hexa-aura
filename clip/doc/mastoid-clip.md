<!-- @canonical: hexa-aura/clip/doc/mastoid-clip.md — pillar 1 of 4 (form-factor) -->
<!-- @authored: 2026-05-10 (hexa-aura v1.0.0) -->
---
domain: hexa-aura/clip
pillar: 1
pillar_name: HEXA-MASTOID-CLIP
falsifier: F-AURA-1
requires:
  - to: rt-sc-nanocoil
  - to: cortical-safety
---

<!-- @own(sections=[WHY, COMPARE, REQUIRES, STRUCT, FLOW, VERIFY, EVOLVE], strict=false, order=sequential, prefix="§") -->

# HEXA-MASTOID-CLIP — 측두골 유양돌기 클립 form-factor (pillar 1/4)

> **One sentence**: a **behind-the-ear (BTE) clip pair** anchored on the
> mastoid process of the temporal bone — φ=2 clips, each σ·n/10 = **3.6 g**
> (pair n·n/10 = **7.2 g**, AirPods-Pro 5.4 g class) — that hides under hair
> (외관 변화 0), uses a sopfr=5 mm temporal-bone window for the coil, and
> carries a τ=4-point passive anchor + bone-conduction back-channel. This is
> the *form-factor* substrate only — the coil (pillar 2), cortical I/O
> (pillar 3) and safety envelope (pillar 4) sit inside it.
>
> **Falsifier**: F-AURA-1 (and sub-IDs F-AURA-1a/1b/1c) — see `.roadmap.hexa_aura §B.1`.
> Academically UNPROVEN at v1.0.0; verify/* PASS = lattice + parity arithmetic, not a built clip.

---

## §0 n=6 constants — clip pillar

```
  n = 6        σ(6) = 12      τ(6) = 4      φ(6) = 2
  sopfr(6) = 2 + 3 = 5        μ(6) = 1      J₂ = 24
  σ·φ = n·τ = J₂ = 24         σ - φ = 10    σ·n/10 = 3.6
```

| Lattice quantity | Clip projection                                              |
|------------------|--------------------------------------------------------------|
| φ(6) = 2         | 2 clips — left + right mastoid (bilateral cortex coverage)   |
| σ·n/10 = 3.6     | 3.6 g per clip → n·n/10 = 7.2 g pair                          |
| sopfr(6) = 5     | ≤ 5 mm temporal-bone thickness window (mastoid air-cells avoid) |
| τ(6) = 4         | τ=4-point anchor: helix root · mastoid tip · ear-canal entry · concha cymba |
| n = 6            | 6 contact pads / clip (3 anchor + 2 bone-conduction + 1 reference) |
| J₂ = 24          | clip outer envelope ≤ 24 mm major axis (within glasses-arm width) |
| σ - φ = 10       | 10× wearable-count reduction is *carried* by this form-factor (18 → ≈ 0) |
| μ(6) = 1         | 1 mm clearance from skin (no implanted component, external-only) |

---

## §1 WHY (how this form-factor changes your life)

Today a person who wants AR + audio + health + assistive function wears,
charges and loses a *stack* of devices: AR glasses, earbuds, smartwatch,
ring, sleep tracker, plus — for the assistive population — exoskeleton,
myoelectric prosthetic, e-skin sleeve, cochlear processor, retinal-implant
goggles. The form-factor of each is a separate compromise: a separate
clasp, a separate battery, a separate place on the body that you have to
remember and that other people can see.

**Once the boundary of "where the device lives" is fixed by n=6 arithmetic
to the mastoid window**, three kinds of waste may collapse:

1. **Device-count collapse** — one φ=2 clip pair instead of 18 separately
   worn things ← σ - φ = 10 → 18/10 ≈ 1 worn object class ← OEIS A000203
2. **Visibility collapse** — the clip sits in the retro-auricular sulcus and
   under hair: σ²=144 contact micro-pads on a J₂≤24 mm envelope, *zero*
   change to face/silhouette ← σ(6)=12, J₂=24 ← OEIS A000005
3. **Anchor-failure collapse** — a τ=4-point passive anchor (no glue, no
   surgery) holding 3.6 g against chewing/jaw motion turns "did it fall
   out?" into a non-event ← τ(6)=4, φ(6)=2 ← OEIS A000010

| Effect | Current | After HEXA-MASTOID-CLIP | Perceived change |
|--------|---------|--------------------------|------------------|
| worn-device count | 18 (assistive max) | φ=2 (1 clip pair) | nothing to lose / charge separately |
| mass on head | ≈ 50–150 g (glasses + earbuds + …) | n·n/10 = 7.2 g pair | "I forgot I'm wearing it" |
| visible footprint | obvious (glasses frame, earbuds) | hair-hidden, J₂≤24 mm | no social signalling |
| placement window | ad-hoc | sopfr=5 mm mastoid bone | one fitting, no drift |
| anchor robustness | falls out / slips | τ=4-point passive | survives chewing, sleep, exercise |
| battery topology | 18 separate cells | φ=2 cells, 1/2+1/3+1/6 Egyptian draw | one charge cadence |
| surgery required | implants need craniotomy | **zero** (external-only, μ=1 mm skin clearance) | outpatient fitting |

**One-sentence summary**: fixing the device's home to the sopfr=5 mm mastoid
window and its mass to σ·n/10 = 3.6 g/side collapses an 18-device stack into
one φ=2 clip pair that nobody can see and nothing makes you charge twice.

### Everyday perceived scenarios

```
  morning   — clip the φ=2 pair on (helix-root snap), brush hair over → invisible
  commute   — A1 audio injection (pillar 3) replaces earbuds; nothing in your ears
  work      — V1~V6 overlay replaces AR glasses; bare face on video calls
  workout   — τ=4 anchor holds; sweat-proof (no skin-contact electronics)
  sleep     — "sleep" operating mode (pillar 3 τ=4); HRV/EEG from S1/M1 relay
  evening   — drop on the φ=2 charging dock; 1/2+1/3+1/6 Egyptian power budget tops up
```

---

## §2 COMPARE (baselines this form-factor is measured against)

The clip pillar's T3 parity (`verify/numerics_clip_parity.hexa`) compares the
3.6 g/side budget and the BTE-anchor concept against **published, shipping**
ear-region wearables — not against fiction:

| Reference device                  | Mass (one side)   | Region            | Anchor type            | Relevance to F-AURA-1 |
|-----------------------------------|-------------------|-------------------|------------------------|------------------------|
| BTE digital hearing aid (typ.)    | ≈ 2.5–4 g         | retro-auricular   | over-the-ear hook + dome | mass + density envelope (pillar fits at hearing-aid density) |
| Shokz / AfterShokz bone-conduction | ≈ 26 g (full headset) | temporal/cheekbone | wrap-around band       | bone-conduction transducer feasibility, contact pressure |
| Apple AirPods Pro (2nd gen)       | ≈ 5.3 g (each bud) | ear canal         | silicone tip friction  | "barely-felt" mass target; n·n/10 = 7.2 g pair beats it |
| Eyeglass temple arm (titanium)    | ≈ 3–6 g (arm)     | over-ear → mastoid | sprung temple tip      | the clip lives where the temple tip already presses |
| Cochlear Nucleus 7 sound proc.    | ≈ 9 g             | retro-auricular   | magnet (to implant)    | upper-bound BTE mass that users tolerate all-day |
| Google Glass (Explorer)           | ≈ 36–42 g         | head-worn frame   | nose + ear             | visibility / social-signal failure mode the clip avoids |

Anchor points (τ=4): the mastoid process, the root of the helix, the entrance
to the ear canal, and the cymba conchae are all *bony or cartilage-backed*
landmarks — the same four that eyeglass temples + BTE hooks already exploit.

**Honest gap**: none of these reference devices puts an RT-SC coil + driver +
radio + battery into 3.6 g. F-AURA-1b stays OPEN until a density/BOM budget
that fits is demonstrated — `numerics_clip.hexa` checks the budget *arithmetic*
(mass split across coil/PCB/cell/shell), not a built BOM.

---

## §3 REQUIRES (what the clip pillar consumes from siblings)

| Requires             | From                         | Why |
|----------------------|------------------------------|-----|
| RT-SC coil tile mass + power envelope | pillar 2 (`rt-sc-nanocoil`) → also `hexa-rtsc` | the 3.6 g split must hold the coil; coil thermal output sets shell venting |
| safe contact pressure / heating limits | pillar 4 (`cortical-safety`) | anchor pressure ≤ capillary-occlusion threshold; ΔT ≤ φ/τ = 0.5 K at skin |
| cortical target geometry | pillar 3 (`cortical-interface`) | mastoid window must line up with A1/S1 relay paths through the bone |
| RT-SC ambient-operation claim | sister `hexa-rtsc` | the coil being room-temperature is what lets it live in 3.6 g (no cryostat) |
| bone-conduction back-channel | this pillar (own) | hair-hidden devices can't use a skin-contact mic/speaker → bone path |

---

## §4 STRUCT (the clip, anatomically)

```
                    helix root snap (anchor 1/4)
                         │
        ┌────────────────┴───────────────┐
        │  HEXA clip body  (J₂ ≤ 24 mm)   │  ← hides in retro-auricular sulcus
        │  ┌───────────┐  ┌────────────┐  │     under hair (visibility 0)
        │  │ RT-SC coil │  │ driver +   │  │
        │  │ tile σ²=144│  │ radio + MCU│  │  ← pillar 2 lives here
        │  └───────────┘  └────────────┘  │
        │  ┌───────────┐  ┌────────────┐  │
        │  │ φ=2 Li cell│  │ EEG-watch- │  │  ← pillar 4 watchdog lives here
        │  │ Egyptian   │  │ dog ASIC   │  │
        │  └───────────┘  └────────────┘  │
        └──┬──────────┬─────────┬─────────┘
           │          │         │
   mastoid tip   ear-canal   cymba conchae
   (anchor 2/4)  entrance    (anchor 4/4)
                 (anchor 3/4)
                      │
              bone-conduction back-channel
              (vibrates the temporal bone — no skin-contact speaker)
```

- **Mass budget (σ·n/10 = 3.6 g/side, arithmetic split — checked by `calc_clip` / `numerics_clip`)**:

  | Component             | Share (Egyptian-fraction style) | Mass    |
  |-----------------------|---------------------------------|---------|
  | RT-SC coil tile + leads | 1/3 of 3.6 g                  | 1.2 g   |
  | driver + radio + MCU + watchdog ASIC | 1/3 of 3.6 g     | 1.2 g   |
  | φ=2 Li cell           | 1/6 of 3.6 g                    | 0.6 g   |
  | shell + anchor springs + bone-conduction transducer | 1/6 of 3.6 g | 0.6 g |
  | **total / clip**      | 1/3 + 1/3 + 1/6 + 1/6 = 1       | **3.6 g** |
  | **total / pair (φ=2)**|                                 | **7.2 g** |

  (1/3 + 1/3 + 1/6 + 1/6 = 1 — a 4-term unit partition; the canonical n=6
  Egyptian fraction 1/2 + 1/3 + 1/6 = 1 is used by pillar 4 for the *power*
  budget. Both are exact unit decompositions.)

- **Bone window (sopfr = 5 mm)**: the squamous part of the temporal bone over
  the auditory cortex is ≈ 2–4 mm; the mastoid is thicker but air-celled. The
  coil targets a sopfr=5 mm *maximum* path so the field-attenuation budget
  (pillar 2) is bounded.

- **Anchor (τ = 4 points)**: passive sprung contacts, no adhesive, no
  piercing. Pressure target ≤ 20 mmHg (below capillary-occlusion ≈ 32 mmHg)
  so it can be worn continuously without pressure necrosis (pillar 4 owns
  this limit).

---

## §5 FLOW (a day, as state transitions)

```
  [off, in dock] --clip on, helix-root snap--> [τ=4 anchor seated]
       │                                              │
       │                                  self-test: 4/4 anchor contacts OK?
       │                                              │ yes
       ▼                                              ▼
  [Egyptian power top-up]                     [armed: pillar 2 coil idle,
                                               pillar 4 watchdog live]
                                                      │
        ┌─────────────┬───────────────┬───────────────┤
        ▼             ▼               ▼               ▼
   sense mode    inject mode      sync mode       sleep mode
   (read cortex) (write cortex)   (cloud uplink)  (low-power, EEG/HRV only)
        │             │               │               │
        └─────────────┴───────────────┴───────────────┘
                          τ=4 operating modes (pillar 3 owns the cortical side;
                          this pillar owns the *power/anchor* state machine)
```

- The clip never holds two of {inject, sync} in the high-power state at once
  (φ=2 power rails, one heavy load at a time) — bounds peak ΔT (pillar 4).
- Loss of any anchor contact → drop to `sleep` + bone-conduction "reseat me"
  prompt; loss of ≥ 2 → full off (fail-safe, pillar 4 invariant).

---

## §6 VERIFY (what `verify/*.hexa` actually checks for this pillar)

| Tier | Script                         | Checks |
|------|--------------------------------|--------|
| T1   | `verify/calc_clip.hexa`        | mass split 1/3+1/3+1/6+1/6 = 1; 3.6 g = σ·n/10; 7.2 g = n·n/10; J₂≤24 mm envelope; τ=4 anchor points; sopfr=5 mm window — all integer/exact-fraction arithmetic |
| T2   | `verify/numerics_clip.hexa`    | math_pure re-derivation: pair mass vs AirPods-Pro class (7.2 g < 2×5.3 g? no — but within "barely felt" band 5–12 g); contact pressure ≤ 20 mmHg < 32 mmHg capillary-occlusion; bone-conduction transmission loss bounded |
| T3   | `verify/numerics_clip_parity.hexa` | parity vs published BTE-hearing-aid (2.5–4 g) / Shokz bone-conduction / AirPods-Pro / eyeglass-temple / Cochlear-Nucleus-7 / Google-Glass mass + anchor data — the 3.6 g target sits inside the all-day-tolerable BTE mass band; the τ=4 anchor reuses landmarks glasses+BTE already use |

`verify/cross_doc_audit.hexa` additionally checks that the 3.6 g / 7.2 g /
sopfr=5 mm / J₂≤24 mm tokens here agree with the same tokens in `coil` (which
must *fit* in the budget) and `safety` (which owns the pressure/heat limits).

of the bone-conduction channel; long-term skin tolerance; FCC/CE radio
certification. Those are §A.6 Stage-1+.

---

## §7 EVOLVE (where this pillar goes after v1.0.0)

- **v1.1.0** — `clip/doc/benchtop_v0_design.md`: full BOM (coil vendor part /
  PCB stack-up / cell chemistry / shell material), block diagram, the
  interface table to pillars 2/3/4, and the safety spec (§A.6.1 stage A).
- **v1.2.0** — anthropometric fitting study spec (mastoid geometry distribution
  across head sizes → 3 clip-shell sizes covering σ=12 percentile bins).
- **Stage-1+ (§A.6)** — phantom-skull rig: 3D-printed temporal-bone phantom
  with the sopfr=5 mm window, mechanical anchor-pressure measurement, drop
  test, sweat test. Then cadaver-skull, then NHP, then first-in-human.
- **Cross-link maturation** — once `hexa-rtsc` publishes a coil-tile mass +
  power datasheet, `numerics_clip.hexa` swaps the *arithmetic* coil budget for
  the real one (parity → live data, T3 → T4 boundary).

---


`HEXA-MASTOID-CLIP` is a **form-factor design spec**. It defines *where* the
post-aural BCI lives, *how heavy* it is, *how it stays on*, and *how it stays
invisible* — all pinned to n=6 arithmetic. It does **not** demonstrate: a
built clip, the coil's actual coupling efficiency through bone (pillar 2 +
`hexa-rtsc`), the cortical write/read bandwidth (pillar 3 + `hexa-brain`),
the safety envelope under continuous wear (pillar 4 + clinical study), or any
regulatory clearance. `verify/calc_clip.hexa` + `numerics_clip.hexa` +
`numerics_clip_parity.hexa` PASS = the *budget arithmetic closes and the mass
target sits inside the published all-day-wearable band* — nothing more.

F-AURA-1 (1a/1b/1c) remains **OPEN**.
