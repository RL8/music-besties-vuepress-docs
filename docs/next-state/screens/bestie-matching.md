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

## Component Details

### LeagueTable.vue

The LeagueTable component displays a ranked list of users with similar music taste.

**Properties:**
- `matches` (Array): List of user match objects with similarity scores
- `currentUserId` (String): ID of the current user
- `maxEntries` (Number): Maximum number of entries to display
- `sortBy` (String): Current sort criterion ("match", "date", "activity")

**Events:**
- `@viewProfile`: Emitted when a user profile is selected for viewing
- `@toggleDetails`: Emitted when details section is expanded/collapsed
- `@sortChange`: Emitted when sort criterion is changed

**Implementation Notes:**
- Ranks users by similarity score by default
- Provides alternative sorting options
- Displays key user information and match percentage
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

The matching algorithm considers multiple factors to calculate similarity scores:

1. **Ranking Overlap**: Percentage of songs that appear in both users' rankings
2. **Ranking Order**: How closely the order of common songs matches
3. **Rating Alignment**: Similarity of star ratings for the same eras
4. **Review Sentiment**: Analysis of review text for similar sentiments
5. **Weighting**: Higher weight given to top-ranked items

The algorithm produces a percentage score that represents overall music taste compatibility.

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
