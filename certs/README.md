# Oeffentliches Code-Signing-Zertifikat

`TaktVibes_Community_Console.cer` ist eine unveraenderte Kopie des oeffentlichen
Zertifikats `TaktVibes_TaktBoot_Community.cer` (nur der Dateiname wurde geaendert).
Die **interne Identitaet** bleibt `CN=TaktVibes TaktBoot Community`.

Dieses `.cer` ist **kein privater Schluessel** und kann allein keine EXE signieren.
Der passende private Schluessel muss bereits im Windows-Zertifikatspeicher
`Cert:\CurrentUser\My` des signierenden Benutzers liegen. Nicht hochladen.

Selbstsigniert: Auf anderen Windows-PCs nicht automatisch vertrauenswuerdig.
Das Zertifikat NICHT als vertrauenswuerdige Root-CA installieren.
