# ✨ hexa-aura — substrate SSOT INDEX

> 4 pillar substrate (clip · coil · cortex · safety) + 5-doc atlas + 19-script RSC verify surface. **n=6 invariant lattice** `σ(6)·φ(6) = n·τ(6) = J₂ = 24`. Sister of `hexa-cern` · `hexa-rtsc` · `hexa-bio` · `hexa-chip` · `hexa-ufo` under `dancinlab/echoes` parent. (2026-05-15)

## 🟢 핵심 9 tape (root, v1.2 architecture-vs-log split)

| Tape | 한 줄 설명 |
|------|-----------|
| 🛡️ **AGENTS.tape** | governance SSOT — `g_inherit/g1/g2/g3/g4/g_arch_vs_log_split` · `f1` 외부엔티티 격자-fit 금지 · `CLAUDE.md` symlink |
| 📥 **IMPORTED_FROM_CANON.tape** | canon@a86ca143 에서 이동된 5-doc atlas 출처 추적 (+ `.md` sibling) |
| 📝 **TODO.tape** | 잔여 작업 + v1.1.0+ 로드맵 (+ `.md` sibling) |
| 🧷 **CLIP.tape** + **CLIP.log.tape** | pillar 1/4 — HEXA-MASTOID-CLIP form-factor (F-AURA-1, 3 sub-ID) |
| 🌀 **COIL.tape** + **COIL.log.tape** | pillar 2/4 — HEXA-RT-SC-NANOCOIL transducer (F-AURA-2, 3 sub-ID) · hexa-rtsc 의존 |
| 🧠 **CORTEX.tape** + **CORTEX.log.tape** | pillar 3/4 — HEXA-CORTICAL-IF direct I/O (F-AURA-3, 4 sub-ID) · hexa-brain 교차검증 |
| 🛡️ **SAFETY.tape** + **SAFETY.log.tape** | pillar 4/4 — HEXA-CORTICAL-SAFETY cap (F-AURA-4, 5 sub-ID) |

## 🧭 4 pillar split — substrate domain decomposition

| # | Pillar | Spec | Falsifier | T1 / T2 / T3 ladder | CLI |
|--|--|--|--|--|--|
| 1 | **clip** (form-factor) | `clip/doc/mastoid-clip.md` | F-AURA-1 (1a/1b/1c) | `calc_clip` · `numerics_clip` · `numerics_clip_parity` (+`_solver`) | `hexa-aura clip` |
| 2 | **coil** (transducer) | `coil/doc/rt-sc-nanocoil.md` | F-AURA-2 (2a/2b/2c) | `calc_coil` · `numerics_coil` · `numerics_coil_parity` (+`_solver`) | `hexa-aura coil` |
| 3 | **cortex** (I/O) | `cortex/doc/cortical-interface.md` | F-AURA-3 (3a/3b/3c/3d) | `calc_cortex` · `numerics_cortex` · `numerics_cortex_parity` (+`_solver`) | `hexa-aura cortex` |
| 4 | **safety** (cap) | `safety/doc/cortical-safety.md` | F-AURA-4 (4a/4b/4c/4d/4e) | `calc_safety` · `numerics_safety` · `numerics_safety_parity` (+`_solver`) | `hexa-aura safety` |

총 **4 top-level / 15 sub-ID falsifier · 모두 OPEN · 코드-layer 폐쇄 100%** (T4 in-vivo·임상·FDA = `.roadmap.hexa_aura §A.6`, 미착수).

## 📐 n=6 lattice projection (substrate 차원)

```
σ(6) · φ(6) = n · τ(6) = J₂ = 24
   12   ·   2  =  6  ·   4  = 24
sopfr(6) = 2 + 3 = 5      μ(6) = 1      λ(6) = 2 (Liouville)
σ - φ = 10                σ² = 144      σ³ = 1728      n^τ = 6⁴ = 1296
```

