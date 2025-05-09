# Screens Overview

The Music Besties application consists of multiple screens and views that provide a comprehensive user experience for organizing and reviewing music. This section provides detailed documentation for each screen, including its components, interactions, and visual layout.

## Screen Summary

| View | Primary Purpose | Key Components | Navigation Options |
|------|----------------|----------------|-----------------|
| **Dashboard View** | Main entry point displaying music era information | Era cards grid, Header bar, Selection counter, Rating display, Era emoji, Footer disclaimer | Open navigation menu, Enter edit mode, View era details |
| **Edit Rankings View** | Interface for selecting and ranking items | Header controls, Tab navigation bar, Selection counter, Instruction text, Item chips, Selection indicators | Switch tabs, Select/remove items, Change order, Save/cancel changes |
| **Sidebar Panel** | Context-sensitive panel for viewing rankings and reviews | Panel header, Tab navigation, Rankings list, Star rating display, Review text area, Review form | Switch sidebar tabs, View rankings, Add/edit review, Close sidebar |
| **Navigation Menu** | Global navigation system | App branding, Navigation menu, Menu icons, Active indicator, Close button | Navigate to section, See current location, Close menu, Access all app areas |
| **About View** | Informational content about the application | Header bar, App description, Version information, Credits section, Text sections | Read information, Check version, See credits, Return to previous screen |
| **Profile View** | User-specific information and statistics | Header bar, Profile image, User information, Statistics section, Preferences area | View profile data, Check activity, Access settings, Return to previous screen |
| **Settings View** | User preference configuration | Header bar, Settings categories, Toggle switches, Radio buttons, Dropdown menus, Setting descriptions | Toggle options, Select preferences, Adjust display settings, Return to previous screen |
| **Terms/Privacy View** | Legal documentation | Header bar, Section headers, Legal text, Data usage section, Last updated timestamp | Read legal information, Review data practices, Return to previous screen |

## Screen Relationships

The screens in the Music Besties application are interconnected through a user-centered navigation system. The following diagram illustrates the relationships between screens:

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
|  +--------+---------+  +------------------+         |
|           |                                         |
|           v                                         |
|  +--------+---------+  +------------------+         |
|  |                  |  |                  |         |
|  | EDIT RANKINGS    |  |     SETTINGS     |         |
|  |                  |  |                  |         |
|  +--------+---------+  +------------------+         |
|           |                                         |
|           v                                         |
|  +--------+---------+  +------------------+         |
|  |                  |  |                  |         |
|  |  SIDEBAR PANEL   |  |  TERMS/PRIVACY   |         |
|  |                  |  |                  |         |
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
