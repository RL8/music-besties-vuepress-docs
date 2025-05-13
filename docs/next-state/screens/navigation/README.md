# Navigation Menu

The Navigation Menu provides global navigation to all major sections of the Music Besties application. It slides in from the left when the user taps the hamburger menu icon. In v1.1, it has been enhanced with account options for guest users and a new "Your Besties" section for the social matching feature.

## Screen Overview

**Purpose:** Provide consistent access to all main sections of the application from any screen, with appropriate options based on authentication state

**Primary Components:**
- NavMenu.vue (container and animation)
- NavMenuItem.vue (individual menu items)
- NavHeader.vue (app branding and close button)
- AccountOptions.vue (login/register buttons for guest users)

## Visual Layout

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

*Left sidebar navigation panel showing the main menu options with visual indicators for the current selection. The panel includes the app name at the top, navigation menu items with icons, login/register buttons for guest users, and a close button. The active section (Dashboard) is highlighted to show the current location.*

## Component Details

### NavMenu.vue

The NavMenu component is the container for the navigation menu.

**Properties:**
- `isOpen` (Boolean): Whether the menu is currently open
- `activeRoute` (String): The current active route path
- `isAuthenticated` (Boolean): Whether the user is currently logged in
- `userProfile` (Object): User profile data if authenticated

**Events:**
- `@close`: Emitted when the menu should be closed
- `@navigate`: Emitted when a navigation action is triggered
- `@login`: Emitted when the login button is clicked
- `@register`: Emitted when the create account button is clicked

**Implementation Notes:**
- Slide-in animation from left side
- Semi-transparent overlay for the rest of the screen
- Focus trap for accessibility
- Touch swipe to close gesture
- Conditional display of menu items based on authentication state

### NavMenuItem.vue

The NavMenuItem component represents a single navigation option.

**Properties:**
- `id` (String): Unique identifier for the menu item
- `title` (String): Display text for the menu item
- `icon` (String): Icon to display with the menu item
- `route` (String): Route path to navigate to
- `isActive` (Boolean): Whether this item is currently active
- `requiresAuth` (Boolean): Whether this item requires authentication
- `badge` (String/Number): Optional badge to display (e.g., notification count)

**Events:**
- `@click`: Emitted when the item is clicked, includes the route

**Implementation Notes:**
- Visual indicator for active state
- Icon and text alignment
- Hover and focus states
- Accessible keyboard navigation
- Badge display for notification counts

### NavHeader.vue

The NavHeader component displays the app branding and close button.

**Properties:**
- `title` (String): The application title
- `showUserAvatar` (Boolean): Whether to display the user's avatar
- `userProfile` (Object): User profile data if authenticated

**Events:**
- `@close`: Emitted when the close button is clicked
- `@profileClick`: Emitted when the user avatar is clicked

**Implementation Notes:**
- Fixed position at the top of the menu
- Close button with clear tap target
- App branding with logo and title
- Optional user avatar display

### AccountOptions.vue

The AccountOptions component provides login and registration options for guest users.

**Properties:**
- `isAuthenticated` (Boolean): Whether the user is currently logged in
- `showButtons` (Boolean): Whether to display the login/register buttons

**Events:**
- `@login`: Emitted when the login button is clicked
- `@register`: Emitted when the create account button is clicked
- `@logout`: Emitted when the logout option is clicked (for authenticated users)

**Implementation Notes:**
- Positioned at the bottom of the navigation menu
- Primary styling for create account button
- Secondary styling for login button
- Logout option for authenticated users
- Clear visual separation from navigation items

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|---------------------------|
| Click hamburger menu icon | Opens the navigation menu | Updates `isOpen` state to true |
| Click close button | Closes the navigation menu | Emits `@close` event, updates `isOpen` state to false |
| Click menu item | Navigates to the selected section | Emits `@navigate` event with route, triggers route change |
| Click Login button | Opens login form | Emits `@login` event, navigates to login screen |
| Click Create Account button | Opens registration form | Emits `@register` event, navigates to registration screen |
| Swipe left | Closes the navigation menu | Gesture detection updates `isOpen` state to false |
| Click outside menu | Closes the navigation menu | Overlay click handler updates `isOpen` state to false |

## State Management

The Navigation Menu interacts with the following state:

- **Route State**: Current active route in the application
- **UI State**: Whether the menu is currently open or closed
- **Authentication State**: Whether the user is logged in or in guest mode
- **User Profile**: Information about the authenticated user
- **Notification State**: Counts for various notification types

## Authentication-Based Display

The Navigation Menu adapts based on the user's authentication state:

### Guest Mode
- "Your Besties" item is visible but prompts for account creation when clicked
- Login and Create Account buttons are displayed at the bottom
- Profile view shows limited information

### Authenticated Mode
- All navigation items are fully accessible
- User avatar may be displayed in the header
- Login/Create Account buttons are replaced with user information
- Logout option is available

## Accessibility Considerations

The Navigation Menu implements several accessibility features:

- Focus is trapped within the menu when open
- Escape key closes the menu
- All interactive elements have appropriate ARIA labels
- Active state is communicated to screen readers
- Keyboard navigation is fully supported
- Authentication buttons have clear purpose indicators

## Responsive Behavior

The Navigation Menu adapts to different screen sizes:
- **Mobile**: Full height, 80% width of the screen
- **Tablet**: Full height, 50% width of the screen
- **Desktop**: Full height, 25% width of the screen

## Additional Views

The Navigation Menu provides access to the following views:

### Dashboard View
The main entry point displaying music era information with history indicators.

### Profile View
Shows user-specific information, statistics, sharing options, and preferences.

### Your Besties View
New in v1.1, displays users with similar music taste for social connections.

### Settings View
Allows configuration of app preferences, notifications, and account settings.

### About View
Provides information about the application, version history, and credits.

### Terms & Privacy View
Displays legal information including terms of service and privacy policy.
