# Navigation Menu

The Navigation Menu provides global navigation to all major sections of the Music Besties application. It slides in from the left when the user taps the hamburger menu icon.

## Screen Overview

**Purpose:** Provide consistent access to all main sections of the application from any screen

**Primary Components:**
- NavMenu.vue (container and animation)
- NavMenuItem.vue (individual menu items)
- NavHeader.vue (app branding and close button)

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

## Component Details

### NavMenu.vue

The NavMenu component is the container for the navigation menu.

**Properties:**
- `isOpen` (Boolean): Whether the menu is currently open
- `activeRoute` (String): The current active route path

**Events:**
- `@close`: Emitted when the menu should be closed
- `@navigate`: Emitted when a navigation action is triggered

**Implementation Notes:**
- Slide-in animation from left side
- Semi-transparent overlay for the rest of the screen
- Focus trap for accessibility
- Touch swipe to close gesture

### NavMenuItem.vue

The NavMenuItem component represents a single navigation option.

**Properties:**
- `id` (String): Unique identifier for the menu item
- `title` (String): Display text for the menu item
- `icon` (String): Icon to display with the menu item
- `route` (String): Route path to navigate to
- `isActive` (Boolean): Whether this item is currently active

**Events:**
- `@click`: Emitted when the item is clicked, includes the route

**Implementation Notes:**
- Visual indicator for active state
- Icon and text alignment
- Hover and focus states
- Accessible keyboard navigation

### NavHeader.vue

The NavHeader component displays the app branding and close button.

**Properties:**
- `title` (String): The application title

**Events:**
- `@close`: Emitted when the close button is clicked

**Implementation Notes:**
- Fixed position at the top of the menu
- Close button with clear tap target
- App branding with logo and title

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|--------------------------|
| Click hamburger menu icon | Opens the navigation menu | Updates `isOpen` state to true |
| Click close button | Closes the navigation menu | Emits `@close` event, updates `isOpen` state to false |
| Click menu item | Navigates to the selected section | Emits `@navigate` event with route, triggers route change |
| Swipe left | Closes the navigation menu | Gesture detection updates `isOpen` state to false |
| Click outside menu | Closes the navigation menu | Overlay click handler updates `isOpen` state to false |

## State Management

The Navigation Menu interacts with the following state:

- **Route State**: Current active route in the application
- **UI State**: Whether the menu is currently open or closed

## Accessibility Considerations

The Navigation Menu implements several accessibility features:

- Focus is trapped within the menu when open
- Escape key closes the menu
- All interactive elements have appropriate ARIA labels
- Active state is communicated to screen readers
- Keyboard navigation is fully supported

## Responsive Behavior

The Navigation Menu adapts to different screen sizes:
- **Mobile**: Full height, 80% width of the screen
- **Tablet**: Full height, 50% width of the screen
- **Desktop**: Full height, 25% width of the screen

## Additional Views

The Navigation Menu provides access to the following additional views:

### About View
Displays information about the application, version details, and credits.

### Profile View
Shows user-specific information, statistics, and preferences.

### Settings View
Allows configuration of application preferences and options.

### Terms/Privacy View
Provides legal information about terms of service and privacy policy.
