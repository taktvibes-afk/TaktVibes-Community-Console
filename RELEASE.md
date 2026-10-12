# Release Notes – TaktVibes Community Console v0.1.0 / Build 0003

**Datum:** 10.10.2026  
**Freigabe:** Ja, durch Projektinhaber (Meister 1).  
**GitHub-Upload:** Noch nicht ausgeführt.  
**Pakettyp:** Quellcode (Visual Studio 2019), keine signierte EXE.

## Inhalt

- Unabhängige C#-Konsole für Windows / .NET Framework 4.8.
- Sechs Befehle: `help`, `version`, `echo`, `time`, `cls`, `exit`.
- VS2019-Projektmappe, `build.cmd`, `run.cmd`, `build.sh`.
- MIT-Lizenz, README auf Deutsch/Englisch, Testplan und QA-Bericht.
- `verify.cmd` / `verify.sh`, Manifest `SHA256SUMS.txt`.
- Optionaler Signaturablauf mit vorhandenem **selbstsigniertem** öffentlichem
  TaktBoot-Community-Zertifikat (`.cer`), keine privaten Schlüssel im Paket.

## Bestätigte Tests

- Build 0002: sechs Befehle erfolgreich, Rückmeldung Projektinhaber.
- Build 0003: Release-Start, Versionsanzeige und Prompt erfolgreich,
  Rückmeldung und Screenshot des Projektinhabers.
- Build 0003: Freigabe ausdrücklich erteilt.
- Statische ZIP-/Prüfsummenprüfungen: siehe `QA_CERTIFICATE.md`.

## Noch ausstehende Nachweise

- Build 0003: alle sechs Befehle gesondert als Regressionstest bestätigen.
- Optional für **Binärveröffentlichung**: Authenticode-Signatur mit
  tatsächlich vorhandenem privatem Schlüssel und Signaturprüfung.
- Keine signierte EXE im Quellcode-Paket. Windows-Trust für das selbstsignierte
  Zertifikat auf fremden PCs ist nicht automatisch gegeben.

**Tag-Vorschlag:** `v0.1.0-build0003`
