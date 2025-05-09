# Edit Rankings View

The Edit Rankings View provides an interface for users to select and rank items within a specific music era, with a new 24-hour cooldown period between ranking saves to encourage thoughtful, deliberate choices.

## Screen Overview

**Purpose:** Allow users to select favorite songs from an era and arrange them in a personalized ranking order, with a deliberate approach enforced by the cooldown period

**Primary Components:**
- CooldownTimer.vue (displays time until next ranking save is available)
- SelectionTabs.vue (tab navigation between eras)
- ItemChip.vue (multiple instances for selectable songs)
- HeaderControls.vue (cancel/save buttons, title)
- SelectionCounter.vue (shows progress)

## Visual Layout

```
+-----------------------------------------------------+
|                   Music Besties                     |
+-----------------------------------------------------+
| [Cancel]                                    [Save]  |
+-----------------------------------------------------+
| Next save available in: 23h 45m                     |
+-----------------------------------------------------+
|                                                     |
| Taylor Swift | Fearless | Red | 1989 | Reputation  |
+-----------------------------------------------------+
|                                                     |
| Select your favorite songs from Red (12/30)         |
|                                                     |
| [✓] All Too Well                                    |
| [✓] State of Grace                                  |
| [✓] 22                                              |
| [✓] I Knew You Were Trouble                         |
| [✓] We Are Never Ever Getting Back Together         |
| [ ] Begin Again                                     |
| [ ] Red                                             |
| [ ] Treacherous                                     |
| [ ] I Almost Do                                     |
| [ ] Stay Stay Stay                                  |
| [ ] The Last Time                                   |
| [ ] Holy Ground                                     |
| [ ] Sad Beautiful Tragic                            |
| [ ] The Lucky One                                   |
|                                                     |
+-----------------------------------------------------+
```

*Edit Rankings view showing the song selection interface with checkboxes for each song. The header includes cancel and save buttons, while a cooldown timer shows time until the next ranking save is available. Tabs allow switching between different eras, and a selection counter shows progress (12/30).*

## Component Details

### CooldownTimer.vue

The CooldownTimer component displays the time remaining until the next ranking save is available.

**Properties:**
- `lastSaveTime` (Date): Timestamp of the last ranking save
- `cooldownHours` (Number): Number of hours required between saves (default: 24)
- `saveEnabled` (Boolean): Whether saving is currently allowed

**Events:**
- `@cooldownComplete`: Emitted when the cooldown period has elapsed

**Implementation Notes:**
- Displays time in "XXh YYm" format
- Updates in real-time
- Changes color when cooldown is complete
- Provides tooltip with exact date/time when save will be available

### SelectionTabs.vue

The SelectionTabs component provides navigation between different eras.

**Properties:**
- `tabs` (Array): List of tab objects with `id`, `title`, and `active` properties
- `activeTabId` (String): ID of the currently active tab

**Events:**
- `@tabChange`: Emitted when a tab is clicked, includes the tab ID

**Implementation Notes:**
- Horizontally scrollable on mobile devices
- Visual indicator for the active tab
- Badge showing selection count for each tab

### ItemChip.vue

The ItemChip component represents a selectable item (song) in the list.

**Properties:**
- `id` (String): Unique identifier for the item
- `title` (String): Display text for the item
- `selected` (Boolean): Whether the item is currently selected
- `disabled` (Boolean): Whether the item can be selected

**Events:**
- `@toggle`: Emitted when the selection state changes, includes item ID and new state

**Implementation Notes:**
- Checkbox visual with custom styling
- Accessible keyboard interaction
- Touch-friendly tap area

### HeaderControls.vue

The HeaderControls component provides action buttons for the edit interface.

**Properties:**
- `title` (String): The title to display in the header
- `showCancel` (Boolean): Whether to show the cancel button
- `showSave` (Boolean): Whether to show the save button
- `saveDisabled` (Boolean): Whether the save button should be disabled
- `cooldownActive` (Boolean): Whether the cooldown period is still active

**Events:**
- `@cancel`: Emitted when the cancel button is clicked
- `@save`: Emitted when the save button is clicked

### SelectionCounter.vue

The SelectionCounter component displays progress information.

**Properties:**
- `selectedCount` (Number): Number of currently selected items
- `totalCount` (Number): Total number of available items
- `categoryName` (String): Name of the current category (era)

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|---------------------------|
| Click a tab | Changes to that era's song list | Emits `@tabChange` event, updates active tab state |
| Click an item chip | Toggles selection state | Emits `@toggle` event, updates selection state |
| Click Cancel button | Discards changes and returns to Dashboard | Emits `@cancel` event, triggers route change |
| Click Save button | Saves selections and returns to Dashboard (if cooldown period has elapsed) | Emits `@save` event, updates user data, triggers route change |
| Hover over cooldown timer | Shows tooltip with exact time when save will be available | Uses browser's native tooltip functionality |

## State Management

The Edit Rankings View interacts with the following state:

- **Era Data**: Static information about each era and its songs
- **User Selections**: Dynamic data about user's current selections
- **Temporary Edit State**: Tracks changes during the editing session
- **Cooldown State**: Tracks when the last save occurred and when the next save is allowed
- **Ranking History**: Records each version of rankings with timestamps

## Cooldown Implementation

The 24-hour cooldown feature is implemented as follows:

1. When a user saves their rankings, the current timestamp is stored
2. The save button is disabled until 24 hours have elapsed since the last save
3. A timer displays the remaining time until the next save is available
4. If a user attempts to save before the cooldown period has elapsed, a message explains the feature
5. Users can still make changes to their rankings during the cooldown period, but cannot save them
6. When the cooldown period elapses, the save button becomes enabled and the timer changes color

This feature encourages users to be more deliberate about their rankings and creates a sense of anticipation for the next ranking session.

## Drag and Drop Implementation

In addition to selection, the Edit Rankings View supports drag and drop for reordering selected items:

- Selected items appear in a separate "Your Rankings" section
- Items can be dragged to change their position in the ranking
- Visual feedback indicates valid drop targets
- Accessibility is maintained with keyboard reordering options

## Responsive Behavior

The Edit Rankings View adapts to different screen sizes:
- **Mobile**: Scrollable tabs, vertical list of items, cooldown timer takes full width
- **Tablet**: Wider layout with more visible tabs, cooldown timer aligned right
- **Desktop**: Two-column layout with selections and available items side by side
