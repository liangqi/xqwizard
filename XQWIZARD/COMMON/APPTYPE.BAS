Attribute VB_Name = "mdlAppType"
Option Explicit

Public Const IMAGE_SUBSYSTEM_UNKNOWN        As Long = 0 ' Unknown subsystem.
Public Const IMAGE_SUBSYSTEM_NATIVE         As Long = 1 ' Image doesn't require a subsystem.
Public Const IMAGE_SUBSYSTEM_WINDOWS_GUI    As Long = 2 ' Image runs in the Windows GUI subsystem.
Public Const IMAGE_SUBSYSTEM_WINDOWS_CUI    As Long = 3 ' Image runs in the Windows character subsystem.
Public Const IMAGE_SUBSYSTEM_OS2_CUI        As Long = 5 ' image runs in the OS/2 character subsystem.
Public Const IMAGE_SUBSYSTEM_POSIX_CUI      As Long = 7 ' image runs in the Posix character subsystem.
Public Const IMAGE_SUBSYSTEM_NATIVE_WINDOWS As Long = 8 ' image is a native Win9x driver.
Public Const IMAGE_SUBSYSTEM_WINDOWS_CE_GUI As Long = 9 ' Image runs in the Windows CE subsystem.

Public Declare Function GetAppType Lib "APPTYPE.DLL" Alias "_GetAppType@4" (ByVal szAppFile As String) As Long