
$Url = "https://mirror.aarnet.edu.au/pub/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-java-2021-09-R-win32-x86_64.zip"


$ZipFile = "C:\Temp\Zip\"

$FullZipFile = $ZipFile +(Split-Path -Path $Url -Leaf)

If(!(Test-Path $ZipFile))
{

    New-Item -ItemType Directory -Force -Path $ZipFile

}


$ExtractPath = "C:\Program Files (x86)\Eclipse"

If(!(Test-Path $ExtractPath))
{

    New-Item -ItemType Directory -Force -Path $ExtractPath

}

Invoke-WebRequest -Uri $Url -OutFile $FullZipFile

$ExtractShell = New-Object -ComObject Shell.Application

$ExtractFiles = $ExtractShell.Namespace($FullZipFile).Items()

$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles)
Start-Process $ExtractPath
