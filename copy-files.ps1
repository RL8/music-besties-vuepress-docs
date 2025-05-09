# PowerShell script to copy files from underscore structure to hyphen structure
# Created for Music Besties VuePress Documentation Migration

# Function to create directory if it doesn't exist
function EnsureDirectoryExists {
    param (
        [string]$path
    )
    
    if (-not (Test-Path -Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created directory: $path" -ForegroundColor Green
    }
}

# Function to copy file with underscore to hyphen
function CopyWithUnderscoreToHyphen {
    param (
        [string]$sourcePath,
        [string]$destPath
    )
    
    # Create the destination directory if it doesn't exist
    $destDir = Split-Path -Path $destPath -Parent
    EnsureDirectoryExists -path $destDir
    
    # Copy the file
    Copy-Item -Path $sourcePath -Destination $destPath -Force
    Write-Host "Copied: $sourcePath -> $destPath" -ForegroundColor Cyan
}

# Base directory
$baseDir = "C:\Users\Bravo\CascadeProjects\music-besties-vuepress-docs\docs"

# Create main section directories with hyphens
$mainSections = @(
    "current-state",
    "next-state",
    "future-states",
    "core-functions",
    "sprint"
)

foreach ($section in $mainSections) {
    EnsureDirectoryExists -path "$baseDir\$section"
}

# Create subdirectories
$subDirs = @(
    "current-state\screens",
    "current-state\screens\edit-rankings",
    "current-state\screens\sidebar-panel",
    "current-state\user-interactions",
    "current-state\data-handling",
    "current-state\user-experience",
    "current-state\developer-debugger",
    "next-state\application-overview",
    "next-state\user-experience",
    "next-state\developer-guide",
    "core-functions\documentation-guide",
    "core-functions\mermaid-diagram-guide",
    "core-functions\version-control-guide",
    "core-functions\api-documentation",
    "core-functions\design-system"
)

foreach ($dir in $subDirs) {
    EnsureDirectoryExists -path "$baseDir\$dir"
}

# Define file mappings (source -> destination)
$fileMappings = @(
    # Current State
    @{ Source = "$baseDir\current_state\overview.md"; Dest = "$baseDir\current-state\overview.md" },
    @{ Source = "$baseDir\current_state\screens.md"; Dest = "$baseDir\current-state\screens.md" },
    @{ Source = "$baseDir\current_state\components.md"; Dest = "$baseDir\current-state\components.md" },
    @{ Source = "$baseDir\current_state\user_interactions.md"; Dest = "$baseDir\current-state\user-interactions.md" },
    @{ Source = "$baseDir\current_state\data_handling.md"; Dest = "$baseDir\current-state\data-handling.md" },
    @{ Source = "$baseDir\current_state\user_experience.md"; Dest = "$baseDir\current-state\user-experience.md" },
    @{ Source = "$baseDir\current_state\developer_debugger.md"; Dest = "$baseDir\current-state\developer-debugger.md" },
    
    # Current State Screens
    @{ Source = "$baseDir\current_state\screens\index.md"; Dest = "$baseDir\current-state\screens\index.md" },
    @{ Source = "$baseDir\current_state\screens\dashboard.md"; Dest = "$baseDir\current-state\screens\dashboard.md" },
    @{ Source = "$baseDir\current_state\screens\edit_rankings.md"; Dest = "$baseDir\current-state\screens\edit-rankings.md" },
    @{ Source = "$baseDir\current_state\screens\sidebar_panel.md"; Dest = "$baseDir\current-state\screens\sidebar-panel.md" },
    @{ Source = "$baseDir\current_state\screens\navigation.md"; Dest = "$baseDir\current-state\screens\navigation.md" },
    @{ Source = "$baseDir\current_state\screens\settings.md"; Dest = "$baseDir\current-state\screens\settings.md" },
    
    # Sprint
    @{ Source = "$baseDir\sprint\sprint_plan.md"; Dest = "$baseDir\sprint\sprint-plan.md" },
    
    # Next State
    @{ Source = "$baseDir\next_state\application_overview.md"; Dest = "$baseDir\next-state\application-overview.md" },
    @{ Source = "$baseDir\next_state\screens.md"; Dest = "$baseDir\next-state\screens.md" },
    @{ Source = "$baseDir\next_state\components.md"; Dest = "$baseDir\next-state\components.md" },
    @{ Source = "$baseDir\next_state\interactions.md"; Dest = "$baseDir\next-state\interactions.md" },
    @{ Source = "$baseDir\next_state\technical.md"; Dest = "$baseDir\next-state\technical.md" },
    @{ Source = "$baseDir\next_state\user_experience.md"; Dest = "$baseDir\next-state\user-experience.md" },
    @{ Source = "$baseDir\next_state\developer_guide.md"; Dest = "$baseDir\next-state\developer-guide.md" },
    
    # Future States
    @{ Source = "$baseDir\future_states\backlog.md"; Dest = "$baseDir\future-states\backlog.md" },
    @{ Source = "$baseDir\future_states\vision.md"; Dest = "$baseDir\future-states\vision.md" },
    
    # Core Functions
    @{ Source = "$baseDir\core_functions\documentation_guide.md"; Dest = "$baseDir\core-functions\documentation-guide.md" },
    @{ Source = "$baseDir\core_functions\mermaid_diagram_guide.md"; Dest = "$baseDir\core-functions\mermaid-diagram-guide.md" },
    @{ Source = "$baseDir\core_functions\version_control_guide.md"; Dest = "$baseDir\core-functions\version-control-guide.md" },
    @{ Source = "$baseDir\core_functions\security.md"; Dest = "$baseDir\core-functions\security.md" },
    @{ Source = "$baseDir\core_functions\api_documentation.md"; Dest = "$baseDir\core-functions\api-documentation.md" },
    @{ Source = "$baseDir\core_functions\deployment.md"; Dest = "$baseDir\core-functions\deployment.md" },
    
    # Design System
    @{ Source = "$baseDir\core_functions\design_system\index.md"; Dest = "$baseDir\core-functions\design-system\index.md" },
    @{ Source = "$baseDir\core_functions\design_system\foundations.md"; Dest = "$baseDir\core-functions\design-system\foundations.md" },
    @{ Source = "$baseDir\core_functions\design_system\components.md"; Dest = "$baseDir\core-functions\design-system\components.md" },
    @{ Source = "$baseDir\core_functions\design_system\patterns.md"; Dest = "$baseDir\core-functions\design-system\patterns.md" },
    @{ Source = "$baseDir\core_functions\design_system\accessibility.md"; Dest = "$baseDir\core-functions\design-system\accessibility.md" },
    @{ Source = "$baseDir\core_functions\design_system\responsive.md"; Dest = "$baseDir\core-functions\design-system\responsive.md" }
)

# Copy all files
foreach ($mapping in $fileMappings) {
    if (Test-Path -Path $mapping.Source) {
        CopyWithUnderscoreToHyphen -sourcePath $mapping.Source -destPath $mapping.Dest
    } else {
        Write-Host "Warning: Source file not found: $($mapping.Source)" -ForegroundColor Yellow
    }
}

Write-Host "`nFile copying completed successfully!" -ForegroundColor Green
Write-Host "All files have been copied from underscore paths to hyphen paths." -ForegroundColor Green
