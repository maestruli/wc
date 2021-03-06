; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "WC"
#define MyAppVersion "1.0.1"
#define MyAppPublisher "Samsung Electronics co. ltd"
#define MyAppURL " http://www.samsung.com/global/business/semiconductor"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A0D1BE52-8198-4315-A5EC-07CC7C66DD89}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\WC
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=setup_es
SetupIconFile=C:\WC\samsung-logo.ico
Compression=lzma
SolidCompression=yes
AlwaysRestart=yes

[Languages]
Name: "sp"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
Source: "C:\WC\se.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\wcis.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\zip.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\WC-Cap.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\WC-Send.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\capture.cmd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\createtasks.cmd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\WC\zip-se.cmd"; DestDir: "{app}"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "{app}\createtasks.cmd"
