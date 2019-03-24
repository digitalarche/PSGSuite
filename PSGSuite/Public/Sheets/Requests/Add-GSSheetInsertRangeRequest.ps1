function Add-GSSheetInsertRangeRequest {
    <#
    .SYNOPSIS
    Creates a InsertRangeRequest to pass to Submit-GSSheetBatchUpdate.

    .DESCRIPTION
    Creates a InsertRangeRequest to pass to Submit-GSSheetBatchUpdate.

    .PARAMETER Range
    Accepts the following type: Google.Apis.Sheets.v4.Data.GridRange

    .PARAMETER ShiftDimension
    Accepts the following type: string

    .EXAMPLE
    Add-GSSheetInsertRangeRequest -Range $range -ShiftDimension $shiftDimension
    #>
    [OutputType('Google.Apis.Sheets.v4.Data.Request')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [Google.Apis.Sheets.v4.Data.GridRange]
        $Range,
        [parameter()]
        [string]
        $ShiftDimension,
        [parameter(ValueFromPipeline = $true)]
        [Google.Apis.Sheets.v4.Data.Request[]]
        $Requests
    )
    Begin {
        Write-Verbose "Adding InsertRangeRequest to the pipeline"
    }
    Process {
        $Requests
    }
    End {
        $newRequest = New-Object 'Google.Apis.Sheets.v4.Data.InsertRangeRequest'
        foreach ($prop in $PSBoundParameters.Keys | Where-Object {$newRequest.PSObject.Properties.Name -contains $_}) {
            $newRequest.$prop = $PSBoundParameters[$prop]
        }
        New-Object 'Google.Apis.Sheets.v4.Data.Request' -Property @{
            InsertRang = $newRequest
        }
    }
}
