# TaktVibes Community Console – interner QA-Prüfbericht

**Version:** 0.1.0 · **Build:** 0003 · **Datum:** 10.10.2026  
**Status:** Vom Projektinhaber freigegeben; GitHub-Quellpaket vorbereitet.

| Prüfung | Ergebnis | Nachweis/Anmerkung |
|---|---|---|
| Build 0002 / sechs Befehle | PASS laut Nutzer | Rückmeldung 10.10.2026 |
| Build 0003 / Programmstart | PASS laut Nutzer | Screenshot `docs/start_build0003.png` |
| Build 0003 / Versionsanzeige | PASS laut Nutzer | `0.1.0 / 0003` sichtbar |
| Build 0003 / sechs einzelne Befehle | OFFEN | Nicht separat bestätigt |
| Build 0003 / Freigabe | ERTEILT | Projektinhaber |
| Quell-ZIP / CRC und Inhaltsabgleich | PASS | Beim Paketbau lokal geprüft |
| SHA-256-Quellenmanifest | PASS | `verify.sh` lokal geprüft |
| Öffentliche `.cer` vorhanden | PASS | Öffentliche DER-Datei im Paket |
| Private Schlüssel / PFX im Paket | KEINE | geprüft |
| Windows-Kompilierung auf dieser Prüfmaschine | NICHT GETESTET | Kein VS2019/.NET-Fx Compiler |
| Authenticode signierte EXE | OFFEN | Kein privater Schlüssel/Windows-SignTool hier |
| GitHub-Veröffentlichung | OFFEN | Vorbereitung ≠ Upload |

**Hinweis:** Dieser Prüfbericht ist **kein Zertifikat einer unabhängigen
Prüfstelle** und keine X.509-Codesignatur. Die `.cer` ist selbstsigniert und
wird auf anderen PCs nicht automatisch als vertrauenswürdig anerkannt.
