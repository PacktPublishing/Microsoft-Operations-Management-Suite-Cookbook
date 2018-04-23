workflow File-Copy
{
     Param
    (
        [parameter(Mandatory=$true)]
        [String] $FileSource,

        [parameter(Mandatory=$true)]
        [String] $FileDestination
    )
 
    Write-Output "Runbook is executing on On-premises Hybrid worker: $env:ComputerName"
    Write-Output "File Destination: $FileDestination"
    Write-Output "Source of File: $FileSource"
   
    $execute = InlineScript
    {
        try
        {
            Copy-Item -Path "$using:FileSource" -Destination "$using:FileDestination" -recurse
        }
        catch
        {
            $errorMessage = $error[0].Exception.Message
        }
  
        if($errorMessage -eq $null)
        {
            return "Files were copied successfully"
        }
        else
        {
            return " Copy Operation Failed: Encountered error(s) while copying files. Error message=[$errorMessage]"
        }
    }
 
    Write-Output $execute
    Write-Output "Runbook execution has completed"
}