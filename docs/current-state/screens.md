# Screens Summary

The Music Besties application consists of multiple screens and views that provide a comprehensive user experience for organizing and reviewing music.

## Screen Overview

| View | Primary Purpose | Key Components | Navigation Options |
|------|----------------|----------------|-----------------|
| **Dashboard View** | Main entry point displaying music era information | Era cards grid, Header bar, Selection counter, Rating display, Era emoji, Footer disclaimer | Open navigation menu, Enter edit mode, View era details |
| **Edit Rankings View** | Interface for selecting and ranking items | Header controls, Tab navigation bar, Selection counter, Instruction text, Item chips, Selection indicators | Switch tabs, Select/remove items, Change order, Save/cancel changes |
| **Sidebar Panel** | Context-sensitive panel for viewing rankings and reviews | Panel header, Tab navigation, Rankings list, Star rating display, Review text area, Review form | Switch sidebar tabs, View rankings, Add/edit review, Close sidebar |
| **About View** | Informational content about the application | Header bar, App description, Version information, Credits section, Text sections | Read information, Check version, See credits, Return to previous screen |
| **Profile View** | User-specific information and statistics | Header bar, Profile image, User information, Statistics section, Preferences area | View profile data, Check activity, Access settings, Return to previous screen |
| **Settings View** | User preference configuration | Header bar, Settings categories, Toggle switches, Radio buttons, Dropdown menus, Setting descriptions | Toggle options, Select preferences, Adjust display settings, Return to previous screen |
| **Terms/Privacy View** | Legal documentation | Header bar, Section headers, Legal text, Data usage section, Last updated timestamp | Read legal information, Review data practices, Return to previous screen |
| **Left Sidebar Navigation** | Global navigation system | App branding, Navigation menu, Menu icons, Active indicator, Close button | Navigate to section, See current location, Close menu, Access all app areas |

## Dashboard View

The Dashboard View is the main entry point of the application. It displays a grid of era cards, each representing a music era that the user can interact with.

**Figure: Dashboard View Layout**

```
+-----------------------------------------------------+
|                   Music Besties                     |
+-----------------------------------------------------+
| ☰                                         [Edit]    |
+-----------------------------------------------------+
|                                                     |
|  +---------------+  +---------------+  +----------+ |
|  | 🤠            |  | 💛            |  | 💜       | |
|  | Taylor Swift  |  | Fearless      |  | Speak Now| |
|  | ★★★★☆        |  | ★★★★★        |  | ★★★☆☆    | |
|  | 5/13 songs    |  | 8/19 songs    |  | 3/16 songs| |
|  +---------------+  +---------------+  +----------+ |
|                                                     |
|  +---------------+  +---------------+  +----------+ |
|  | ❤️            |  | 🌊            |  | 🐍       | |
|  | Red           |  | 1989          |  | Reputation| |
|  | ★★★★★        |  | ★★★★☆        |  | ★★★★☆    | |
|  | 12/30 songs   |  | 7/16 songs    |  | 6/15 songs| |
|  +---------------+  +---------------+  +----------+ |
|                                                     |
| This is an unofficial fan-made app                  |
+-----------------------------------------------------+
```

*Detailed visualization of the responsive grid interface showing era cards with ratings, selection counts, and emoji indicators. The header includes a hamburger menu icon and Edit button, while the footer contains a disclaimer. This provides a reference for the expected visual arrangement and information hierarchy of the main screen.*

Key features of the Dashboard View include:

- Header bar with app title, hamburger menu icon, and Edit button
- Responsive grid layout of era cards (2-column on mobile, 3-column on desktop)
- Visual representation of music eras with emoji icons
- Rating indicators (1-5 stars) for each era
- Selection counter showing selected/total items for each era
- Footer disclaimer indicating unofficial status of the app

The Dashboard View is designed to provide a quick overview of the user's music collection and allow easy access to detailed information about each era.

## Edit Rankings View

The Edit Rankings View allows users to create and manage rankings for music eras and songs. It provides a selection-based interface with tabbed navigation for different ranking categories.

**Figure: Edit Rankings View Layout**

```
+-----------------------------------------------------+
|                   Music Besties                     |
+-----------------------------------------------------+
| [Cancel]                                    [Save]  |
+-----------------------------------------------------+
|                                                     |
| | Eras | Reputation | Red | 1989 | Folklore |      |
+-----------------------------------------------------+
| Selected: 3 of 15                                   |
| Select your favorite songs:                         |
|                                                     |
| +---------------+  +---------------+  +----------+  |
| | 1             |  | 2             |  | 3        |  |
| | All Too Well  |  | State of Grace|  | 22       |  |
| +---------------+  +---------------+  +----------+  |
|                                                     |
| +---------------+  +---------------+  +----------+  |
| | Red           |  | I Knew You    |  | We Are   |  |
| |               |  | Were Trouble  |  | Never... |  |
| +---------------+  +---------------+  +----------+  |
|                                                     |
| +---------------+  +---------------+                |
| | Begin Again   |  | Holy Ground   |                |
| |               |  |               |                |
| +---------------+  +---------------+                |
|                                                     |
+-----------------------------------------------------+
```

