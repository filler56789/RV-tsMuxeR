# Roman's tsMuxeR (command-line interface only)

tsMuxeR was created by Roman Vasilenko (a.k.a. physic @ the Doom9 forum).
The author gave its source-code to justdan96 [github-dot-com/justdan96].
This repository is not a fork. It doesn't include tsMuxerR's GUI.
In this repository I included both zlib and freetype2 besides libmediation.
CMake is required for building zlib.
I rewrote the muxer's makefile so that the users of MSYS2 don't have to "install" zlib, freetype2 and ninja without a very-good reason.

**KNOWN ISSUES:**

The 32-bit executable cannot create functional Blu-Ray .ISOs.
The previous GUI (v2.6.12) works normally with the 64-bit muxer, as long as the muxer is not compressed with UPX. Stripping the .EXE with "--strip-unneeded" is okay.

