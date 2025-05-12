# Bestie Matching View

The Bestie Matching View is a new screen introduced in v1.1 that displays a league table of users with similar music taste, ranked by similarity percentage. This feature helps users connect with others who share their musical preferences.

## Screen Overview

**Purpose:** Display a ranked list of users with similar music taste and enable social connections between users with compatible preferences

**Primary Components:**
- LeagueTable.vue (ranked list of similar users)
- SimilarityScore.vue (visual representation of match percentage)
- UserProfileCard.vue (user information and match details)
- ComparisonDetails.vue (expandable section showing matching preferences)
- FilterControls.vue (options to sort and filter matches)

## Visual Layout

```
+-----------------------------------------------------+
|  ← Your Besties                                    |
+-----------------------------------------------------+
|                                                     |
| # Music Taste Matches                               |
|                                                     |
| Find users who share your music preferences:        |
|                                                     |
| ## Connected                                        |
|                                                     |
| +-------------------------------------------+       |
| | SwiftFan22                                |       |
| | 92% Match                                 |       |
| | ↑ Connected May 9, 2025                  |       |
| |                                           |       |
| | Top Eras:                                 |       |
| | [❤️ Red] [💛 1989] [🤍 Folklore] >      |       |
| |                                           |       |
| | [View Profile]                            |       |
| +-------------------------------------------+       |
|                                                     |
| +-------------------------------------------+       |
| | RedLover                                  |       |
| | 87% Match                                 |       |
| | ↓ Connected May 1, 2025                  |       |
| |                                           |       |
| | Top Eras:                                 |       |
| | [❤️ Red] [💚 Speak Now] [💜 Speak Now] > |       |
| |                                           |       |
| | [View Profile]                            |       |
| +-------------------------------------------+       |
|                                                     |
| ## Discover                                         |
|                                                     |
| +-------------------------------------------+       |
| | Folklore1989                              |       |
| | 81% Match                                 |       |
| |                                           |       |
| | Top Eras:                                 |       |
| | [🤍 Folklore] [💛 1989] [💚 Speak Now] > |       |
| |                                           |       |
| | [Connect]                                 |       |
| +-------------------------------------------+       |
|                                                     |
| ## Filters                                          |
|                                                     |
| View: [All Eras] [Specific Era ▼]                  |
| Sort By: [Match %] [Connection Date] [Activity]     |
|                                                     |
+-----------------------------------------------------+
```

*Bestie Matching view showing users with similar music taste divided into Connected and Discover sections. The Connected section shows users the current user has already connected with, while the Discover section shows potential new connections. Each entry displays the match percentage, connection status with directional icons (↑ for outgoing, ↓ for incoming), and top ranked eras shown as heart emojis in a scrollable row. Filtering options allow users to view All Eras matches or matches for a specific era.*

## Component Details

### BestieMatchList.vue

The BestieMatchList component displays users with similar music taste in two sections: Connected and Discover.

**Properties:**
- `matches` (Array): List of user match objects with similarity scores
- `currentUserId` (String): ID of the current user
- `itemId` (String): ID of the era or "all" for global matches
- `showConnected` (Boolean): Whether to show connected users
- `showDiscover` (Boolean): Whether to show discoverable users
- `sortBy` (String): Current sort criterion ("match", "date", "activity")

**Events:**
- `@viewProfile`: Emitted when a user profile is selected for viewing
- `@connect`: Emitted when the connect button is clicked
- `@sortChange`: Emitted when sort criterion is changed
- `@viewChange`: Emitted when view type is changed (All Eras/Specific Era)

**Implementation Notes:**
- Separates connected users from potential new connections
- Displays connection status with directional icons (↑ for outgoing, ↓ for incoming)
- Shows top ranked eras/songs as scrollable chips
- Provides filtering between All Eras and Specific Era matches
- Supports pagination for large numbers of matches

### SimilarityScore.vue

The SimilarityScore component provides a visual representation of the match percentage.

**Properties:**
- `score` (Number): Similarity score as a percentage (0-100)
- `size` (String): Display size ("small", "medium", "large")
- `showLabel` (Boolean): Whether to display the percentage label

