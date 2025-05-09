# Screens Summary

The Music Besties application consists of multiple screens and views that provide a comprehensive user experience for organizing, reviewing, and sharing music preferences.

## Screen Overview

| View | Primary Purpose | Key Components | Navigation Options |
|------|----------------|----------------|-----------------|
| **Dashboard View** | Main entry point displaying music era information | Era cards grid, Header bar, Selection counter, Rating display, Era emoji, History icon, Footer disclaimer | Open navigation menu, Enter edit mode, View era details, View ranking history |
| **Edit Rankings View** | Interface for selecting and ranking items with 24-hour cooldown | Header controls, Cooldown timer, Tab navigation bar, Selection counter, Instruction text, Item chips, Selection indicators | Switch tabs, Select/remove items, Change order, Save changes (once per 24 hours), Cancel editing |
| **Sidebar Panel** | Context-sensitive panel for viewing rankings, history, and reviews | Panel header, Tab navigation (Rankings, History, Review), Rankings list, History timeline, Star rating display, Review text area, Review form, Share button | Switch sidebar tabs, View rankings, Browse history, Add/edit review, Share content, Close sidebar |
| **About View** | Informational content about the application | Header bar, App description, Version information, Credits section, Text sections | Read information, Check version, See credits, Return to previous screen |
| **Profile View** | User-specific information, statistics, and sharing options | Header bar, Profile image, User information, Public link, Statistics section, Preferences area, Share button, Bestie matches | View profile data, Check activity, Access settings, Copy public link, Share profile, View besties, Return to previous screen |
| **Settings View** | User preference and privacy configuration | Header bar, Settings categories, Toggle switches, Radio buttons, Dropdown menus, Setting descriptions, Privacy controls, Account verification | Toggle options, Select preferences, Adjust display settings, Set privacy, Verify account, Return to previous screen |
| **Terms/Privacy View** | Legal documentation | Header bar, Section headers, Legal text, Data usage section, Last updated timestamp | Read legal information, Review data practices, Return to previous screen |
| **Left Sidebar Navigation** | Global navigation system with account options | App branding, Navigation menu, Menu icons, Active indicator, Close button, Login/Register options | Navigate to section, See current location, Close menu, Access all app areas, Create account, Login |
| **Bestie Matching View** | League table of users with similar music taste | Header bar, League table, Similarity percentage, User profiles, Comparison details, Filter options | View matches, Check similarity, Explore profiles, See details, Filter results, Return to previous screen |
| **Onboarding View** | Introduction to app features with guest mode | Welcome screens, Guest mode option, Registration form, Comparison flow, Progress indicators, Skip button | Learn app features, Start as guest, Create account, Compare rankings, Track progress, Skip ahead |

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
|  | 📊            |  | 📊            |  | 📊        | |
|  +---------------+  +---------------+  +----------+ |
|                                                     |
|  +---------------+  +---------------+  +----------+ |
|  | ❤️            |  | 🌊            |  | 🐍       | |
|  | Red           |  | 1989          |  | Reputation| |
|  | ★★★★★        |  | ★★★★☆        |  | ★★★★☆    | |
|  | 12/30 songs   |  | 7/16 songs    |  | 6/15 songs| |
|  | 📊            |  | 📊            |  | 📊        | |
|  +---------------+  +---------------+  +----------+ |
|                                                     |
| This is an unofficial fan-made app                  |
+-----------------------------------------------------+
```

*Detailed visualization of the responsive grid interface showing era cards with ratings, selection counts, history icons, and emoji indicators. The header includes a hamburger menu icon and Edit button, while the footer contains a disclaimer. This provides a reference for the expected visual arrangement and information hierarchy of the main screen.*

Key features of the Dashboard View include:

- Header bar with app title, hamburger menu icon, and Edit button
- Responsive grid layout of era cards (2-column on mobile, 3-column on desktop)
- Visual representation of music eras with emoji icons
- Rating indicators (1-5 stars) for each era
- Selection counter showing selected/total items for each era
- History icon (📊) indicating ranking history is available
- Footer disclaimer indicating unofficial status of the app

The Dashboard View is designed to provide a quick overview of the user's music collection and allow easy access to detailed information about each era.

## Edit Rankings View

The Edit Rankings View allows users to create and manage rankings for music eras and songs. It provides a selection-based interface with tabbed navigation for different ranking categories and enforces a 24-hour cooldown between ranking saves.

**Figure: Edit Rankings View Layout**

```
+-----------------------------------------------------+
|                   Music Besties                     |
+-----------------------------------------------------+
| [Cancel]                                    [Save]  |
+-----------------------------------------------------+
| Next save available in: 23h 45m                     |
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

*Complete interface mockup showing the header controls, cooldown timer, tab navigation, selection counter, and item chips with selection indicators. The blue highlighting and numbering on selected items illustrates the selection-based ranking approach where order is determined by selection sequence.*

Key features of the Edit Rankings View include:

