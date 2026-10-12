# Signs Release EXE with existing TaktBoot Community signing identity.
# Public .cer is renamed, but certificate SUBJECT and thumbprint remain the same.
# No private signing keys/PFX are read from or saved to the ZIP.
$ErrorActionPreference = 'Stop'
$exePath = Join-Path $PSScriptRoot 'TVC.Console\bin\Release\TVC.Console.exe'
$cerPath = Join-Path $PSScriptRoot 'certs\TaktVibes_Community_Console.cer'
# Filename is Console; actual unchanged certificate identity is TaktBoot Community.
$subject = 'CN=TaktVibes TaktBoot Community'
function Find-SignTool {
    $command = Get-Command 'signtool.exe' -ErrorAction SilentlyContinue
    if ($null -ne $command) { return $command.Source }
    $programFilesX86 = [Environment]::GetFolderPath('ProgramFilesX86')
    if ($programFilesX86) {
        $root = Join-Path $programFilesX86 'Windows Kits\10\bin'
        if (Test-Path -LiteralPath $root) {
            $versions = @(Get-ChildItem -LiteralPath $root -Directory | Sort-Object Name -Descending)
            foreach ($version in $versions) {
                foreach ($arch in @('x64', 'x86')) {
                    $candidate = Join-Path $version.FullName ($arch + '\signtool.exe')
                    if (Test-Path -LiteralPath $candidate -PathType Leaf) { return $candidate }
                }
            }
        }
    }
    throw 'signtool.exe fehlt. Windows SDK 10 (Signing Tools) installieren oder signtool.exe in PATH aufnehmen.'
}
try {
    if (-not (Test-Path -LiteralPath $exePath -PathType Leaf)) {
        throw 'Release EXE fehlt. Erst build.cmd mit Visual Studio 2019 ausfuehren.'
    }
    if (-not (Test-Path -LiteralPath $cerPath -PathType Leaf)) {
        throw 'Oeffentliches .cer fehlt im certs-Ordner. Zertifikat nicht neu erzeugen.'
    }
    $publicCert = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($cerPath)
    $now = Get-Date
    $localCert = @(Get-ChildItem Cert:\CurrentUser\My | Where-Object {
        $_.Thumbprint -eq $publicCert.Thumbprint -and
        $_.Subject -eq $subject -and $_.HasPrivateKey -and
        $_.NotBefore -le $now -and $_.NotAfter -gt $now -and
        (@($_.EnhancedKeyUsageList | Where-Object { $_.ObjectId -eq '1.3.6.1.5.5.7.3.3' }).Count -gt 0)
    } | Select-Object -First 1)
    if ($localCert.Count -eq 0) {
        throw 'Privater Schluessel fuer das vorhandene TaktBoot-Zertifikat fehlt im Windows-Benutzerstore. Ein .cer allein kann NICHT signieren. Keinen privaten Schluessel hochladen.'
    }
    $signTool = Find-SignTool
    Write-Host ('Verwende vorhandenes Zertifikat: ' + $publicCert.Subject)
    Write-Host ('Zertifikat SHA1-Thumbprint: ' + $publicCert.Thumbprint)
    Write-Host ('Signiere: ' + $exePath)
    & $signTool sign /fd SHA256 /s My /sha1 $publicCert.Thumbprint /v $exePath
    if ($LASTEXITCODE -ne 0) { throw ('signtool sign schlug fehl (Code ' + $LASTEXITCODE + ').') }
    Write-Host 'SIGN-VORGANG: OK. Selbstsigniertes Zertifikat bleibt UNVERTRAUT auf fremden Windows-PCs.'
    Write-Host 'Keine Zeitstempelung. Nach Ablauf des Zertifikats kann die Signatur ungueltig werden.'
    Write-Host ('SHA256 signierte EXE: ' + (Get-FileHash -LiteralPath $exePath -Algorithm SHA256).Hash.ToLowerInvariant())
    Write-Host 'Fuer Authenticode-Status: verify-signature.cmd ausfuehren.'
} catch {
    Write-Error $_
    exit 1
}