| 격자량 | hexa-aura 사상 |
|--|--|
| φ(6) = 2 | 2 클립 (좌·우 mastoid); φ=2 양방향 (read+write) per ch |
| σ·n/10 = 3.6 | 3.6 g/side → n·n/10 = 7.2 g pair |
| sopfr(6) = 5 | ≤ 5 mm 측두골 창; ≤ 5 ms closed-loop latency |
| σ(6) = 12 | 12 cortical zone (A1·A2·V1-V6·S1·S2·M1·PFC·hipp) |
| τ(6) = 4 | 4 operating mode (sense·inject·sync·sleep) |
| J₂ = 24 | 24 ch/macro-tile; coating φ·σ = 24 yr |
| μ(6) = 1 | 1 μm litho pitch; 1% watchdog FAR; ≥ 1 mm skin clearance |
| σ² = 144 | 144 ch/RT-SC tile |
| σ³ = 1728 | 1728-electrode-equivalent virtual array |
| n^τ = 1296 | 1296-ch hex cortical-column lattice (Neuralink 1024-ch parity·+) |
| σ - φ = 10 | "10×" 레버 (18 wearables / 10 ≈ 1) |

## 📚 5-doc atlas — 배경 컨텍스트

| doc | 출처 SHA | 한 줄 설명 |
|--|--|--|
| `docs/neuro.md` | canon@579ab196 ✦KR | 궁극의 AI 웨어러블 BCI · 측두골 클립 / 18 웨어러블 대체 / 25 카테고리 EXACT |
| `docs/brain-computer-interface.md` | canon@ab155706 ✦KR | 궁극의 BCI · 불가능성 정리 12개 |
| `docs/hexa-neuromorphic.md` | canon@5458b7d1 | n=6 spiking/synaptic/memristor chip |
| `docs/l9-field-photon-neuro.md` | canon@5458b7d1 | L9 field-effect · photonic-topo · neuromorphic 3-sub-layer |
| `docs/neuroscience.md` | canon@5458b7d1 | n=6 neuron / circuit / synapse / EEG / neuroimaging |

`✦KR` = canon-pre-migration 한국어 풍부본 (TODO §1 복원 검토 대상)

## 🔬 19-script RSC verify surface (T1/T2/T3 ladder + cross-cut + meta)

| 카테고리 | 수 | 스크립트 |
|--|--|--|
| **per-pillar** (4 × 4) | 16 | `calc_<p>` · `numerics_<p>` · `numerics_<p>_parity` · `numerics_<p>_solver` for p ∈ {clip, coil, cortex, safety} |
| **cross-cutter** | 2 | `numerics_cross_pillar` (anchor agreement < 1e-9) · `numerics_lattice_arithmetic` (`math_pure` precision floor) |
| **meta** | 3 | `falsifier_check` (3-tier ladder + 15 sub-ID intactness) · `lint_numerics` (5 RSC invariants) · `saturation_check` (`__HEXA_AURA_RSC_SATURATED__ STOP`) |
| **roadmap-wide** | 2 | `lattice_check` (n=6 closure across 4 pillar + 5 atlas) · `cross_doc_audit` (pillar↔pillar anchor agreement) |

진입점: `hexa run cli/hexa-aura.hexa verify [<sub>]`; 전부 묶어서 `verify/run_all.hexa`. 자세한 매핑은 `docs/numerics_methodology.md`.

## 🛡️ Governance hierarchy (precedent SSOT)

| Layer | SSOT | hexa-aura 가 상속하는 것 |
|--|--|--|
| 격자정책 | `~/core/echoes/LATTICE_POLICY.md` | real-limits-first · lattice-is-tool · honesty-obligation-external (`LATTICE_POLICY.md` local copy) |
| RSC 패턴 | `~/core/bedrock/docs/runnable_surface_recipe.md` | T1/T2/T3 사다리 · falsifier 사전등록 · saturation 자기-정지 |
| README/atlas | `~/core/atlas/README-FORMAT.md` + `PRESERVE-AS-SSOT.md` | 18-block README · AGENTS.tape 채택 |
| tape 문법 | `~/core/tape/spec/tape.md` | v1.2 17 entry · 12 edge · architecture-vs-log split |
| agent harness | `~/.wilson/identity.tape` + `~/core/wilson/AGENTS.md` | governance plugin 실행 · session_start identity 주입 |
| 원본 canon | `~/core/canon` | 5-doc atlas + neuro-BCI 사양 출처 |

