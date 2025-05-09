# Simple script to remove old underscore directories and files
$docsDir = "C:\Users\Bravo\CascadeProjects\music-besties-vuepress-docs\docs"

# Remove old directories
Write-Host "Removing old underscore directories..." -ForegroundColor Yellow
if (Test-Path "$docsDir\current_state") { Remove-Item -Path "$docsDir\current_state" -Recurse -Force }
if (Test-Path "$docsDir\next_state") { Remove-Item -Path "$docsDir\next_state" -Recurse -Force }
if (Test-Path "$docsDir\future_states") { Remove-Item -Path "$docsDir\future_states" -Recurse -Force }
if (Test-Path "$docsDir\core_functions") { Remove-Item -Path "$docsDir\core_functions" -Recurse -Force }

Write-Host "Old underscore directories have been removed." -ForegroundColor Green
