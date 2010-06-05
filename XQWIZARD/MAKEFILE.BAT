DEL xqwizard_setup.exe
DEL xqwizard_portable.7z
DEL XQWIZARD.EXE
DEL XQBOOTH.EXE
"C:\Program Files\Microsoft Visual Studio\VB98\vb6.exe" XQWIZARD.VBP /make
"C:\Program Files\Microsoft Visual Studio\VB98\vb6.exe" XQBOOTH.VBP /make
DEL *.OCA
SIGNCODE /SPC MAKEFILE\XQWIZARD.SPC /V MAKEFILE\XQWIZARD.PVK XQWIZARD.EXE
SIGNCODE /SPC MAKEFILE\XQWIZARD.SPC /V MAKEFILE\XQWIZARD.PVK XQBOOTH.EXE
"C:\Program Files\Inno Setup 5\Compil32.exe" /cc MAKEFILE\XQWIZARD.ISS
SIGNCODE /SPC MAKEFILE\DOWNLOAD.SPC /V MAKEFILE\DOWNLOAD.PVK xqwizard_setup.exe
"C:\Program Files\7-Zip\7z.exe" a xqwizard_portable.7z @MAKEFILE\FILELIST.TXT