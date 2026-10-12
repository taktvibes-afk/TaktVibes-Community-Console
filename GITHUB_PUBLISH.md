# GitHub-Veröffentlichung – kurze Anleitung

## A. Repository mit Quellcode hochladen

1. Auf GitHub ein **neues leeres öffentliches Repository** anlegen, z. B.
   `TaktVibes-Community-Console`. **Keine zusätzliche README/Lizenz erzeugen**,
   denn beides ist im Paket bereits vorhanden.
2. Die GitHubReady-ZIP **entpacken**. Die **Dateien IN diesem Ordner**
   hochladen (nicht den äußeren Ordner als einzigen Repo-Unterordner).
3. Upload kontrollieren: In der Repo-Wurzel müssen `README.md`, `LICENSE`,
   `TVC.Console.sln`, `TVC.Console/`, `certs/`, `docs/` usw. sichtbar sein.
4. Commit-Nachricht z. B. `Release v0.1.0 build 0003 - initial public source`.
5. Prüfen, dass **keine** Dateien wie `.pfx`, `.key`, `.pvk`, `.p12` oder
   private Zertifikate im Repository sind. Die `.cer` ist öffentlich.

## B. Release veröffentlichen

1. Auf GitHub **Releases → Draft a new release**.
2. Tag: **`v0.1.0-build0003`**; Titel:
   **`TaktVibes Community Console 0.1.0 – Build 0003`**.
3. Kurztext aus `RELEASE.md` übernehmen. Klar kennzeichnen:
   **C#-Quellcode, keine signierte Windows-EXE**.
4. Bei **Assets** hochladen:
   - `TVC_Console_0.1.0_Build0003_GitHubReady.zip`
   - `TVC_Console_0.1.0_Build0003_GitHubReady.zip.sha256`
5. Erst nach Kontrolle auf **Publish release** klicken.

Die `.sha256` bleibt neben der ZIP. Sie ist eine **Prüfsumme, keine Signatur**.
Wer die ZIP nur entpacken/öffnen möchte, braucht diese Datei nicht.

## C. Optionale signierte Windows-EXE (separater Vorgang)

1. EXE im Release-Modus auf Windows erstellen.
2. Passenden **privaten Schlüssel lokal** zum öffentlichen `.cer` benötigen.
3. `sign-release.cmd` auf Windows ausführen, danach `verify-signature.cmd`.
4. Nur **die signierte EXE** mit frischer SHA-256 als zusätzliches Asset
   veröffentlichen und den selbstsignierten Status transparent erklären.

**Nie privaten Schlüssel/PFX nach GitHub hochladen.**
**GitHub-Upload wurde in dieser Werkstatt nicht automatisch durchgeführt.**
