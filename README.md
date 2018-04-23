# Microsoft Operations Management Suite Cookbook
This is the code repository for [Microsoft Operations Management Suite Cookbook](https://www.packtpub.com/virtualization-and-cloud/microsoft-operations-management-suite-cookbook?utm_source=github&utm_medium=repository&utm_campaign=9781786469090), published by [Packt](https://www.packtpub.com/?utm_source=github). It contains all the supporting project files necessary to work through the book from start to finish.
## About the Book
Virtual and Augmented Reality 
## Instructions and Navigation
All of the code is organized into folders. Each folder starts with a number followed by the application name. For example, Chapter02.
Chapter 3 and Chapter 5 has code files and there are 9 chpts in all:
Chapters 1, 2, 4, 6, 7, 8, 9 do not contain any code files.



The code will look like the following:
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

}


## Related Products
* [Azure for Architects](https://www.packtpub.com/virtualization-and-cloud/azure-architects?utm_source=github&utm_medium=repository&utm_campaign=9781788397391)

* [Learning Microsoft Azure Storage](https://www.packtpub.com/big-data-and-business-intelligence/learning-microsoft-azure-storage?utm_source=github&utm_medium=repository&utm_campaign=9781785884917)

* []()

### Suggestions and Feedback
[Click here](https://docs.google.com/forms/d/e/1FAIpQLSe5qwunkGf6PUvzPirPDtuy1Du5Rlzew23UBp2S-P3wB-GcwQ/viewform) if you have any feedback or suggestions.
