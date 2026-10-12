# Reports Windows Authenticode signer & local chain trust separately.
$ErrorActionPreference = 'Stop'
$exePath = Join-Path $PSScriptRoot 'TVC.Console\bin\Release\TVC.Console.exe'
$cerPath = Join-Path $PSScriptRoot 'certs\TaktVibes_Community_Console.cer'
try {
    if (-not (Test-Path -LiteralPath $exePath -PathType Leaf)) { throw 'Release-EXE nicht gefunden.' }
    if (-not (Test-Path -LiteralPath $cerPath -PathType Leaf)) { throw 'Oeffentliches .cer nicht gefunden.' }
    $publicCert = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($cerPath)
    $sig = Get-AuthenticodeSignature -LiteralPath $exePath
    if ($null -eq $sig.SignerCertificate) { throw 'Keine digitale Signatur gefunden.' }
    if ($sig.SignerCertificate.Thumbprint -ne $publicCert.Thumbprint) {
        throw 'Signatur passt nicht zu certs\TaktVibes_Community_Console.cer.'
    }
    Write-Host ('Signierender Zertifikatsfingerabdruck: ' + $sig.SignerCertificate.Thumbprint)
    Write-Host ('Windows-Vertrauensstatus: ' + $sig.Status)
    Write-Host ('Statusbeschreibung: ' + $sig.StatusMessage)
    Write-Host ('SHA256 EXE: ' + (Get-FileHash -LiteralPath $exePath -Algorithm SHA256).Hash.ToLowerInvariant())
    if ($sig.Status -eq 'Valid') {
        Write-Host 'PASS: Windows bewertet diese Authenticode-Signatur als gueltig.'
        exit 0
    }
    if ($sig.Status -eq 'NotTrusted') {
        Write-Warning 'NICHT VERTRAUT: Zertifikat ist selbstsigniert; die Signatur wird von Windows nicht als vertrauenswuerdig bestaetigt.'
        exit 2
    }
    throw ('Authenticode-Verifikation nicht erfolgreich: ' + $sig.Status)
} catch {
    Write-Error $_
    exit 1
}
