# Sidebar Panel

The Sidebar Panel is a context-sensitive panel that slides in from the right side of the screen, providing detailed information and interaction options for individual songs within a specific music era. In v1.1, it has been redesigned to focus on song-level reviews and comments rather than era-level content, with a clear separation between personal and community content.

## Screen Overview

**Purpose:** Display a user's ranked songs within an era, allowing them to review and comment on individual songs while also accessing community feedback, all functioning as a personal music journal with social elements

**Key Changes:**
- Focus shifted from era reviews to individual song reviews and comments
- Clear separation between personal content and community content via tabs
- Simplified first view with essential information (rank, rating, comment count)
- Comprehensive detail view for each song combining personal journal and community insights
- New bestie matching system to connect with users who have similar music preferences

**Primary Components:**
- PanelHeader.vue (title, back button, close button)
- MainTabNavigation.vue (tab switching between "Your Journal", "Community", and "Besties")
- RankingsList.vue (ordered list of songs ranked by the user)
- SongCard.vue (compact display of song with rank, rating, and comment count)
- ReviewDisplay.vue (display and edit personal reviews for individual songs)
- ReviewHistory.vue (horizontal scroll of previous review edits with dates)
- CommentSection.vue (sequential blog-like commenting system for individual songs)
- MetricDisplay.vue (tallies of reviews and comments for songs)
- CommunityReviewsList.vue (list of reviews from other users)
- CommunityCommentsList.vue (list of comments from other users)
- BestieMatchList.vue (displays connected and discoverable users with similar tastes)

## Navigation Structure

The sidebar implements a three-layer navigation approach:

1. **Layer 1: Main Tabs**
   - Your Journal: Personal content
   - Community: Content from other users
   - Besties: Matching and connections

2. **Layer 2: Content Lists**
   - Era List: When viewing All Eras
   - Song List: When viewing a specific era
   - Review List: When viewing community content for a song/era
   - Bestie List: When viewing besties tab (with Connected and Discover sections)

3. **Layer 3: Detail Views**
   - Era Detail: Your review and comments for an era
   - Song Detail: Your review and comments for a song
   - Review Detail: A specific community review with its comments
   - Note: Besties tab is only available at Layers 1 and 2, and is inaccessible at Layer 3

## Header Design

- Implements a sticky header with navigation path design
- Header freezes during scrolling for easy navigation
- Uses breadcrumb-style navigation path (e.g., "All Eras > Folklore > cardigan")
- Clear separation between navigation and content
- Includes close button [X] to dismiss the sidebar

## Visual Layout

### Layer 1-2: Era View with Song List (Your Journal Tab)

```
+-----------------------------------------------------+
|  ← Folklore 🤍                              [X]     |
+-----------------------------------------------------+
|                                                     |
| | Your Journal | Community | Besties |              |
+-----------------------------------------------------+
|                                                     |
| Your Ranked Songs in Folklore:                      |
|                                                     |
| +-------------------------------------------+       |
| | #1 cardigan                               |       |
| | ★★★★★  💬 2                             |       |
| +-------------------------------------------+       |
|                                                     |
| +-------------------------------------------+       |
| | #2 august                                 |       |
| | ★★★★☆  💬 1                             |       |
| +-------------------------------------------+       |
|                                                     |
| +-------------------------------------------+       |
| | #3 exile (feat. Bon Iver)                |       |
| | ★★★★★  💬 3                             |       |
| +-------------------------------------------+       |
|                                                     |
| +-------------------------------------------+       |
| | #4 the 1                                 |       |
| | ★★★★☆  💬 1                             |       |
| +-------------------------------------------+       |
+-----------------------------------------------------+
```

*Sidebar panel showing the Your Journal tab with a list of ranked songs. Each song card displays the rank, title, star rating, and comment count. The panel includes a sticky header with the era name and emoji.*

### Layer 3: Song Detail View (Your Journal Tab)

```
+-----------------------------------------------------+
|  All Eras > Folklore > cardigan            [X]     |
|  -----------------------------------------------    |
|  | Your Journal | Community |                       |
+-----------------------------------------------------+
|                                                     |
| Ranked #1 in Your List                              |
|                                                     |
| Your Rating: ★★★★★                               |
|                                                     |
| Your Review (May 8, 2025):                          |
| "The imagery in this song is incredible. The        |
| way it connects to the other songs in the           |
| folklore triangle makes it even more powerful.      |
| One of her best lead singles ever."                 |
|                                                     |
| Review History:                                     |
| [May 8] [Apr 20] [Mar 15]                          |
|                                                     |
| [Edit Review]                                       |
|                                                     |
| Your Comments:                                      |
|                                                     |
| May 10, 2025                                        |
| "The music video for this is so beautiful and       |
| perfectly captures the nostalgic feeling."          |
|                                                     |
| May 5, 2025                                         |
| "Listened to this on a rainy day and it hit         |
| differently. The piano is so haunting."             |
|                                                     |
| [+ Add New Comment]                                 |
+-----------------------------------------------------+
```

