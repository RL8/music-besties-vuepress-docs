# PowerShell script to set up the next-state directory structure
# This script creates all necessary directories and README files for the v1.1 documentation

$basePath = ".\docs\next-state"

# Create main directories
$directories = @(
    "",
    "\screens",
    "\data-handling",
    "\user-interactions",
    "\user-experience",
    "\developer-guide",
    "\screens\edit-rankings",
    "\screens\sidebar-panel",
    "\screens\bestie-matching",
    "\screens\onboarding"
)

# Create all directories
foreach ($dir in $directories) {
    $path = "$basePath$dir"
    if (-not (Test-Path $path)) {
        Write-Host "Creating directory: $path"
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    } else {
        Write-Host "Directory already exists: $path"
    }
}

# Create README files for each directory
$readmeFiles = @{
    "$basePath\screens\README.md" = @"
# Screens

This section provides detailed documentation for all screens in the Music Besties application v1.1.

The application includes several key screens that work together to provide a comprehensive user experience:

- **Dashboard View**: The main entry point displaying music era information with history indicators
- **Edit Rankings View**: Interface for selecting and ranking items with 24-hour cooldown between saves
- **Sidebar Panel**: Context-sensitive panel for viewing rankings, history, and reviews
- **Bestie Matching View**: League table showing users with similar music preferences
- **Onboarding View**: Introduction flow for new users with guest mode option
- **About View**: Informational content about the application
- **Profile View**: User-specific information, statistics, and sharing options
- **Settings View**: User preference and privacy configuration
- **Terms/Privacy View**: Legal documentation
- **Left Sidebar Navigation**: Global navigation system with account options

Each screen is designed to be intuitive and user-friendly, with clear navigation paths between them.
"@

    "$basePath\data-handling\README.md" = @"
# Data Handling

This section documents how data is managed in the Music Besties application v1.1.

The application implements a comprehensive data management system that handles:

- User rankings and preferences
- Review content and ratings
- Ranking history with timestamps
- User accounts and authentication
- Social connections and bestie matches
- Privacy settings and visibility controls
- Reddit verification status

The application uses a local-first approach with cloud synchronization for key features, ensuring both performance and data availability.
"@

    "$basePath\user-interactions\README.md" = @"
# User Interactions

This section documents the interaction patterns and user flows in the Music Besties application v1.1.

The application provides intuitive interaction patterns for:

- Creating and editing rankings (with 24-hour cooldown)
- Writing and updating reviews
- Navigating between different views
- Managing account settings and privacy
- Sharing content on social media
- Finding and connecting with similar users
- Verifying Reddit account for community features
- Onboarding as a new or returning user

Each interaction is designed to be simple and intuitive while providing a rich user experience.
"@

    "$basePath\user-experience\README.md" = @"
# User Experience

This section documents the user experience considerations in the Music Besties application v1.1.

The application is designed with a focus on:

- Intuitive navigation and clear information hierarchy
- Responsive design that works across device sizes
- Consistent visual language and interaction patterns
- Thoughtful feedback and error handling
- Accessibility for all users
- Social features that foster positive community interaction
- Privacy controls that give users confidence
- Smooth onboarding for both new and returning users

The user experience is crafted to balance simplicity with powerful features, making the application approachable yet capable.
"@

    "$basePath\developer-guide\README.md" = @"
# Developer Guide

This section provides technical documentation for developers working on the Music Besties application v1.1.

The guide covers:

- Application architecture and component structure
- Data models and state management
- API integrations (Supabase, Reddit, etc.)
- Authentication and user management
- Social feature implementation
- History tracking and versioning
- Deployment and infrastructure (Vercel)
- Testing and quality assurance
- Performance optimization

This documentation is intended to help developers understand the codebase and contribute effectively to the project.
"@

    "$basePath\screens\edit-rankings\README.md" = @"
# Edit Rankings

Detailed documentation for the Edit Rankings screen in Music Besties v1.1.

This screen allows users to create and manage rankings for music eras and songs with a 24-hour cooldown between ranking saves.
"@

    "$basePath\screens\sidebar-panel\README.md" = @"
# Sidebar Panel

Detailed documentation for the Sidebar Panel in Music Besties v1.1.

The Sidebar Panel provides detailed information about a selected era, including rankings, history, and reviews, with options for social sharing.
"@

    "$basePath\screens\bestie-matching\README.md" = @"
# Bestie Matching

Detailed documentation for the Bestie Matching screen in Music Besties v1.1.

This screen displays a league table of users with similar music taste, ranked by similarity percentage, allowing users to discover and connect with others who share their preferences.
"@

    "$basePath\screens\onboarding\README.md" = @"
# Onboarding

Detailed documentation for the Onboarding screen in Music Besties v1.1.

The Onboarding screen introduces new users to the application and provides options for guest mode or account creation, with a special flow for users arriving via shared links.
"@
}

# Create each README file
foreach ($file in $readmeFiles.Keys) {
    if (-not (Test-Path $file)) {
        Write-Host "Creating file: $file"
        Set-Content -Path $file -Value $readmeFiles[$file]
    } else {
        Write-Host "File already exists: $file"
    }
}

# Create placeholder files for main documentation
$placeholderFiles = @(
    "$basePath\screens\index.md",
    "$basePath\screens\dashboard.md",
    "$basePath\screens\edit-rankings.md",
    "$basePath\screens\sidebar-panel.md",
    "$basePath\screens\navigation.md",
    "$basePath\screens\settings.md",
    "$basePath\screens\bestie-matching.md",
    "$basePath\screens\onboarding.md",
    "$basePath\components.md",
    "$basePath\interactions.md",
    "$basePath\technical.md",
    "$basePath\user-experience.md",
    "$basePath\developer-guide.md"
)

# Create placeholder content for each file
foreach ($file in $placeholderFiles) {
    $filename = Split-Path $file -Leaf
    $title = (Get-Culture).TextInfo.ToTitleCase($filename.Replace(".md", "").Replace("-", " "))
    
    if (-not (Test-Path $file)) {
        Write-Host "Creating placeholder file: $file"
        $content = @"
# $title

This documentation is being updated for Music Besties v1.1.

*Content will be added soon.*
"@
        Set-Content -Path $file -Value $content
    } else {
        Write-Host "File already exists: $file"
    }
}

Write-Host "Directory structure and README files have been set up successfully!"