*Complete interface mockup showing the header controls, tab navigation, selection counter, and item chips with selection indicators. The blue highlighting and numbering on selected items illustrates the selection-based ranking approach where order is determined by selection sequence.*

Key features of the Edit Rankings View include:

- Header controls with Cancel (red) and Save (green) buttons
- Horizontally scrollable tab navigation for "Eras" and individual era names
- Selection counter showing selected/total count for each tab
- Contextual instruction text explaining the selection process
- Interactive item chips for each selectable item (era or song)
- Visual selection indicators with blue highlighting and rank numbers
- Ability to add items to ranking by tapping unselected chips
- Ability to remove items from ranking by tapping selected chips
- Reordering by removing and re-adding items in desired sequence
- Save functionality to persist selections

The Edit Rankings View is designed to be intuitive and easy to use, allowing users to quickly create and modify their rankings.

## Sidebar Panel

The Sidebar Panel provides detailed information about a selected era, including rankings and reviews. It slides in from the side when a user taps on an era card.

**Figure: Sidebar Panel Layout**

```
+-----------------------------------------------------+
|  ← Red ❤️                                  [X]     |
+-----------------------------------------------------+
|                                                     |
| | Rankings | Review & Notes |                       |
+-----------------------------------------------------+
|                                                     |
| Your Ranked Songs:                                  |
|                                                     |
| 1. All Too Well                                     |
| 2. State of Grace                                   |
| 3. 22                                               |
| 4. I Knew You Were Trouble                          |
| 5. Begin Again                                      |
|                                                     |
| Total: 5 of 19 songs ranked                         |
|                                                     |
+-----------------------------------------------------+
```

*Sidebar panel showing the Rankings tab with an ordered list of selected songs. The panel includes a header with the era name and emoji, tab navigation, and a count of ranked items. The X button allows users to close the panel and return to the previous view.*

Key features of the Sidebar Panel include:

- Panel header showing the selected era name, emoji, and close button
- Tab navigation between "Rankings" and "Review & Notes"
- Ordered list of ranked items for the selected category
- Count of ranked items versus total available
- Ability to switch between tabs to view different information
- Close button to dismiss the panel

**Figure: Sidebar Panel - Review Tab**

```
+-----------------------------------------------------+
|  ← Red ❤️                                  [X]     |
+-----------------------------------------------------+
|                                                     |
| | Rankings | Review & Notes |                       |
+-----------------------------------------------------+
|                                                     |
| Your Rating:                                        |
| ★★★★★                                           |
|                                                     |
| Your Review:                                        |
| "This album perfectly captures the emotions of      |
| heartbreak and moving on. All Too Well is an        |
| absolute masterpiece."                              |
|                                                     |
| Last updated: May 8, 2025                           |
|                                                     |
| [Edit Review]                                       |
|                                                     |
+-----------------------------------------------------+
```

*Sidebar panel showing the Review & Notes tab with the user's rating and written review. The panel includes a star rating visualization, text review area, timestamp, and an Edit Review button for making changes.*

## About View

The About View provides information about the application, including its purpose, version, and credits.

**Figure: About View Layout**

```
+-----------------------------------------------------+
|  ← About                                           |
+-----------------------------------------------------+
|                                                     |
| # Music Besties                                     |
|                                                     |
| Music Besties is a fan-made application designed    |
| to help music enthusiasts organize, rank, and       |
| review their favorite albums and songs.             |
|                                                     |
| ## Features                                         |
|                                                     |
| - Create personalized rankings of music eras        |
| - Select favorite songs from each era               |
| - Write reviews and rate albums                     |
| - Track your music preferences over time            |
|                                                     |
| ## Version                                          |
|                                                     |
| Version: 1.0.0                                      |
| Released: May 1, 2025                               |
|                                                     |
| ## Credits                                          |
|                                                     |
| Developed by: Music Besties Team                    |
| Contact: support@musicbesties.example.com           |
|                                                     |
+-----------------------------------------------------+
```

*About view showing application information, features, version details, and credits. The screen includes a back button in the header for returning to the previous view.*

## Profile View

