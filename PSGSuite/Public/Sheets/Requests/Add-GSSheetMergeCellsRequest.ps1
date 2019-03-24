function Add-GSSheetMergeCellsRequest {
    <#
    .SYNOPSIS
    Creates a MergeCellsRequest to pass to Submit-GSSheetBatchUpdate.

    .DESCRIPTION
    Creates a MergeCellsRequest to pass to Submit-GSSheetBatchUpdate.

    .PARAMETER MergeType
    Accepts the following type: string

    .PARAMETER Range
    Accepts the following type: Google.Apis.Sheets.v4.Data.GridRange

    .EXAMPLE
    Add-GSSheetMergeCellsRequest -MergeType $mergeType -Range $range
    #>
    [OutputType('Google.Apis.Sheets.v4.Data.Request')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [string]
        $MergeType,
        [parameter()]
        [Google.Apis.Sheets.v4.Data.GridRange]
        $Range,
        [parameter(ValueFromPipeline = $true)]
        [Google.Apis.Sheets.v4.Data.Request[]]
        $Requests
    )
    Begin {
        Write-Verbose "Adding MergeCellsRequest to the pipeline"
    }
    Process {
        $Requests
    }
    End {
        $newRequest = New-Object 'Google.Apis.Sheets.v4.Data.MergeCellsRequest'
        foreach ($prop in $PSBoundParameters.Keys | Where-Object {$newRequest.PSObject.Properties.Name -contains $_}) {
            $newRequest.$prop = $PSBoundParameters[$prop]
        }
        New-Object 'Google.Apis.Sheets.v4.Data.Request' -Property @{
            MergeCell = $newRequest
        }
    }
}
