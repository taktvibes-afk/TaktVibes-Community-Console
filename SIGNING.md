# TaktVibes Community Console – vorhandenes Zertifikat wiederverwenden

Dieses Projekt enthaelt das **oeffentliche** selbstsignierte Zertifikat
`certs/TaktVibes_Community_Console.cer`. Es ist bytegleich mit dem ehemaligen
`TaktVibes_TaktBoot_Community.cer`; allein der Dateiname wurde geaendert.
**Interner Subject-Name:** `CN=TaktVibes TaktBoot Community`.

Ein `.cer` allein kann nichts signieren. Fuer Authenticode benoetigt Windows den
passenden privaten Schluessel zu genau diesem Zertifikats-Fingerabdruck, z. B.
in `Cert:\CurrentUser\My` des Benutzers, der das Zertifikat damals erstellt hat.
Keinen privaten Schluessel oder PFX zu GitHub oder hier hochladen.

## Windows – Build und Signierung

Voraussetzungen: Windows, VS 2019 + .NET Framework 4.8 Developer Pack;
Windows SDK mit `signtool.exe`, vorhandener privater Schluessel.
In der **VS 2019 Developer Command Prompt** (im Projektordner):

```bat
verify.cmd
build.cmd
sign-release.cmd
verify-signature.cmd
```

- `verify.cmd` prueft die bereitgestellten Quell- und Zertifikatsdateien.
- `build.cmd` erstellt die Release-EXE unter `TVC.Console\bin\Release`.
- `sign-release.cmd` sucht im **aktuellen Benutzerstore** den privaten Schluessel
  zum oeffentlichen `.cer` (Thumbprint-Match), prueft CodeSigning-EKU und
  Geltungsdauer und ruft SignTool mit `/fd SHA256` auf.
- `verify-signature.cmd` prueft, ob der Unterzeichner-Fingerabdruck dem
  `.cer` entspricht, und meldet den Windows-Authenticode-Vertrauensstatus.

`Valid` bedeutet auf diesem PC anerkannt. `NotTrusted` (Exitcode 2) ist bei
selbstsigniertem Zertifikat ohne lokale Vertrauensstellung zu erwarten; das ist
**kein** oeffentlich vertrauenswuerdiger Herausgebernachweis. Andere Fehler = FAIL.
Die EXE hat nach dem Signieren eine **neue SHA-256-Pruefsumme**. Eine spaetere
Neukompilierung entfernt die Signatur. Kein Zeitstempelserver konfiguriert;
nach Zertifikatsablauf ist langfristige Signaturgueltigkeit nicht garantiert.

**Nicht ausfuehren:** `create-cert.cmd` aus Build 0002. Die alte Variante
wuerde ein anderes Konsolen-Zertifikat erzeugen bzw. die `.cer` ersetzen.
Solche Erzeugungsskripte sind in diesem Build absichtlich nicht enthalten.

Die digitale Signierung wurde hier **nicht** auf Windows ausgefuehrt.
Ein selbstsigniertes Zertifikat bietet keine externe Identitaetspruefung.