- Header controls with Cancel (red) and Save (green) buttons
- Cooldown timer showing time until next ranking save is available
- Horizontally scrollable tab navigation for "Eras" and individual era names
- Selection counter showing selected/total count for each tab
- Contextual instruction text explaining the selection process
- Interactive item chips for each selectable item (era or song)
- Visual selection indicators with blue highlighting and rank numbers
- Ability to add items to ranking by tapping unselected chips
- Ability to remove items from ranking by tapping selected chips
- Reordering by removing and re-adding items in desired sequence
- Save functionality to persist selections (limited to once every 24 hours)

The Edit Rankings View is designed to be intuitive and easy to use, allowing users to create and modify their rankings while encouraging thoughtful, deliberate choices through the cooldown period.

## Sidebar Panel

The Sidebar Panel provides detailed information about a selected era, including rankings, history, and reviews. It slides in from the side when a user taps on an era card.

**Figure: Sidebar Panel Layout - Rankings Tab**

```
+-----------------------------------------------------+
|  ← Red ❤️                                  [X]     |
+-----------------------------------------------------+
|                                                     |
| | Rankings | History | Review & Notes |             |
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
| [Share Rankings]                                    |
|                                                     |
+-----------------------------------------------------+
```

*Sidebar panel showing the Rankings tab with an ordered list of selected songs. The panel includes a header with the era name and emoji, tab navigation, a count of ranked items, and a share button. The X button allows users to close the panel and return to the previous view.*

**Figure: Sidebar Panel - History Tab**

```
+-----------------------------------------------------+
|  ← Red ❤️                                  [X]     |
+-----------------------------------------------------+
|                                                     |
| | Rankings | History | Review & Notes |             |
+-----------------------------------------------------+
|                                                     |
| Ranking History:                                    |
|                                                     |
| May 9, 2025 (Current)                               |
| 1. All Too Well                                     |
| 2. State of Grace                                   |
| 3. 22                                               |
| 4. I Knew You Were Trouble                          |
| 5. Begin Again                                      |
|                                                     |
| May 5, 2025                                         |
| 1. All Too Well                                     |
| 2. 22                                               |
| 3. I Knew You Were Trouble                          |
| 4. State of Grace                                   |
| 5. Begin Again                                      |
|                                                     |
| May 1, 2025                                         |
| 1. All Too Well                                     |
| 2. I Knew You Were Trouble                          |
| 3. 22                                               |
| 4. Holy Ground                                      |
| 5. State of Grace                                   |
|                                                     |
+-----------------------------------------------------+
```

*Sidebar panel showing the History tab with a timeline of ranking changes. The panel displays multiple versions of rankings with timestamps, allowing users to see how their preferences have evolved over time.*

**Figure: Sidebar Panel - Review Tab**

```
+-----------------------------------------------------+
|  ← Red ❤️                                  [X]     |
+-----------------------------------------------------+
|                                                     |
| | Rankings | History | Review & Notes |             |
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
| [Share Review]                                      |
|                                                     |
+-----------------------------------------------------+
```

*Sidebar panel showing the Review & Notes tab with the user's rating and written review. The panel includes a star rating visualization, text review area, timestamp, Edit Review button, and Share Review button for social sharing.*

Key features of the Sidebar Panel include:

- Panel header showing the selected era name, emoji, and close button
- Tab navigation between "Rankings," "History," and "Review & Notes"
- Ordered list of ranked items for the selected category
- Timeline view showing how rankings have changed over time with timestamps
- Star rating visualization for the selected era
- Text area displaying the user's review
- Timestamp showing when the review was last updated
- Edit Review button for making changes to ratings and reviews
- Share buttons for sharing rankings and reviews on social media
- Count of ranked items versus total available
- Close button to dismiss the panel

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
| - Track your ranking history over time              |
| - Share your rankings and reviews                   |
| - Find other fans with similar music taste          |
|                                                     |
| ## Version                                          |
|                                                     |
| Version: 1.1.0                                      |
| Released: May 9, 2025                               |
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

The Profile View displays user-specific information, statistics, preferences, and sharing options.

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
| Public Profile: musicbesties.app/u/musiclover      |
| [Copy Link] [Share Profile]                         |
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
| ## Your Besties                                     |
|                                                     |
| 1. SwiftFan22 (92% match)                           |
| 2. RedLover (87% match)                             |
| 3. Folklore1989 (81% match)                         |
|                                                     |
| [View All Matches]                                  |
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

*Profile view showing user information, statistics, activity history, bestie matches, and preferences. The screen includes a profile image, shareable public link, user statistics, recent activity, top bestie matches with similarity percentages, and preference settings with an edit button.*

## Settings View

The Settings View allows users to configure application preferences, privacy options, and account verification.

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
| Bestie Matches:       [X]                           |
|                                                     |
| ## Privacy                                          |
|                                                     |
| Public Profile:       [X]                           |
| Show Rankings:        [X]                           |
| Show Reviews:         [X]                           |
| Show Besties:         [ ]                           |
|                                                     |
| ## Account Verification                             |
|                                                     |
| Reddit Account: Not Verified                        |
| [Connect Reddit Account]                            |
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

