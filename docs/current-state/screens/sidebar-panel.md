# Sidebar Panel

The Sidebar Panel is a context-sensitive panel that slides in from the right side of the screen, providing detailed information and interaction options for a specific music era.

## Screen Overview

**Purpose:** Display detailed rankings and review information for a selected era, allowing users to view and edit their personalized content

**Primary Components:**
- PanelHeader.vue (title, back button, close button)
- TabNavigation.vue (tab switching between rankings and reviews)
- RankingsList.vue (ordered list of selected songs)
- ReviewForm.vue (rating input and review text area)

## Visual Layout

### Rankings Tab

```
+-----------------------------------------------------+
|  ← Red ❤️                                  [X]     |
+-----------------------------------------------------+
|                                                     |
| | Rankings | Review & Notes |                       |
+-----------------------------------------------------+
|                                                     |
| Your Rankings:                                      |
|                                                     |
| 1. All Too Well                                     |
| 2. State of Grace                                   |
| 3. 22                                               |
| 4. I Knew You Were Trouble                          |
| 5. We Are Never Ever Getting Back Together          |
| 6. Begin Again                                      |
| 7. Red                                              |
| 8. Treacherous                                      |
| 9. I Almost Do                                      |
| 10. Stay Stay Stay                                  |
| 11. The Last Time                                   |
| 12. Holy Ground                                     |
|                                                     |
| 12/30 songs ranked                                  |
|                                                     |
+-----------------------------------------------------+
```

*Sidebar panel showing the Rankings tab with an ordered list of selected songs. The panel includes a header with the era name and emoji, tab navigation, and a count of ranked items versus total available.*

### Review Tab

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

## Component Details

### PanelHeader.vue

The PanelHeader component displays the title and navigation controls for the sidebar panel.

**Properties:**
- `title` (String): The title to display (era name)
- `emoji` (String): Optional emoji to display with the title
- `showBackButton` (Boolean): Whether to show the back button
- `showCloseButton` (Boolean): Whether to show the close button

**Events:**
- `@back`: Emitted when the back button is clicked
- `@close`: Emitted when the close button is clicked

**Implementation Notes:**
- Fixed position at the top of the panel
- Title is truncated with ellipsis if too long
- Back button is only shown in nested views

### TabNavigation.vue

The TabNavigation component allows switching between different content tabs.

**Properties:**
- `tabs` (Array): List of tab objects with `id`, `title`, and `active` properties
- `activeTabId` (String): ID of the currently active tab

**Events:**
- `@tabChange`: Emitted when a tab is clicked, includes the tab ID

**Implementation Notes:**
- Visual indicator for the active tab
- Equal width distribution for tabs
- Accessible keyboard navigation

### RankingsList.vue

The RankingsList component displays the ordered list of selected songs.

**Properties:**
- `items` (Array): List of ranked items with `id`, `title`, and `rank` properties
- `totalCount` (Number): Total number of available items
- `editable` (Boolean): Whether the list can be reordered

**Events:**
- `@reorder`: Emitted when items are reordered, includes the new order

**Implementation Notes:**
- Numbered list with rank indicators
- Read-only by default, can be made editable
- Shows count of ranked items versus total

### ReviewForm.vue

The ReviewForm component allows users to rate and review an era.

**Properties:**
- `rating` (Number): Current rating value (1-5)
- `review` (String): Current review text
- `lastUpdated` (Date): Timestamp of the last update
- `readOnly` (Boolean): Whether the form is in read-only mode

**Events:**
- `@ratingChange`: Emitted when the rating is changed
- `@reviewChange`: Emitted when the review text is changed
- `@save`: Emitted when the form is submitted
- `@edit`: Emitted when the edit button is clicked in read-only mode

**Implementation Notes:**
- Star rating input with interactive hover states
- Expandable text area for review content
- Timestamp display for last update
- Toggle between read-only and edit modes

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|--------------------------|
| Click close button | Closes the sidebar panel | Emits `@close` event, updates UI state |
| Click tab | Switches between Rankings and Review tabs | Emits `@tabChange` event, updates active tab state |
| Click Edit Review button | Switches review form to edit mode | Emits `@edit` event, updates form state |
| Change rating | Updates the star rating display | Emits `@ratingChange` event, updates rating state |
| Enter review text | Updates the review content | Emits `@reviewChange` event, updates review state |
| Submit review form | Saves the rating and review | Emits `@save` event, updates user data |

## State Management

The Sidebar Panel interacts with the following state:

- **Era Data**: Static information about the selected era
- **User Rankings**: User's current song rankings for the era
- **User Reviews**: User's rating and review text for the era

## Animation and Transitions

The Sidebar Panel includes smooth animations for a polished user experience:

- Slide-in animation when opening
- Slide-out animation when closing
- Fade transitions between tabs
- Subtle hover effects on interactive elements

## Responsive Behavior

The Sidebar Panel adapts to different screen sizes:
- **Mobile**: Full-width panel with optimized touch targets
- **Tablet**: 70% width panel with more content visible
- **Desktop**: 30% width panel with fixed position
