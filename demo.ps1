#copy files
RoboCopy C:\Data\Dropbox\Prog\SnoopBreadcrumbs\ c:\temp\CrumbTest * /MIR /mt:4

if ($LastExitCode -eq 1)
{
    #create crumbs
    C:\Data\Dropbox\Prog\SnoopBreadcrumbs\bin\Debug\SnoopBCConsole.exe c:\temp\CrumbTest

    #compile
    if (0 -eq $LastExitCode)
    {
        C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe c:\temp\CrumbTest\SnoopBreadcrumbs.sln

        #run
        if (0 -eq $LastExitCode)
        {
            C:\temp\CrumbTest\bin\Debug\SnoopBreadcrumbs.exe
        }
    }
}


