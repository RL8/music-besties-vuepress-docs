# Deploy script for Music Besties VuePress Documentation

param (
    [Parameter(Mandatory=$false)]
    [switch]$IncrementVersion,
    
    [Parameter(Mandatory=$false)]
    [string]$ChangelogEntry = "Documentation updates"
)

# Get current version from README.md
$indexPath = ".\docs\README.md"
$content = Get-Content -Path $indexPath -Raw
$versionPattern = '\|\s*\*\*Documentation\*\*\s*\|\s*([0-9.]+)\s*\|'
$versionMatch = [regex]::Match($content, $versionPattern)

if ($versionMatch.Success) {
    $currentVersion = $versionMatch.Groups[1].Value
    Write-Host "Current version: $currentVersion"
    
    if ($IncrementVersion) {
        # Split version into parts
        $versionParts = $currentVersion.Split('.')
        
        # Increment the last part
        $lastPart = [int]$versionParts[-1]
        $versionParts[-1] = ($lastPart + 1).ToString()
        
        # Join back together
        $newVersion = [string]::Join('.', $versionParts)
        
        # Update the version and timestamp
        $timestamp = Get-Date -Format "dd MMM yyyy HH:mm"
        $content = $content -replace $versionPattern, "| **Documentation** | $newVersion | $timestamp |"
        
        # Add changelog entry
        $content = $content -replace "(\| \*\*Documentation\*\* \| [0-9.]+ \| [^|]+ \| )([^|]+)(\|)", "`$1• $ChangelogEntry`$3"
        
        # Write back to file
        Set-Content -Path $indexPath -Value $content
        
        Write-Host "Version updated to $newVersion with timestamp $timestamp"
    }
} else {
    Write-Host "Could not find current version in README.md"
    exit 1
}

# Build the documentation
Write-Host "Building documentation..."
npm run build

# Deploy to GitHub Pages
Write-Host "Deploying to GitHub Pages..."
npx gh-pages -d docs/.vuepress/dist

Write-Host "Deployment complete!"
