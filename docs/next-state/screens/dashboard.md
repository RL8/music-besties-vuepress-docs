# Dashboard View

The Dashboard View is the main entry point of the Music Besties application. It displays a grid of era cards, each representing a music era that the user can interact with, including new history indicators for tracking ranking changes over time.

## Screen Overview

**Purpose:** Provide a visual overview of all music eras and their current status (ratings, selections, history)

**Primary Components:**
- EraCard.vue (multiple instances in grid layout)
- HeaderBar.vue (app title, navigation menu, edit button)
- HistoryIndicator.vue (shows ranking history availability)
- FooterDisclaimer.vue (legal text)

## Visual Layout

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

*Detailed visualization of the responsive grid interface showing era cards with ratings, selection counts, history indicators, and emoji icons. The header includes a hamburger menu icon and Edit button, while the footer contains a disclaimer.*

## Component Details

### EraCard.vue

The EraCard component displays information about a single music era.

**Properties:**
- `title` (String): The name of the era
- `emoji` (String): Emoji character representing the era
- `rating` (Number): User rating from 1-5
- `selectedCount` (Number): Number of songs selected from this era
- `totalCount` (Number): Total number of songs available in this era
- `hasHistory` (Boolean): Whether this era has ranking history available

**Events:**
- `@click`: Emitted when the card is clicked, opens the sidebar panel
- `@longpress`: Emitted when the card is long-pressed, shows additional options
- `@historyClick`: Emitted when the history indicator is clicked

**Implementation Notes:**
- Responsive design adjusts to different screen sizes
- Rating is displayed using star icons (★)
- Selection count shows as "X/Y songs" format
- History indicator (📊) shows when ranking history is available

### HeaderBar.vue

The HeaderBar component provides navigation and action controls.

**Properties:**
- `title` (String): The application title
- `showEditButton` (Boolean): Whether to display the edit button
- `userLoggedIn` (Boolean): Whether a user is currently logged in

**Events:**
- `@menuClick`: Emitted when the hamburger menu icon is clicked
- `@editClick`: Emitted when the edit button is clicked
- `@profileClick`: Emitted when the profile icon is clicked (if user is logged in)

**Slots:**
- `right`: Optional slot for additional right-aligned controls

### HistoryIndicator.vue

The HistoryIndicator component displays a visual indicator that ranking history is available.

**Properties:**
- `historyCount` (Number): Number of historical ranking entries available
- `lastUpdated` (Date): Date of the most recent ranking update

**Events:**
- `@click`: Emitted when the indicator is clicked

**Implementation Notes:**
- Uses a chart icon (📊) to represent history
- Shows a tooltip with last updated date on hover

### FooterDisclaimer.vue

The FooterDisclaimer component displays legal text at the bottom of the screen.

**Properties:**
- `text` (String): The disclaimer text to display

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|---------------------------|
| Click hamburger menu icon | Opens the left navigation menu | Emits `@menuClick` event, handled by App.vue |
| Click Edit button | Navigates to Edit Rankings View | Emits `@editClick` event, triggers route change |
| Click on an era card | Opens the Sidebar Panel with era details | Emits card `@click` event with era ID |
| Click on history indicator | Opens the Sidebar Panel with History tab active | Emits `@historyClick` event with era ID |
| Long-press on an era card | Shows additional options menu | Emits card `@longpress` event |

## State Management

The Dashboard View interacts with the following state:

- **User Preferences**: Determines display options and sort order
- **Era Data**: Static information about each era (title, emoji, total songs)
- **User Selections**: Dynamic data about user's selections and ratings
- **Ranking History**: Historical data about how rankings have changed over time
- **Authentication State**: Information about the current user's login status

## Responsive Behavior

The Dashboard adapts to different screen sizes:
- **Mobile**: Single column of era cards
- **Tablet**: Two columns of era cards
- **Desktop**: Three or more columns of era cards

## Accessibility Considerations

- All interactive elements have appropriate ARIA labels
- Color contrast meets WCAG AA standards
- Keyboard navigation is fully supported
- History indicators have descriptive text for screen readers
