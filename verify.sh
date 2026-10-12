#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
if command -v sha256sum >/dev/null 2>&1; then
    sha256sum -c SHA256SUMS.txt
elif command -v shasum >/dev/null 2>&1; then
    shasum -a 256 -c SHA256SUMS.txt
else
    echo 'sha256sum/shasum fehlt; Checksummen koennen nicht geprueft werden.' >&2
    exit 1
fi
