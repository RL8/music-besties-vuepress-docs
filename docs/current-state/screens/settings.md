# Settings and Utility Screens

This section covers the utility screens in the Music Besties application, including Settings, Profile, About, and Terms/Privacy views.

## Settings View

The Settings View allows users to configure application preferences and options.

### Screen Overview

**Purpose:** Provide user control over application behavior, appearance, and data management

**Primary Components:**
- SettingsHeader.vue (title and back button)
- SettingsGroup.vue (category grouping)
- SettingsToggle.vue (boolean settings)
- SettingsRadio.vue (option selection)
- SettingsButton.vue (action buttons)

### Visual Layout

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

### Component Details

#### SettingsHeader.vue

The SettingsHeader component displays the title and back button.

**Properties:**
- `title` (String): The title to display
- `showBackButton` (Boolean): Whether to show the back button

**Events:**
- `@back`: Emitted when the back button is clicked

#### SettingsGroup.vue

The SettingsGroup component groups related settings under a category.

**Properties:**
- `title` (String): The category title
- `description` (String): Optional description text

**Slots:**
- `default`: Content slot for settings controls

#### SettingsToggle.vue

The SettingsToggle component provides a toggle switch for boolean settings.

**Properties:**
- `id` (String): Unique identifier for the setting
- `label` (String): Display text for the setting
- `value` (Boolean): Current toggle state
- `disabled` (Boolean): Whether the toggle is interactive

**Events:**
- `@change`: Emitted when the toggle state changes, includes new value

#### SettingsRadio.vue

The SettingsRadio component provides radio button selection for mutually exclusive options.

**Properties:**
- `name` (String): Group name for the radio buttons
- `options` (Array): List of option objects with `id`, `label`, and `value` properties
- `selectedValue` (Any): Currently selected value
- `disabled` (Boolean): Whether the radio buttons are interactive

**Events:**
- `@change`: Emitted when the selection changes, includes new value

#### SettingsButton.vue

The SettingsButton component provides action buttons for settings operations.

**Properties:**
- `id` (String): Unique identifier for the button
- `label` (String): Display text for the button
- `variant` (String): Visual style variant (default, primary, danger)
- `disabled` (Boolean): Whether the button is interactive

**Events:**
- `@click`: Emitted when the button is clicked

## Profile View

The Profile View displays user-specific information, statistics, and preferences.

### Screen Overview

**Purpose:** Show user information and activity statistics

**Primary Components:**
- ProfileHeader.vue (title and back button)
- ProfileImage.vue (user avatar)
- StatisticsSection.vue (user activity stats)
- PreferencesSection.vue (user preferences)

### Visual Layout

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

## About View

The About View provides information about the application, including its purpose, version, and credits.

### Screen Overview

**Purpose:** Display application information and credits

**Primary Components:**
- AboutHeader.vue (title and back button)
- VersionInfo.vue (version and release date)
- FeaturesList.vue (application features)
- CreditsSection.vue (development credits)

### Visual Layout

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

## Terms/Privacy View

The Terms/Privacy View provides legal information about the application's terms of service and privacy policy.

### Screen Overview

**Purpose:** Display legal information and data usage policies

**Primary Components:**
- LegalHeader.vue (title and back button)
- TermsSection.vue (terms of service)
- PrivacySection.vue (privacy policy)
- LastUpdatedInfo.vue (timestamp)

### Visual Layout

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

## Common Patterns

All utility screens share these common implementation patterns:

### Navigation Flow

- All screens are accessible from the main navigation menu
- Each screen has a back button to return to the previous view
- Settings and Profile views are interconnected with navigation links

### State Management

- Settings changes are applied immediately and persisted
- Profile information is read-only and reflects current application state
- About and Terms/Privacy views display static content

### Responsive Design

- All screens adapt to different device sizes
- Content is scrollable on smaller screens
- Touch targets are appropriately sized for mobile use

### Accessibility

- All screens support keyboard navigation
- Semantic HTML structure for screen readers
- Sufficient color contrast for readability