**Implementation Notes:**
- Color-coded representation (green for high matches, yellow for medium, etc.)
- Circular progress indicator
- Accessible color scheme with text labels
- Responsive sizing based on context

### UserProfileCard.vue

The UserProfileCard component displays user information and match details.

**Properties:**
- `user` (Object): User data including username, join date, and profile image
- `similarityScore` (Number): Match percentage with current user
- `rank` (Number): Position in the league table
- `verified` (Boolean): Whether the user has verified their Reddit account

**Events:**
- `@click`: Emitted when the card is clicked

**Implementation Notes:**
- Compact display of key user information
- Visual indicator for verified users
- Accessible interactive elements
- Hover states for interactive feedback

### ComparisonDetails.vue

The ComparisonDetails component shows detailed information about matching preferences.

**Properties:**
- `userId` (String): ID of the user being compared
- `comparisonData` (Object): Detailed matching information by category
- `expanded` (Boolean): Whether the details section is expanded

**Events:**
- `@toggle`: Emitted when the section is expanded or collapsed

**Implementation Notes:**
- Collapsible section to conserve space
- Categorized display of matching preferences
- Visual indicators for strong matches in specific categories
- Animated expansion/collapse

### FilterControls.vue

The FilterControls component provides options to sort and filter the league table.

**Properties:**
- `sortOptions` (Array): Available sorting criteria
- `currentSort` (String): Currently selected sort option
- `filterOptions` (Object): Additional filtering options

**Events:**
- `@sortChange`: Emitted when sort criterion is changed
- `@filterChange`: Emitted when filter options are changed

**Implementation Notes:**
- Button group for sort options
- Additional filters for refining results
- Clear visual indication of active filters
- Mobile-friendly touch targets

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|---------------------------|
| Click back button | Returns to previous screen | Triggers route change |
| Click View Profile button | Opens user's public profile | Emits `@viewProfile` event, navigates to profile view |
| Click Expand Details button | Shows/hides detailed match information | Emits `@toggleDetails` event, toggles expansion state |
| Click sort option | Changes the sort order of the league table | Emits `@sortChange` event, updates sort criterion |
| Scroll through list | Views more matches in the league table | Standard scroll behavior with lazy loading |

## State Management

The Bestie Matching View interacts with the following state:

- **User Profiles**: Information about each user in the system
- **Similarity Data**: Calculated match percentages between users
- **Comparison Details**: Specific information about matching preferences
- **User Preferences**: Current user's ranking and review data
- **Sort/Filter State**: Current sorting and filtering options

## Similarity Algorithm

The matching algorithm focuses on top rankings to calculate similarity scores, providing a more meaningful connection between users with similar preferences for favorite content:

1. **Focused Matching**: Matching is conducted only on top 3 songs of eras and top 3 eras
2. **Dual Matching Types**:
   - **All Eras Bestie**: Similarity based on how closely top 3 albums match
   - **Specific Eras Bestie**: Similarity based on how closely top 3 songs of an era match
3. **Ranking Order**: How closely the order of common songs/eras matches
4. **Rating Alignment**: Similarity of star ratings for the same content
5. **Connection Types**: Tracking of outgoing (user-initiated) and incoming (other-initiated) connections

The algorithm produces percentage scores for both global (All Eras) and era-specific compatibility, allowing users to find besties who share their taste in particular eras as well as overall music preferences.

## Reddit Verification Integration

The Bestie Matching feature integrates with Reddit verification:

- Only verified Reddit users appear in the league table
- Verification status is indicated on user profiles
- The system checks for subscription to positive fan communities
- Users without verification can view the league table but not appear in others' matches

## Responsive Behavior

The Bestie Matching View adapts to different screen sizes:
- **Mobile**: Single-column layout with compact cards
- **Tablet**: Two-column layout for larger screens
- **Desktop**: Enhanced layout with more visible details

## Privacy Considerations

The Bestie Matching feature includes several privacy safeguards:

- Users can opt out of appearing in others' matches
- Detailed preference data is only shown with user consent
- Profile information is limited to username and basic stats
- Blocking functionality prevents unwanted connections
- All interactions are subject to community guidelines
