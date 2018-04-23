workflow Start-OnPremVM
{
    param ( 
        [object]$WebhookData
   	    )

    $RequestBody = ConvertFrom-JSON -InputObject $WebhookData.RequestBody

    # Get all metadata properties    
    $AlertRuleName = $RequestBody.AlertRuleName
    $ResultCount =$RequestBody.ResultCount
    $SearchQuery = $RequestBody.SearchQuery
    $WorkspaceID = $RequestBody.WorkspaceId

    # Get detailed search results
    if($RequestBody.SearchResult -ne $null)
    {
        $SearchResultRows    = $RequestBody.SearchResult.tables[0].rows 
        $SearchResultColumns = $RequestBody.SearchResult.tables[0].columns;
	
	    #Get Azure Automation VMHost Variable
	    If (!$VMHost)
	    {
		    $VMHost = Get-AutomationVariable StartComputerDefaultHostName
	    }
	 
	    Write-Output "VM Host automation asset is $VMHost"
	    	
	    Write-Output "Workspace ID: '$WorkspaceID'."
	    Write-Output "Alert Rule Name: '$AlertRuleName'."
	    Write-Output "Search Query: '$SearchQuery'."
	    Write-Output "Result Count: '$ResultCount'."
		
        foreach ($SearchResultRow in $SearchResultRows)
        {   
            $Column = 0
            $Record = New-Object –TypeName PSObject 

            foreach ($SearchResultColumn in $SearchResultColumns)
            {
                $Name = $SearchResultColumn.name
                $ColumnValue = $SearchResultRow[$Column]
                $Record | Add-Member –MemberType NoteProperty –Name $name –Value $ColumnValue -Force

                $Column++
            }
				    #Retrieve VM target from OMS Alert Record
				    $GetVM=$Record.HostName
				    Write-Output "OMS Reports Computer '$GetVM' is down. Checking VM State..."
				    #$Computer= Get-WmiObject -Credential $ServerAuthAct -Namespace root\virtualization\v2 -Class Msvm_ComputerSystem | Where{$_.ElementName -ieq $GetVM}
				    $Computer= Get-WmiObject -Namespace root\virtualization\v2 -Class Msvm_ComputerSystem | Where{$_.ElementName -ieq $GetVM}

				    $VM=$Computer.ElementName   

				    If ($Computer.EnabledState -ieq 3)
				    {
					    Write-Output "VM State is stopped. Will start VM"
					    Start-VM -ComputerName $VMHost -Name $VM
					    Write-output "VM Host is $VMHost"
					    Write-Output "Attempting to Start '$VM'"
					    Start-Sleep -s 20 
					    $Computer= Get-WmiObject -Namespace root\virtualization\v2 -Class Msvm_ComputerSystem | Where{$_.ElementName -ieq $GetVM}
					    $VM=$Computer.ElementName

					    If ($Computer.EnabledState -ieq 3)
					    {
						    Write-Output "Failed to Start $VM"
					    }
					    else 
					    {
						    Write-Output "Successfully started $VM"
					    }
				    }
				    else 
				    {
					    Write-Output "VM State is not stopped. Will now exit."
				    }

        }
    }
}