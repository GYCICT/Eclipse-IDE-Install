
$Url = "https://mirror.aarnet.edu.au/pub/eclipse/technology/epp/downloads/release/2022-03/M2/eclipse-java-2022-03-M2-win32-x86_64.zip"


$ZipFile = "C:\Temp\Zip\"
 
$FullZipFile = $ZipFile +(Split-Path -Path $Url -Leaf) # Parse URL


If(!(Test-Path $ZipFile)) # Create Zip Directory in Temp
{

    New-Item -ItemType Directory -Force -Path $ZipFile

}


$ExtractPath = "C:\Program Files (x86)\Eclipse" # Create Eclipse Dir


If(!(Test-Path $ExtractPath))
{

    New-Item -ItemType Directory -Force -Path $ExtractPath

}


If (Test-Path $ExtractPath\eclipse) # Remove old eclipse files 
{

    Remove-Item -Path $ExtractPath\eclipse -Recurse

}


$ProgressPreference = "SilentlyContinue" # Speed up Invoke-WebRequest

Invoke-WebRequest -Uri $Url -OutFile $FullZipFile # Download Files


$ExtractShell = New-Object -ComObject Shell.Application # Create shell application

$ExtractFiles = $ExtractShell.Namespace($FullZipFile).Items() # Files extracted

$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) # Copy files to $ExtractPath


Start-Process $ExtractPath

Write-Host "Complete."