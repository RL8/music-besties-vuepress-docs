# PowerShell script to create README.md files for all directories missing them
# Created for Music Besties VuePress Documentation Migration

$baseDir = "C:\Users\Bravo\CascadeProjects\music-besties-vuepress-docs\docs"

# Function to create a README.md file with appropriate content
function CreateReadme {
    param (
        [string]$directory,
        [string]$title,
        [string]$description,
        [array]$links = @()
    )
    
    $readmePath = Join-Path -Path $directory -ChildPath "README.md"
    
    # Skip if README.md already exists
    if (Test-Path -Path $readmePath) {
        Write-Host "README.md already exists in $directory" -ForegroundColor Yellow
        return
    }
    
    # Build content
    $content = "# $title`n`n$description`n"
    
    if ($links.Count -gt 0) {
        $content += "`n## Contents`n`n"
        foreach ($link in $links) {
            $content += "- [$($link.Title)]($($link.Url))`n"
        }
    }
    
    $content += "`nSelect a topic from the sidebar to learn more about specific aspects of this section.`n"
    
    # Create the file
    Set-Content -Path $readmePath -Value $content
    Write-Host "Created README.md in $directory" -ForegroundColor Green
}

# Define directories and their README content
$readmeConfigs = @(
    @{
        Directory = "$baseDir\core-functions\design-system"
        Title = "Design System"
        Description = "This section provides documentation for the design system used in the Music Besties application, including foundations, components, patterns, and accessibility guidelines."
        Links = @(
            @{ Title = "Overview"; Url = "./index.html" },
            @{ Title = "Foundations"; Url = "./foundations.html" },
            @{ Title = "Components"; Url = "./components.html" },
            @{ Title = "Patterns"; Url = "./patterns.html" },
            @{ Title = "Accessibility"; Url = "./accessibility.html" },
            @{ Title = "Responsive Design"; Url = "./responsive.html" }
        )
    },
    @{
        Directory = "$baseDir\core-functions\api-documentation"
        Title = "API Documentation"
        Description = "This section provides comprehensive documentation for the APIs used in the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\core-functions\documentation-guide"
        Title = "Documentation Guide"
        Description = "This section provides guidelines for creating and maintaining documentation for the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\core-functions\mermaid-diagram-guide"
        Title = "Mermaid Diagram Guide"
        Description = "This section provides guidelines for creating and using Mermaid diagrams in the Music Besties documentation."
        Links = @()
    },
    @{
        Directory = "$baseDir\core-functions\version-control-guide"
        Title = "Version Control Guide"
        Description = "This section provides guidelines for using version control with the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\current-state\data-handling"
        Title = "Data Handling"
        Description = "This section provides documentation for how data is handled in the current version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\current-state\developer-debugger"
        Title = "Developer Debugger"
        Description = "This section provides documentation for the developer debugging tools available in the current version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\current-state\user-experience"
        Title = "User Experience"
        Description = "This section provides documentation for the user experience aspects of the current version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\current-state\user-interactions"
        Title = "User Interactions"
        Description = "This section provides documentation for the user interactions in the current version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\current-state\screens\edit-rankings"
        Title = "Edit Rankings Screen"
        Description = "This section provides documentation for the Edit Rankings screen in the current version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\current-state\screens\sidebar-panel"
        Title = "Sidebar Panel"
        Description = "This section provides documentation for the Sidebar Panel in the current version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\next-state\application-overview"
        Title = "Application Overview"
        Description = "This section provides an overview of the next version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\next-state\developer-guide"
        Title = "Developer Guide"
        Description = "This section provides a guide for developers working on the next version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\next-state\user-experience"
        Title = "User Experience"
        Description = "This section provides documentation for the user experience aspects of the next version of the Music Besties application."
        Links = @()
    },
    @{
        Directory = "$baseDir\sprint\sprint-plan"
        Title = "Sprint Plan"
        Description = "This section provides the sprint plan for developing the next version of the Music Besties application."
        Links = @()
    }
)

# Create README.md files
Write-Host "Creating README.md files for directories that don't have them..." -ForegroundColor Yellow

foreach ($config in $readmeConfigs) {
    # Ensure directory exists
    if (Test-Path -Path $config.Directory -PathType Container) {
        CreateReadme -directory $config.Directory -title $config.Title -description $config.Description -links $config.Links
    } else {
        Write-Host "Directory does not exist: $($config.Directory)" -ForegroundColor Red
    }
}

Write-Host "`nREADME.md creation completed!" -ForegroundColor Green
Write-Host "All directories should now have appropriate README.md files." -ForegroundColor Green