*Sidebar panel showing the Your Journal tab for a specific song. The panel displays the song's rank, the user's rating, their review with timestamp, review history, and comments. Note that at Layer 3, the Besties tab is not available.*

### Community Tab View

```
+-----------------------------------------------------+
|  All Eras > Folklore > cardigan            [X]     |
|  -----------------------------------------------    |
|  | Your Journal | Community |                       |
+-----------------------------------------------------+
|                                                     |
| Community Reviews (142):                            |
|                                                     |
| +-------------------------------------------+       |
| | FolkloreQueen ★★★★★                     |       |
| | "This song captures nostalgia perfectly..." |       |
| | [Expand] [View Profile]                    |       |
| +-------------------------------------------+       |
|                                                     |
| +-------------------------------------------+       |
| | SwiftieForever ★★★★★                    |       |
| | "The imagery in this song is so vivid..."  |       |
| | [Expand] [3 Comments] [View Profile]       |       |
| +-------------------------------------------+       |
|                                                     |
| +-------------------------------------------+       |
| | MidnightsDreamer ★★★★☆                  |       |
| | "Beautiful lyrics but I prefer august..."  |       |
| | [Expand] [1 Comment] [View Profile]        |       |
| +-------------------------------------------+       |
+-----------------------------------------------------+
```

*Sidebar panel showing the Community tab with reviews from other users. Each review shows the username, star rating, and a preview of the review content with options to expand and view the user's profile.*

### Expanded Community Review with Comments

```
+-----------------------------------------------------+
|  All Eras > Folklore > cardigan > SwiftieForever   [X] |
|  -----------------------------------------------    |
|  | Your Journal | Community |                       |
+-----------------------------------------------------+
|                                                     |
| SwiftieForever ★★★★★                           |
|                                                     |
| "The imagery in this song is so vivid and           |
| beautiful. The way Taylor weaves the story          |
| of young love and heartbreak through the            |
| metaphor of a cardigan is pure poetry.              |
| This song made me fall in love with the             |
| entire folklore era immediately."                   |
|                                                     |
| Comments:                                           |
|                                                     |
| May 9, 2025                                         |
| "The bridge in this song gives me chills            |
| every single time."                                 |
| [Expand]                                            |
|                                                     |
| May 7, 2025                                         |
| "I've noticed so many new details after             |
| listening with good headphones."                    |
| [Expand]                                            |
|                                                     |
| [View SwiftieForever's Profile]                     |
+-----------------------------------------------------+
```

*Sidebar panel showing an expanded community review with its associated comments. The panel displays the full review text and a list of comments with timestamps and preview text.*

### Besties Tab with Connected and Discover Sections

```
+-----------------------------------------------------+
|  ← Folklore 🤍                              [X]     |
+-----------------------------------------------------+
|                                                     |
| | Your Journal | Community | Besties |              |
+-----------------------------------------------------+
|                                                     |
| Folklore Era Besties                                |
|                                                     |
| Connected:                                          |
|                                                     |
| +-------------------------------------------+       |
| | FolkloreQueen                             |       |
| | 94% Match                                 |       |
| | ↑ Connected May 9, 2025                   |       |
| |                                           |       |
| | Ranked Songs:                             |       |
| | [#1 cardigan] [#2 august] [#3 exile] >    |       |
| |                                           |       |
| | [View Profile]                            |       |
| +-------------------------------------------+       |
|                                                     |
| Discover:                                           |
|                                                     |
| +-------------------------------------------+       |
| | MidnightsDreamer                          |       |
| | 92% Match                                 |       |
| |                                           |       |
| | Ranked Songs:                             |       |
| | [#1 cardigan] [#2 the 1] [#3 exile] >     |       |
| |                                           |       |
| | [Connect]                                 |       |
| +-------------------------------------------+       |
+-----------------------------------------------------+
```

*Sidebar panel showing the Besties tab with connected users and potential matches. The Connected section shows users the current user has already connected with, while the Discover section shows potential new connections based on similar music preferences.*

## Bestie Matching System

### Matching Criteria
- Matching is conducted only on top 3 songs of eras and top 3 eras
- Separate scores calculated for:
  - All Eras Bestie: Similarity based on how closely top 3 albums match
  - Specific Eras Bestie: Similarity based on how closely top 3 songs of an era match

### Display Format
- Era rankings displayed as heart emojis in a scrollable row
- Song rankings displayed as chips with song names and rank numbers
- No arbitrary limit on how many rankings are displayed
- Clear indication of match percentages

