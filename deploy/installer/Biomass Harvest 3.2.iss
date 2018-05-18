#define PackageName      "Biomass Harvest"
#define PackageNameLong  "Biomass Harvest Extension"
#define Version          "3.2.4"
#define ReleaseType      "official"
#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"
#define LandisPlugInDir "C:\Program Files\LANDIS-II\plug-ins"

#include "package (Setup section) v6.0.iss"


[Files]
; This .dll IS the extension (ie, the extension's assembly)
; NB. Do not put a version number in the file name of this .dll
Source: ..\..\src\bin\Debug\Landis.Extension.BiomassHarvest.dll; DestDir: {#ExtDir}; Flags: replacesameversion 
Source: ..\..\src\bin\Debug\Landis.Extension.BiomassHarvest.pdb; DestDir: {#ExtDir}; Flags: replacesameversion 

; Requisite auxiliary libraries
; NB. These libraries are used by other extensions and thus are never uninstalled.
Source: ..\..\src\bin\Debug\Landis.Library.BiomassCohorts-v2.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\Debug\Landis.Library.Biomass-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\Debug\Landis.Library.BiomassHarvest-v2.dll;    DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\Debug\Landis.Library.HarvestManagement-v2.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\Debug\Landis.Library.SiteHarvest-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\Debug\Landis.Library.Metadata.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\Debug\Landis.Library.Succession-v5.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall


; Complete example for testing
Source: ..\examples\*.txt; DestDir: {#AppDir}\examples\Biomass Harvest; Flags: replacesameversion
Source: ..\examples\*.gis; DestDir: {#AppDir}\examples\Biomass Harvest; Flags: replacesameversion
Source: ..\examples\*.bat; DestDir: {#AppDir}\examples\Biomass Harvest; Flags: replacesameversion
Source: ..\examples\*.csv; DestDir: {#AppDir}\examples\Biomass Harvest; Flags: replacesameversion


; LANDIS-II identifies the extension with the info in this .txt file
; NB. New releases must modify the name of this file and the info in it
#define InfoTxt "Biomass Harvest 3.2.txt"
Source: {#InfoTxt}; DestDir: {#LandisPlugInDir}


[Run]
; Run plug-in admin tool to add the entry for the plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"

Filename: {#PlugInAdminTool}; Parameters: "remove ""Biomass Harvest"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#InfoTxt}"" "; WorkingDir: {#LandisPlugInDir}

[Code]
{ Check for other prerequisites during the setup initialization }
#include "package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;
