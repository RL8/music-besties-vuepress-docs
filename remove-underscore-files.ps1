# PowerShell script to remove old underscore files that have been migrated to hyphen versions
# Created for Music Besties VuePress Documentation Migration

$baseDir = "C:\Users\Bravo\CascadeProjects\music-besties-vuepress-docs\docs"

# Function to check if a file exists
function FileExists {
    param (
        [string]$path
    )
    
    return Test-Path -Path $path -PathType Leaf
}

# Function to get the hyphen version path of an underscore path
function GetHyphenPath {
    param (
        [string]$underscorePath
    )
    
    # Replace underscores with hyphens in the directory names
    $hyphenPath = $underscorePath -replace "\\current_state\\", "\\current-state\\"
    $hyphenPath = $hyphenPath -replace "\\next_state\\", "\\next-state\\"
    $hyphenPath = $hyphenPath -replace "\\future_states\\", "\\future-states\\"
    $hyphenPath = $hyphenPath -replace "\\core_functions\\", "\\core-functions\\"
    $hyphenPath = $hyphenPath -replace "\\design_system\\", "\\design-system\\"
    
    # Replace underscores with hyphens in the filename (but not the extension)
    if ($hyphenPath -match "^(.*)\\([^\\]+)_([^\\]+)\.md$") {
        $directory = $matches[1]
        $firstPart = $matches[2]
        $secondPart = $matches[3]
        $hyphenPath = "$directory\\$firstPart-$secondPart.md"
    }
    
    return $hyphenPath
}

# Find all MD files with underscores in their paths
$underscoreFiles = Get-ChildItem -Path $baseDir -Recurse -Filter "*.md" | 
    Where-Object { $_.FullName -match "_" }

Write-Host "Found $($underscoreFiles.Count) files with underscores in their paths." -ForegroundColor Yellow
Write-Host "Checking if hyphen versions exist before removing..." -ForegroundColor Yellow
Write-Host ""

$filesToRemove = @()

foreach ($file in $underscoreFiles) {
    $hyphenPath = GetHyphenPath -underscorePath $file.FullName
    
    if (FileExists -path $hyphenPath) {
        Write-Host "✓ Hyphen version exists for: $($file.FullName)" -ForegroundColor Green
        Write-Host "  Hyphen version: $hyphenPath" -ForegroundColor Cyan
        $filesToRemove += $file.FullName
    } else {
        Write-Host "✗ No hyphen version found for: $($file.FullName)" -ForegroundColor Red
        Write-Host "  Expected hyphen version: $hyphenPath" -ForegroundColor Red
    }
    Write-Host ""
}

Write-Host "Summary:" -ForegroundColor Yellow
Write-Host "- Found $($underscoreFiles.Count) files with underscores" -ForegroundColor Yellow
Write-Host "- $($filesToRemove.Count) have corresponding hyphen versions and can be safely removed" -ForegroundColor Yellow
Write-Host "- $($underscoreFiles.Count - $filesToRemove.Count) do not have hyphen versions and will be kept" -ForegroundColor Yellow
Write-Host ""

# Only proceed if there are files to remove
if ($filesToRemove.Count -gt 0) {
    Write-Host "The following files will be removed:" -ForegroundColor Yellow
    foreach ($fileToRemove in $filesToRemove) {
        Write-Host "- $fileToRemove" -ForegroundColor Cyan
    }
    Write-Host ""
    
    $confirmation = Read-Host "Do you want to proceed with removing these files? (y/n)"
    
    if ($confirmation -eq 'y') {
        foreach ($fileToRemove in $filesToRemove) {
            Remove-Item -Path $fileToRemove -Force
            Write-Host "Removed: $fileToRemove" -ForegroundColor Green
        }
        Write-Host "`nRemoval completed successfully!" -ForegroundColor Green
    } else {
        Write-Host "`nOperation cancelled. No files were removed." -ForegroundColor Yellow
    }
} else {
    Write-Host "No files to remove. All files with underscores need to be migrated first." -ForegroundColor Yellow
}
