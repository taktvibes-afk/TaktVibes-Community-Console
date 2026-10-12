# Prueft die im Archiv enthaltenen Quelldateien gegen SHA256SUMS.txt.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$lines = Get-Content (Join-Path $PSScriptRoot 'SHA256SUMS.txt')
$failed = $false
foreach ($line in $lines) {
    if ($line -notmatch '^([0-9a-f]{64})  (.+)$') { throw "Ungueltige Manifestzeile: $line" }
    $expected = $matches[1]
    $relative = $matches[2]
    $file = Join-Path $PSScriptRoot ($relative.Replace('/', '\'))
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
        Write-Host "FEHLT: $relative"
        $failed = $true
        continue
    }
    $actual = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $expected) {
        Write-Host "FEHLER: $relative"
        $failed = $true
    } else {
        Write-Host "OK: $relative"
    }
}
if ($failed) { exit 1 }
Write-Host 'SHA256-Pruefung: PASS'
exit 0