*Settings view showing configuration options organized into categories. The screen includes toggle switches, radio buttons, and action buttons for various settings, including new privacy controls and Reddit account verification. A back button in the header allows returning to the previous view.*

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
| 5. Social features require Reddit verification      |
|                                                     |
| ## Privacy Policy                                   |
|                                                     |
| Music Besties respects your privacy. We collect     |
| the following data:                                 |
|                                                     |
| - Rankings and reviews you create                   |
| - Application preferences                           |
| - Basic usage statistics                            |
| - Reddit verification status (if enabled)           |
|                                                     |
| All data is stored locally on your device unless    |
| you enable sync features. Social comparison data    |
| is processed on our servers but is subject to your  |
| privacy settings.                                   |
|                                                     |
| Last Updated: May 9, 2025                           |
|                                                     |
+-----------------------------------------------------+
```

*Terms and Privacy view showing legal information organized into sections. The screen includes the terms of service and privacy policy with a last updated timestamp. A back button in the header allows returning to the previous view.*

## Left Sidebar Navigation

The Left Sidebar Navigation provides global navigation to all major sections of the application and account options. It slides in from the left when the user taps the hamburger menu icon.

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
| □ Your Besties      |                             |
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
| [Login]             |                             |
|                     |                             |
| [Create Account]    |                             |
|                     |                             |
|                     |                             |
+---------------------+-----------------------------+
```

*Left sidebar navigation panel showing the main menu options with visual indicators for the current selection. The panel includes the app name at the top, navigation menu items with icons, login/register buttons, and a close button. The active section (Dashboard) is highlighted to show the current location.*

Key features of the Left Sidebar Navigation include:

- App branding at the top of the sidebar
- Vertical list of navigation menu items including the new "Your Besties" section
- Visual indicators showing the currently active section
- Login and Create Account buttons for guest users
- Close button to dismiss the sidebar
- Direct access to all major application sections
- Automatic closing of previous sidebar when navigating to a new section (ensures only one sidebar is open at a time)

## Bestie Matching View

The Bestie Matching View displays a league table of users with similar music taste, ranked by similarity percentage.

**Figure: Bestie Matching View Layout**

```
+-----------------------------------------------------+
|  ← Your Besties                                    |
+-----------------------------------------------------+
|                                                     |
| # Music Taste Matches                               |
|                                                     |
| Find users who share your music preferences:        |
|                                                     |
| ## League Table                                     |
|                                                     |
| 1. SwiftFan22                                       |
|    92% Match                                        |
|    Joined: April 15, 2025                           |
|    [View Profile] [Expand Details ▼]                |
|                                                     |
| 2. RedLover                                         |
|    87% Match                                        |
|    Joined: May 1, 2025                              |
|    [View Profile] [Expand Details ▼]                |
|                                                     |
| 3. Folklore1989                                     |
|    81% Match                                        |
|    Joined: April 22, 2025                           |
|    [View Profile] [Expand Details ▼]                |
|                                                     |
| 4. ReputationEra                                    |
|    78% Match                                        |
|    Joined: May 3, 2025                              |
|    [View Profile] [Expand Details ▼]                |
|                                                     |
| 5. EvermoreFan                                      |
|    75% Match                                        |
|    Joined: April 30, 2025                           |
|    [View Profile] [Expand Details ▼]                |
|                                                     |
| ## Filters                                          |
|                                                     |
| Sort By: [Match %] [Join Date] [Activity]           |
|                                                     |
+-----------------------------------------------------+
```

*Bestie Matching view showing a ranked list of users with similar music taste. The screen includes a league table with similarity percentages, join dates, profile links, and expandable details. Sorting options allow users to filter the results by different criteria.*

Key features of the Bestie Matching View include:

- Header with title and back button
- League table showing ranked list of users by similarity score
- Numerical display of match percentage for each user
- Join date information for each user
- Profile links to view public profiles
- Expandable sections to view specific matching preferences
- Filter options to sort or filter the league table
- Back button to return to the previous screen

## Onboarding View

The Onboarding View introduces new users to the application and provides options for guest mode or account creation.

**Figure: Onboarding View Layout**

```
+-----------------------------------------------------+
|                   Music Besties                     |
+-----------------------------------------------------+
|                                                     |
|                  [Welcome Image]                    |
|                                                     |
| Welcome to Music Besties!                           |
|                                                     |
| Rank, review, and share your favorite music         |
| while connecting with other fans.                   |
|                                                     |
| • Create personalized rankings                      |
| • Track how your taste evolves                      |
| • Find your music besties                           |
|                                                     |
| [Start as Guest]                                    |
|                                                     |
| [Create Account]                                    |
|                                                     |
| Already have an account? [Login]                    |
|                                                     |
| ○ ● ○ ○                                           |
|                                                     |
| [Skip]                                              |
|                                                     |
+-----------------------------------------------------+
```

*Onboarding view showing the welcome screen with app introduction and options. The screen includes a welcome image, feature highlights, guest mode button, account creation button, login link, progress indicators, and skip button.*

Key features of the Onboarding View include:

- Welcome screens introducing app features
- Guest mode option to start using the app without an account
- Registration form for creating a new account
- Special comparison flow for users arriving via shared links
- Progress indicators showing position in the onboarding flow
- Skip button to bypass detailed onboarding
- Login option for returning users
