#Applies breadcrumbs to PhotoSuru app and runs
#Requirements:
#1. download & install photosuru: http://windowsclient.net/wpf/starter-kits/sce/ScePhotoViewer.exe
#2. set paths in params


param (
    $Source      = "C:\Data\PhotoSuru\",
    $Destination = "C:\temp\PhotoCrumb",
    $bcLocation  = "C:\Data\Dropbox\Prog\SnoopBreadcrumbs\bin\Debug",
    $targetSLN   = "ScePhotoViewer.sln",
    $runnableExe = "bin\Debug\ScePhotoViewer.exe"
)
 
$SnoopBCConsole = Join-Path $bcLocation SnoopBCConsole.exe
$sln            = Join-Path $Destination $targetSLN
$runnableExe    = Join-Path $Destination $runnableExe
 
#copy files
RoboCopy $Source $Destination * /MIR /mt:4
 
if ($LastExitCode -ge 0)
{
    #create crumbs
   
    & $SnoopBCConsole $Destination ContentControl 
 
    #compile
    if (0 -eq $LastExitCode)
    {       
        C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe $sln
 
        #run
        if (0 -eq $LastExitCode)
        {           
            & $runnableExe
        }
    }
} 

