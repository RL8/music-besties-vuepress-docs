# Settings and Utility Screens

This section covers the utility screens in the Music Besties application, including Settings, Profile, About, and Terms/Privacy views. In v1.1, these screens have been enhanced with privacy controls and Reddit account verification features.

## Settings View

The Settings View allows users to configure application preferences, privacy options, and account verification.

### Screen Overview

**Purpose:** Provide user control over application behavior, appearance, data management, privacy settings, and account verification

**Primary Components:**
- SettingsHeader.vue (title and back button)
- SettingsGroup.vue (category grouping)
- SettingsToggle.vue (boolean settings)
- SettingsRadio.vue (option selection)
- SettingsButton.vue (action buttons)
- PrivacyControls.vue (visibility settings for public profile)
- RedditVerification.vue (Reddit account connection and verification)

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

#### PrivacyControls.vue

The PrivacyControls component provides options to control what's visible on the user's public profile.

**Properties:**
- `privacySettings` (Object): Current privacy settings
- `isPublicProfileEnabled` (Boolean): Whether the public profile is enabled

**Events:**
- `@change`: Emitted when any privacy setting changes, includes updated settings

**Implementation Notes:**
- Dependent toggles (sub-settings are disabled if parent setting is off)
- Visual indicators for what's visible to others
- Explanatory tooltips for each privacy option
- Preview option to see how profile appears to others

#### RedditVerification.vue

The RedditVerification component handles Reddit account connection and verification.

**Properties:**
- `verificationStatus` (String): Current status ("not_verified", "pending", "verified", "failed")
- `redditUsername` (String): Connected Reddit username if available
- `verificationDetails` (Object): Additional verification information

**Events:**
- `@connect`: Emitted when the connect button is clicked
- `@disconnect`: Emitted when the disconnect button is clicked
- `@requestManualReview`: Emitted when manual review is requested

**Implementation Notes:**
- OAuth integration with Reddit
- Status indicators for verification process
- Error handling for failed verifications
- Manual review request option
- Explanation of verification benefits

## Profile View

The Profile View displays user-specific information, statistics, sharing options, and preferences.

### Screen Overview

**Purpose:** Show user information, activity statistics, and sharing options

**Primary Components:**
- ProfileHeader.vue (title and back button)
- ProfileImage.vue (user avatar)
- PublicLinkSection.vue (shareable profile link)
- StatisticsSection.vue (user activity stats)
- BestieMatchesSection.vue (top matching users)
- PreferencesSection.vue (user preferences)
- ShareButton.vue (social sharing functionality)

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

## Common Patterns

All utility screens share these common implementation patterns:

### Navigation Flow

- All screens are accessible from the main navigation menu
- Each screen has a back button to return to the previous view
- Settings and Profile views are interconnected with navigation links
- Privacy settings affect what's visible on the public profile

### State Management

- Settings changes are applied immediately and persisted
- Profile information reflects current application state and privacy settings
- About and Terms/Privacy views display static content
- Authentication state determines available features

### Responsive Design

- All screens adapt to different device sizes
- Content is scrollable on smaller screens
- Touch targets are appropriately sized for mobile use
- Complex forms collapse to single-column on mobile

### Accessibility

- All screens support keyboard navigation
- Semantic HTML structure for screen readers
- Sufficient color contrast for readability
- Status messages for verification processes

## Reddit Verification Flow

The Reddit verification process follows these steps:

1. User clicks "Connect Reddit Account" in Settings
2. OAuth authorization flow opens in a browser window
3. User grants permission to the Music Besties application
4. Application checks for subscription to positive fan communities
5. If verification succeeds, user is shown a success message
6. If verification fails, user is shown the reason and options for manual review
7. Verified users gain access to social features like Bestie Matching

This verification ensures a positive community experience by confirming users are genuine fans.