## 🔗 cross-links

| Path | 한 줄 설명 |
|------|-----------|
| 📁 `.roadmap.hexa_aura` | repo-overall tracker (§0 DoD · §A.1 lattice · §A.4 falsifier · §A.6 hardware path) |
| 📁 `README.md` | 18-block human intro · 4-pillar/atlas table · scope-discipline matrix |
| 📁 `DEPENDENCIES.md` | precedent-domain map (ASCII diagram + 4 key findings) |
| 📁 `LATTICE_POLICY.md` | echoes 권위문서 local copy |
| 📁 `LIMIT_BREAKTHROUGH.md` | 도메인별 HARD/SOFT_WALL · BREAKABLE_WITH_TECH · UNCLEAR 감사 |
| 📁 `IMPORTED_FROM_CANON.md` | canon 출처 SHA 추적 (sibling tape: `IMPORTED_FROM_CANON.tape`) |
| 📁 `TAPE-AUDIT.md` | .tape 채택 ledger |
| 📁 `CHANGELOG.md` · `RELEASE_NOTES_v1.0.0.md` · `TODO.md` | 표준 18-block |
| 🔧 `cli/hexa-aura.hexa` | 4 pillar verb + 5 atlas verb + `status` + `selftest` + `verify [<sub>]` |
| 🔧 `verify/run_all.hexa` | 19-script aggregator (RC=0 = all green) |
| 🔧 `install.hexa` | warn-only CLI selftest (no hard build deps) |
| 🌐 `https://github.com/dancinlab/echoes` | parent project — `LATTICE_POLICY.md` authority |
| 🌐 `https://github.com/dancinlab/hexa-rtsc` | 🔴 critical dep — F-AURA-2 DEMOTE 트리거 |
| 🌐 `https://github.com/dancinlab/hexa-brain` | 🟠 sister — cortex pillar working-pipeline 검증 |
| 🌐 `https://github.com/dancinlab/hexa-cern` | sister RSC 모범 사례 (29/29 PASS) |

## 📊 Adoption phase

| Phase | scope | status |
|--|--|--|
| **v0.1.0-pre** | 11-doc bundle (cognitive + sensory verbs co-located) | superseded 2026-05-09 |
| **v0.1.0** | 5-doc CHIP-substrate bundle (BUNDLE_FIRST) | superseded 2026-05-10 |
| **v1.0.0** | 4-pillar substrate + 5-doc atlas + 19-script RSC verify + 100% code-layer closure | ✅ RELEASED 2026-05-10 |
| **v1.1.0** | hexa-rtsc / hexa-brain cross-verify | 🔄 ~2026-09 (planned) |
| **v1.2.0** | safety regulatory-pathway 확장 (FDA/KFDA class III pre-sub) | planned ~2026-12 |
| **v2.0.0** | Stage-1+ bench prototype (out of RSC code-layer) | ASPIRATIONAL ~2027-Q3 |

## ⚖️ Scope discipline (위임)

| concern | sibling repo |
|--|--|
| BCI ML stack · 인지 동사 (mind/oracle/telepathy/dream/upload/superpowers) | **`hexa-mind`** (pending split) |
| 5-감 동사 (ear/speak/empath/olfact/dream) | **`hexa-senses`** (pending split) |
| 실동작 EEG/BMI 파이프라인 | `hexa-brain` (sister) |
| RT-SC ambient-superconductor (coil 의존 — falsify 시 F-AURA-2 DEMOTED) | `hexa-rtsc` (sister) |
| 디코더 모델 서빙 | `hexa-codex` CLI |
| 칩급 neuromorphic 실리콘 | `hexa-chip` CLI |
| 5G/6G 업링크 | `hexa-grid` CLI |

**Do NOT proxy through `hexa-aura`** — 자매 CLI/repo 직접 호출.
