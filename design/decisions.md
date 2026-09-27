# Open questions log — walker-misc-joypads

Gate — unsigned at time of writing. Written by `/gdd reverse --path godot silent`, 2026-09-27. Format: THE QUESTION / THE STAKES / DECISION DEADLINE / OPTIONS / OWNER / STATUS. Every `[MISSING]` in `GDD.md` maps to a row here. Nothing below is decided.

| # | Question | Stakes | Deadline | Options | Owner | Status |
|---|---|---|---|---|---|---|
| Q-01 | Why is this tool in Walker: reference, teaching, or a utility for Walker's own controller-supported games? (§1) | No acceptance criterion for films or further tests | before either film is scripted | reference / teaching controller indices and mappings / internal utility | Nik Bear Brown | Open |
| Q-02 | Audience: developer, tester, or general viewer? (§1) | Decides whether films explain SDL mapping strings or just show buttons lighting up | with Q-01 | developer / student / general | Nik Bear Brown | Open |
| Q-03 | PX goals and how to measure them (§4) | PX-01? and PX-02? need hardware | before T-21 | adopt §4 candidates / rewrite / "tool, no PX goals" | Nik Bear Brown | Open |
| Q-04 | Which features are CORE for Walker? (§11) | No prioritization; CORE % undefined | with Q-01 | tag F-01..F-08 | Nik Bear Brown | Open |
| Q-05 | "Set Raw Mapping" removes the mapping. Keep the upstream label, relabel locally, or explain it in the film? (§5 M-06, R-02) | A viewer or tester clicks it expecting to set something and silently loses a mapping | before any film shows it | keep and document / relabel "Clear Mapping" (local change) / avoid in films | Nik Bear Brown | Open |
| Q-06 | Who provides a physical controller session, with which pads and OS? (§11, §16 T-21..T-23) | Everything past L2 and both films are blocked | before film capture | named pad(s) + macOS; or declare hardware out of scope | Nik Bear Brown | Open |
| Q-07 | Investigate or fix the wizard close state (closing keeps `cur_step` set)? (§6 S-02, R-03) | Possible silent input capture after closing the wizard | before T-20 | test first (T-20) / fix locally with reset() on close / leave upstream | Nik Bear Brown | Open |
| Q-08 | Film scope without a controller on camera (§14 R-05) | README keeps both films pending; constructed mappings are not footage | before capture | wait for hardware / film the mapping-string model only, labelled as such | Nik Bear Brown | Open |
| Q-09 | Are saving mappings, glyph names, multi-device view and the `guide` step intentionally out of scope? (§12) | Scope creep, or a wizard that silently skips the guide button | before any feature work | confirm out of scope / add guide step (local change) | Nik Bear Brown | Open |
