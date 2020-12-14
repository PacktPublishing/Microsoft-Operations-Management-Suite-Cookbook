## $5 Tech Unlocked 2021!
[Buy and download this Book for only $5 on PacktPub.com](https://www.packtpub.com/product/microsoft-operations-management-suite-cookbook/9781786469090)
-----
*If you have read this book, please leave a review on [Amazon.com](https://www.amazon.com/gp/product/178646909X).     Potential readers can then use your unbiased opinion to help them make purchase decisions. Thank you. The $5 campaign         runs from __December 15th 2020__ to __January 13th 2021.__*

# Microsoft Operations Management Suite Cookbook
This is the code repository for [Microsoft Operations Management Suite Cookbook](https://www.packtpub.com/virtualization-and-cloud/microsoft-operations-management-suite-cookbook?utm_source=github&utm_medium=repository&utm_campaign=9781786469090), published by [Packt](https://www.packtpub.com/?utm_source=github). It contains all the supporting project files necessary to work through the book from start to finish.
## About the Book
Virtual and Augmented Reality 
## Instructions and Navigation
All of the code is organized into folders. Each folder starts with a number followed by the application name. For example, Chapter02.
Chapter 03 and Chapter 05 has code files and there are 9 chpts in all:
Chapters 01, 02, 04, 06, 07, 08, 09 do not contain any code files.



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