### Connection Types
- Outgoing: Current user initiates connection with another user
- Incoming: Another user initiates connection with current user
- Difference depicted by relevant icons (↑ for outgoing, ↓ for incoming)
- Connection dates are recorded and displayed

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

### MainTabNavigation.vue

The MainTabNavigation component allows switching between the main content tabs.

**Properties:**
- `tabs` (Array): List of tab objects with `id`, `title`, and `active` properties
- `activeTabId` (String): ID of the currently active tab
- `currentLayer` (Number): Current navigation layer (1, 2, or 3)

**Events:**
- `@tabChange`: Emitted when a tab is clicked, includes the tab ID

**Implementation Notes:**
- Visual indicator for the active tab
- Equal width distribution for tabs
- Accessible keyboard navigation
- Automatically closes previous tab content when switching tabs
- Disables Besties tab when in Layer 3

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

### HistoryTimeline.vue

The HistoryTimeline component displays a chronological view of ranking changes.

**Properties:**
- `historyEntries` (Array): List of historical ranking entries with `timestamp`, `items`, and `isCurrentVersion` properties
- `maxEntriesToShow` (Number): Maximum number of historical entries to display

**Events:**
- `@entrySelect`: Emitted when a history entry is selected for detailed view

**Implementation Notes:**
- Groups entries by date
- Highlights the current version
- Shows ranking changes with visual indicators for items that moved up or down
- Collapsible sections for each historical entry

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

### ShareButton.vue

The ShareButton component provides social sharing functionality.

**Properties:**
- `contentType` (String): Type of content being shared ("rankings" or "review")
- `contentId` (String): Identifier for the content being shared
- `shareText` (String): Default text to include in the share
- `platforms` (Array): List of social platforms to enable for sharing

**Events:**
- `@share`: Emitted when content is shared, includes platform and content details

**Implementation Notes:**
- Supports multiple social platforms (Twitter, Facebook, etc.)
- Generates shareable links with preview images
- Customizable share text and image
- Tracks share analytics

## User Interactions

### Navigation Interactions

| Interaction | Result | Technical Details |
|-------------|--------|-------------------|
| Tap era card on dashboard | Opens sidebar with song list | Emits `@eraSelected` event with era ID |
| Tap song in list | Opens song detail view | Emits `@songSelected` event with song ID |
| Tap breadcrumb navigation | Navigates to that level | Updates navigation state |
| Tap tab (Your Journal, Community, Besties) | Switches between tabs | Updates active tab state |
| Tap close button (X) | Closes the sidebar panel | Emits `@close` event |
| Tap back button (←) | Returns to previous view | Navigates back one level |

### Content Interactions

| Interaction | Result | Technical Details |
|-------------|--------|-------------------|
| Tap Edit Review | Opens review editing form | Updates editing state |
| Tap Add Comment | Opens comment input field | Updates comment state |
| Tap Review History date | Shows review from that date | Loads historical review data |
| Tap Expand on community review | Shows full review with comments | Loads complete review data |
| Tap View Profile | Opens user profile | Navigates to profile view |
| Tap Connect button | Initiates connection with user | Creates connection in database |

### Bestie Tab Interactions

| Interaction | Result | Technical Details |
|-------------|--------|-------------------|
| View Connected section | Shows users you've connected with | Loads connection data |
| View Discover section | Shows potential matches | Calculates and loads match data |
| Tap View Profile | Opens connected user's profile | Navigates to profile view |
| Tap Connect | Initiates connection with user | Creates connection in database |
| Scroll song/era chips | Shows more ranked items | Handles horizontal scroll |

## State Management

The Sidebar Panel interacts with the following state:

- **User rankings**: Current user's rankings for eras and songs
- **Review data**: User's ratings and review text for songs and eras
- **Comment data**: User's comments on songs and eras
- **History data**: Timeline of ranking changes
- **Community data**: Reviews and comments from other users
- **Connection data**: Bestie connections and match percentages
- **Navigation state**: Current view level and active tab

## Animation and Transitions

The Sidebar Panel includes smooth animations for a polished user experience:

- Slide-in animation when opening
- Slide-out animation when closing
- Fade transitions between tabs
- Subtle hover effects on interactive elements
- Timeline animations for history entries

## Responsive Design

The Sidebar Panel adapts to different screen sizes:

- **Desktop**: Panel takes up 30% of screen width
- **Tablet**: Panel takes up 50% of screen width
- **Mobile**: Panel takes up 100% of screen width
- **All devices**: Sticky header remains visible during scrolling

## Privacy Considerations

The sharing functionality respects user privacy settings:

- Shares are only enabled for users who have enabled public profiles
- Content visibility follows the user's privacy settings
- Preview of shared content is shown before finalizing the share
- Users can customize what information is included in shares
