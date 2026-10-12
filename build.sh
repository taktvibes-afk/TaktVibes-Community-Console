#!/usr/bin/env sh
# Optional for learners using a compatible MSBuild/Mono environment.
# Official project target remains Windows + Visual Studio 2019 + .NET Framework 4.8.
set -eu
cd "$(dirname "$0")"
if command -v msbuild >/dev/null 2>&1; then
    msbuild TVC.Console.sln /nologo /t:Rebuild /p:Configuration=Release /p:Platform="Any CPU" /verbosity:minimal
else
    echo 'MSBuild nicht vorhanden. Nutze Visual Studio 2019 unter Windows (build.cmd).' >&2
    exit 1
fi