The Profile View displays user-specific information, statistics, and preferences.

**Figure: Profile View Layout**

```
+-----------------------------------------------------+
|  ← Profile                                         |
+-----------------------------------------------------+
|                                                     |
|                   [Profile Image]                   |
|                                                     |
|                   Music Lover                       |
|                                                     |
| ## Statistics                                       |
|                                                     |
| Rankings Created: 12                                |
| Reviews Written: 8                                  |
| Favorite Era: Red                                   |
| Account Age: 24 days                                |
|                                                     |
| ## Activity                                         |
|                                                     |
| Last Ranking: May 8, 2025                           |
| Last Review: May 7, 2025                            |
|                                                     |
| ## Preferences                                      |
|                                                     |
| Theme: System Default                               |
| Notifications: On                                   |
| Data Sync: Off                                      |
|                                                     |
| [Edit Preferences]                                  |
|                                                     |
+-----------------------------------------------------+
```

*Profile view showing user information, statistics, activity history, and preferences. The screen includes a profile image, user statistics, recent activity, and preference settings with an edit button.*

## Settings View

The Settings View allows users to configure application preferences and options.

**Figure: Settings View Layout**

```
+-----------------------------------------------------+
|  ← Settings                                        |
+-----------------------------------------------------+
|                                                     |
| ## Appearance                                       |
|                                                     |
| Theme:                                              |
| ( ) Light                                           |
| ( ) Dark                                            |
| (•) System Default                                  |
|                                                     |
| ## Notifications                                    |
|                                                     |
| Enable Notifications: [X]                           |
| Ranking Reminders:    [X]                           |
| Review Reminders:     [ ]                           |
|                                                     |
| ## Data                                             |
|                                                     |
| Sync Data:            [ ]                           |
| Auto-Save:            [X]                           |
|                                                     |
| ## Advanced                                         |
|                                                     |
| [Reset All Rankings]                                |
| [Clear All Reviews]                                 |
| [Reset Application]                                 |
|                                                     |
+-----------------------------------------------------+
```

*Settings view showing configuration options organized into categories. The screen includes toggle switches, radio buttons, and action buttons for various settings. A back button in the header allows returning to the previous view.*

## Terms/Privacy View

The Terms/Privacy View provides legal information about the application's terms of service and privacy policy.

**Figure: Terms/Privacy View Layout**

```
+-----------------------------------------------------+
|  ← Terms & Privacy                                 |
+-----------------------------------------------------+
|                                                     |
| # Terms of Service and Privacy Policy              |
|                                                     |
| ## Terms of Service                                 |
|                                                     |
| Music Besties is an unofficial fan-made application |
| not affiliated with any music artist or label.      |
| By using this application, you agree to the         |
| following terms:                                    |
|                                                     |
| 1. This application is for personal use only        |
| 2. User-generated content remains your property     |
| 3. Misuse of the application is prohibited          |
| 4. Service may change without prior notice          |
|                                                     |
| ## Privacy Policy                                   |
|                                                     |
| Music Besties respects your privacy. We collect     |
| the following data:                                 |
|                                                     |
| - Rankings and reviews you create                   |
| - Application preferences                           |
| - Basic usage statistics                            |
|                                                     |
| All data is stored locally on your device unless    |
| you enable sync features.                           |
|                                                     |
| Last Updated: May 1, 2025                           |
|                                                     |
+-----------------------------------------------------+
```

*Terms and Privacy view showing legal information organized into sections. The screen includes the terms of service and privacy policy with a last updated timestamp. A back button in the header allows returning to the previous view.*

## Left Sidebar Navigation

The Left Sidebar Navigation provides global navigation to all major sections of the application. It slides in from the left when the user taps the hamburger menu icon.

**Figure: Left Sidebar Navigation Layout**

```
+---------------------+-----------------------------+
| [X]                 |                             |
+---------------------+                             |
|                     |                             |
| Music Besties       |                             |
|                     |                             |
| ■ Dashboard         |                             |
|                     |                             |
| □ Profile           |                             |
|                     |                             |
| □ Settings          |                             |
|                     |                             |
| □ About             |                             |
|                     |                             |
| □ Terms & Privacy   |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
|                     |                             |
+---------------------+-----------------------------+
```

*Left sidebar navigation panel showing the main menu options with visual indicators for the current selection. The panel includes the app name at the top, navigation menu items with icons, and a close button. The active section (Dashboard) is highlighted to show the current location.*

Key features of the Left Sidebar Navigation include:

- App branding at the top of the sidebar
- Vertical list of navigation menu items
- Visual indicators showing the currently active section
- Close button to dismiss the sidebar
- Direct access to all major application sections