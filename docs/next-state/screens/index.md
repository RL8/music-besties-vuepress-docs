# Screens Overview

The Music Besties application consists of multiple screens and views that provide a comprehensive user experience for organizing, reviewing, and sharing music preferences. This section provides detailed documentation for each screen, including its components, interactions, and visual layout.

## Screen Summary

| View | Primary Purpose | Key Components | Navigation Options |
|------|----------------|----------------|------------------|
| **Dashboard View** | Main entry point displaying music era information | Era cards grid, Header bar, Selection counter, Rating display, Era emoji, History icon, Footer disclaimer | Open navigation menu, Enter edit mode, View era details, View ranking history |
| **Edit Rankings View** | Interface for selecting and ranking items with 24-hour cooldown | Header controls, Cooldown timer, Tab navigation bar, Selection counter, Instruction text, Item chips, Selection indicators | Switch tabs, Select/remove items, Change order, Save changes (once per 24 hours), Cancel editing |
| **Sidebar Panel** | Context-sensitive panel for personal journal content, community interactions, and bestie matching | Sticky header with breadcrumb navigation, Main tab navigation (Your Journal, Community, Besties), Three-layer navigation system, Song cards, Review display, Comment section, Community reviews list, Bestie match list | Navigate through three layers, Switch between tabs, View and edit reviews, Add comments, View community content, Connect with besties, Share content, Close sidebar |
| **Navigation Menu** | Global navigation system with account options | App branding, Navigation menu, Menu icons, Active indicator, Close button, Login/Register options | Navigate to section, See current location, Close menu, Access all app areas, Create account, Login |
| **Bestie Matching View** | League table of users with similar music taste | Header bar, League table, Similarity percentage, User profiles, Comparison details, Filter options | View matches, Check similarity, Explore profiles, See details, Filter results, Return to previous screen |
| **Onboarding View** | Introduction to app features with guest mode | Welcome screens, Guest mode option, Registration form, Comparison flow, Progress indicators, Skip button | Learn app features, Start as guest, Create account, Compare rankings, Track progress, Skip ahead |
| **About View** | Informational content about the application | Header bar, App description, Version information, Credits section, Text sections | Read information, Check version, See credits, Return to previous screen |
| **Profile View** | User-specific information, statistics, and sharing options | Header bar, Profile image, User information, Public link, Statistics section, Preferences area, Share button, Bestie matches | View profile data, Check activity, Access settings, Copy public link, Share profile, View besties, Return to previous screen |
| **Settings View** | User preference and privacy configuration | Header bar, Settings categories, Toggle switches, Radio buttons, Dropdown menus, Setting descriptions, Privacy controls, Account verification | Toggle options, Select preferences, Adjust display settings, Set privacy, Verify account, Return to previous screen |
| **Terms/Privacy View** | Legal documentation | Header bar, Section headers, Legal text, Data usage section, Last updated timestamp | Read legal information, Review data practices, Return to previous screen |

## Screen Relationships

The screens in the Music Besties application are interconnected through a user-centered navigation system. The following diagram illustrates the relationships between screens in v1.1:

```
+-----------------------------------------------------+
|                                                     |
|                  NAVIGATION MENU                    |
|                         |                           |
|                         v                           |
|  +------------------+  +------------------+         |
|  |                  |  |                  |         |
|  |   DASHBOARD      |  |     PROFILE      |         |
|  |                  |  |                  |         |
|  +--------+---------+  +--------+---------+         |
|           |                      |                  |
|           v                      v                  |
|  +--------+---------+  +------------------+         |
|  |                  |  |                  |         |
|  | EDIT RANKINGS    |  |  BESTIE MATCHING |         |
|  |                  |  |                  |         |
|  +--------+---------+  +------------------+         |
|           |                                         |
|           v                                         |
|  +--------+---------+  +------------------+         |
|  |                  |  |                  |         |
|  |  SIDEBAR PANEL   |  |     SETTINGS     |         |
|  | (Your Journal,   |  | (Privacy,        |         |
|  |  Community,      |  |  Verification)   |         |
|  |  Besties)        |  |                  |         |
|  +------------------+  +------------------+         |
|                                                     |
|  +------------------+  +------------------+         |
|  |                  |  |                  |         |
|  |   ONBOARDING     |  |  TERMS/PRIVACY   |         |
|  | (Guest Mode,     |  |                  |         |
|  |  Registration)   |  |                  |         |
|  +------------------+  +------------------+         |
|                                                     |
+-----------------------------------------------------+
```

Each screen is documented in detail in its own section, including:

- Screen purpose and overview
- Visual layout with ASCII diagram
- Component details specific to that screen
- User interactions and flows
- Technical implementation notes

Navigate to each screen's documentation for comprehensive details about its functionality and implementation.

## New in v1.1

Version 1.1 introduces several new screens and significant enhancements to existing screens:

- **Bestie Matching View**: A new screen that displays a league table of users with similar music taste
- **Onboarding View**: A new screen that introduces users to the app and provides guest mode options
- **Dashboard View**: Enhanced with history indicators for tracking ranking changes
- **Edit Rankings View**: Updated with a 24-hour cooldown timer between ranking saves
- **Sidebar Panel**: Redesigned with three-layer navigation and three main tabs (Your Journal, Community, Besties) for personal content, community interactions, and bestie matching
- **Profile View**: Enhanced with public profile link and bestie matches
- **Settings View**: Updated with privacy controls and Reddit account verification
- **Navigation Menu**: Enhanced with account options for guest users
