# TaktVibes Community Console

**Version 0.1.0 · Build 0003 · C# · Visual Studio 2019 · .NET Framework 4.8**

A tiny, independent Windows console application for learning C#. **It is not
an OS, kernel or component of the private Manage Your Life VB.NET kernel.**

![Community Console 0.1.0 Build 0003 startup](docs/start_build0003.png)

## Requirements / Getting started

- Windows with **.NET Framework 4.8** installed.
- To compile: **Visual Studio 2019** with the **.NET desktop development**
  workload and **.NET Framework 4.8 Developer Pack**.

1. Download or clone the source and open `TVC.Console.sln` in VS 2019.
2. Select **Release / Any CPU**, then Build Solution.
3. Run with `Ctrl+F5`. Or run `build.cmd`, then `run.cmd` in the
   **Developer Command Prompt for VS 2019**.

Commands: `help`, `version`, `echo TEXT`, `time`, `cls`, `exit`.

## Integrity / Signing

- Run `verify.cmd` on Windows, or `sh verify.sh` on Linux/macOS, to compare
  the included files with `SHA256SUMS.txt`.
- `sign-release.cmd` requires the matching **private key** already present in
  the Windows CurrentUser/Personal certificate store and Windows SDK SignTool.
- `verify-signature.cmd` checks the EXE signature and reports Windows trust status.

The public `.cer` file was renamed for this console, but its internal subject
remains `CN=TaktVibes TaktBoot Community`. The cert is **self-signed, not
publicly trusted**, and cannot sign an executable by itself. **No signed EXE
or private key is included in this repository.** Details: [SIGNING.md](SIGNING.md).

## Test status

The owner confirmed all six commands on Build 0002. Build 0003 started
successfully on their Windows machine, displayed the expected version/build,
and was explicitly approved. A separate six-command regression test of
Build 0003 and actual Authenticode signing have not yet been documented.

See [TESTPLAN.md](TESTPLAN.md), [QA_CERTIFICATE.md](QA_CERTIFICATE.md) and
[GITHUB_PUBLISH.md](GITHUB_PUBLISH.md) for the release procedure.

[German README](README.md) · [MIT License](LICENSE)
