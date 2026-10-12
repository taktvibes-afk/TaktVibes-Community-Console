# Testplan – TVC 0.1.0 Build 0003

## Bereits vom Projektinhaber bestätigt

- [x] Version 0.1.0 Build 0003 startet unter Windows / Visual Studio 2019.
- [x] Startbildschirm zeigt `Version 0.1.0 | Build 0003` und `TVC>`.
- [x] Explizite Release-Freigabe für Build 0003.

## Noch gesondert für Build 0003 zu prüfen

- [ ] `help` listet alle sechs Befehle auf.
- [ ] `version` zeigt `0.1.0 | Build 0003`.
- [ ] `echo Hallo` gibt `Hallo` aus.
- [ ] `time` zeigt eine plausible lokale Uhrzeit.
- [ ] `cls` löscht den Bildschirm.
- [ ] `exit` beendet das Programm sauber.
- [ ] Optional: leerer Befehl, unbekannter Befehl, `echo` ohne Text.

## Integrität und optionale digitale EXE-Signierung

- [x] `verify.sh` prüft alle Dateien aus `SHA256SUMS.txt` im vorbereiteten Paket.
- [ ] `verify.cmd` zusätzlich auf Windows ausführen.
- [ ] Privaten Schlüssel zur öffentlichen TaktBoot-Community-`.cer` lokal finden.
- [ ] `sign-release.cmd` (erst nach Release-Build) erfolgreich ausführen.
- [ ] `verify-signature.cmd` meldet passenden Signierer und Trust-Status.
- [ ] Für signierte EXE eigene SHA-256-Datei anlegen, sofern publiziert.

Teststatus nicht als abgeschlossen markieren, bevor tatsächlich getestet.
