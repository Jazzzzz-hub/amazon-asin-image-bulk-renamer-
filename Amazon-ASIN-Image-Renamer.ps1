# Amazon ASIN Image Bulk Renamer
# Place this script in the same folder as:
# PT01.jpg, PT02.jpg, PT03.jpg, PT04.jpg, PT05.jpg
#
# Replace the sample ASINs below with your own Amazon ASINs.

$ASINs = @(
    "ASIN-HERE-01",
    "ASIN-HERE-02",
    "ASIN-HERE-03",
    "ASIN-HERE-04",
    "ASIN-HERE-05",
    "ASIN-HERE-06",
    "ASIN-HERE-07",
    "ASIN-HERE-08",
    "ASIN-HERE-09"
)

$imageTypes = @(
    "PT01",
    "PT02",
    "PT03",
    "PT04",
    "PT05"
)

foreach ($asin in $ASINs) {
    foreach ($type in $imageTypes) {
        $source = ".\$type.jpg"
        $destination = ".\$asin.$type.jpg"

        if (Test-Path $source) {
            Copy-Item -Path $source -Destination $destination
            Write-Host "Created: $asin.$type.jpg"
        }
        else {
            Write-Warning "Missing source image: $type.jpg"
        }
    }
}

Write-Host ""
Write-Host "Completed."
