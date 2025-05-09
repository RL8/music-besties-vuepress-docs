# Developer Guide

This section provides a breakdown of the technical details of each screen in the Music Besties application v1.1, along with debugging information and implementation guidelines.

## Dashboard View

### Component Structure

```
App.vue
└── DashboardView.vue
    ├── HeaderBar.vue
    ├── EraCard.vue (multiple instances in grid)
    │   └── HistoryIndicator.vue (conditionally rendered)
    ├── SidebarPanel.vue (conditionally rendered)
    │   ├── RankingsList.vue
    │   ├── HistoryTab.vue
    │   ├── ReviewForm.vue
    │   └── ShareOptions.vue
    └── LeftSidebarNavigation.vue (conditionally rendered)
```

### State Dependencies

| Component | State Dependencies | Events Emitted |
|-----------|-------------------|----------------|
| DashboardView | `eras`, `userSelections`, `rankingHistory` | None |
| HeaderBar | `currentView`, `userAccount` | `open-navigation`, `edit-mode` |
| EraCard | `era`, `userSelections[era.id]`, `rankingHistory[era.id]` | `open-sidebar` |
| HistoryIndicator | `historyCount`, `lastUpdated` | `view-history` |
| SidebarPanel | `selectedEra`, `userSelections[selectedEra.id]`, `rankingHistory[selectedEra.id]` | `close`, `switch-tab`, `edit-review`, `share-content` |
| HistoryTab | `rankingHistory[selectedEra.id]` | `restore-ranking` |
| ShareOptions | `contentType`, `contentId`, `privacySettings` | `share`, `copy-link` |
| LeftSidebarNavigation | `currentView`, `userAccount` | `navigate`, `close` |

### Common Issues

- **Era cards not rendering**: Check that the `eras` array is properly loaded
- **Star ratings not displaying**: Verify `userSelections` object has the correct structure
- **History indicators not showing**: Ensure `rankingHistory` object contains entries for the era
- **Sidebar not opening**: Ensure `open-sidebar` event is being emitted with the correct era ID
- **Navigation not working**: Check that event handlers for navigation events are properly connected
- **Share buttons not working**: Verify privacy settings allow sharing the content type

## Edit Rankings View

### Component Structure

```
App.vue
└── EditRankingsView.vue
    ├── HeaderControls.vue
    ├── CooldownTimer.vue
    ├── SelectionTabs.vue
    │   └── TabContent.vue (multiple instances)
    ├── ItemChip.vue (multiple instances)
    └── SelectionCounter.vue
```

### State Dependencies

| Component | State Dependencies | Events Emitted |
|-----------|-------------------|----------------|
| EditRankingsView | `selectedEra`, `userSelections`, `lastSaveTime` | None |
| HeaderControls | `hasChanges`, `cooldownComplete` | `save`, `cancel` |
| CooldownTimer | `lastSaveTime[selectedEra.id]`, `cooldownHours` | `cooldown-complete` |
| SelectionTabs | `tabs`, `activeTab` | `tab-change` |
| ItemChip | `item`, `isSelected`, `selectionIndex` | `toggle-selection` |
| SelectionCounter | `selectedCount`, `totalCount` | None |

### Common Issues

- **Drag and drop not working**: Check browser console for errors in event handlers
- **Rankings not saving**: Verify state updates are being committed to localStorage
- **Tabs not switching**: Ensure `tab-change` event is being handled correctly
- **Cooldown timer incorrect**: Check that `lastSaveTime` is being properly updated and stored
- **Save button disabled when it shouldn't be**: Verify cooldown calculation logic

## Bestie Matching View

### Component Structure

```
App.vue
└── BestieMatchingView.vue
    ├── HeaderBar.vue
    ├── LeagueTable.vue
    │   └── UserMatchRow.vue (multiple instances)
    ├── FilterControls.vue
    └── RedditVerificationPrompt.vue (conditionally rendered)
```

### State Dependencies

| Component | State Dependencies | Events Emitted |
|-----------|-------------------|----------------|
| BestieMatchingView | `userAccount`, `bestieMatches` | None |
| LeagueTable | `matches`, `currentUser`, `maxEntries` | `view-profile` |
| UserMatchRow | `match`, `isCurrentUser` | `view-profile`, `expand-details` |
| FilterControls | `filterOptions`, `activeFilters` | `filter-change` |
| RedditVerificationPrompt | `verificationStatus` | `start-verification` |

### Common Issues

- **League table empty**: Check that the matching algorithm has run and returned results
- **Verification prompt showing for verified users**: Verify `verificationStatus` is correctly set
- **Match percentages incorrect**: Debug the similarity calculation algorithm
- **Common favorites not showing**: Ensure the intersection of user preferences is being calculated
- **Profile links not working**: Check that profile URLs are correctly formatted

## Onboarding View

### Component Structure

```
App.vue
└── OnboardingView.vue
    ├── WelcomeCarousel.vue
    │   └── CarouselSlide.vue (multiple instances)
    ├── AccountOptions.vue
    │   └── GuestModeButton.vue
    └── ComparisonFlow.vue (conditionally rendered for shared links)
```

### State Dependencies

| Component | State Dependencies | Events Emitted |
|-----------|-------------------|----------------|
| OnboardingView | `isFirstVisit`, `sharedLinkData` | None |
| WelcomeCarousel | `slides`, `currentSlide` | `slide-change`, `complete` |
| AccountOptions | None | `create-account`, `sign-in`, `guest-mode` |
| GuestModeButton | `disabled` | `activate-guest` |
| ComparisonFlow | `sharedData`, `currentStep` | `complete`, `step-change` |

### Common Issues

- **Carousel not advancing**: Check that slide transition events are firing
- **Guest mode not working**: Verify guest account creation logic
- **Comparison flow not showing**: Ensure shared link data is being parsed correctly
- **Onboarding showing for returning users**: Check that first visit detection is working

## Common Components

### HistoryIndicator.vue

```javascript
// Component API
export default {
  props: {
    historyCount: { type: Number, required: true },
    lastUpdated: { type: Date, required: true },
    showDetails: { type: Boolean, default: false }
  },
  computed: {
    formattedDate() {
      return new Intl.DateTimeFormat('en-US', {
        month: 'short',
        day: 'numeric'
      }).format(this.lastUpdated);
    },
    isActive() {
      return this.historyCount > 0;
    }
  },
  methods: {
    viewHistory() {
      this.$emit('view-history');
    }
  }
};
```

### CooldownTimer.vue

```javascript
// Component API
export default {
  props: {
    lastSaveTime: { type: Date, required: true },
    cooldownHours: { type: Number, default: 24 },
    showProgress: { type: Boolean, default: true }
  },
  data() {
    return {
      timeRemaining: 0,
      intervalId: null
    };
  },
  computed: {
    cooldownComplete() {
      return this.timeRemaining <= 0;
    },
    formattedTimeRemaining() {
      if (this.cooldownComplete) return 'Ready to save';
      
      const hours = Math.floor(this.timeRemaining / 3600000);
      const minutes = Math.floor((this.timeRemaining % 3600000) / 60000);
      
      if (hours > 0) {
        return `${hours}h ${minutes}m remaining`;
      } else {
        const seconds = Math.floor((this.timeRemaining % 60000) / 1000);
        return `${minutes}m ${seconds}s remaining`;
      }
    },
    progressPercentage() {
      const totalMs = this.cooldownHours * 3600000;
      const elapsed = totalMs - this.timeRemaining;
      return Math.min(100, Math.max(0, (elapsed / totalMs) * 100));
    }
  },
  methods: {
    updateTimeRemaining() {
      const now = new Date();
      const cooldownEnd = new Date(this.lastSaveTime.getTime() + (this.cooldownHours * 3600000));
      this.timeRemaining = Math.max(0, cooldownEnd - now);
      
      if (this.timeRemaining <= 0 && this.intervalId) {
        clearInterval(this.intervalId);
        this.$emit('cooldown-complete');
      }
    }
  },
  mounted() {
    this.updateTimeRemaining();
    this.intervalId = setInterval(this.updateTimeRemaining, 1000);
  },
  beforeDestroy() {
    if (this.intervalId) clearInterval(this.intervalId);
  }
};
```

### LeagueTable.vue

```javascript
// Component API
export default {
  props: {
    matches: { type: Array, required: true },
    currentUser: { type: Object, required: true },
    maxEntries: { type: Number, default: 10 },
    showDetails: { type: Boolean, default: false }
  },
  computed: {
    visibleMatches() {
      return this.matches.slice(0, this.maxEntries);
    },
    currentUserRank() {
      return this.matches.findIndex(match => match.userId === this.currentUser.userId) + 1;
    },
    totalUsers() {
      return this.matches.length;
    }
  },
  methods: {
    viewProfile(userId) {
      this.$emit('view-profile', userId);
    }
  }
};
```

## Debugging Tools

### Local Storage Inspector

To inspect the application's data in localStorage:

```javascript
// In browser console
const userData = JSON.parse(localStorage.getItem('music-besties-data'));
console.table(userData);

// View specific sections
console.log('Rankings:', userData.rankings);
console.log('History:', userData.history);
console.log('Last Save Times:', userData.lastSaveTime);
```

### History Debugging

To debug ranking history:

```javascript
// In browser console
const history = JSON.parse(localStorage.getItem('music-besties-data')).history;

// Get history for specific era
const eraHistory = history['red'];
console.table(eraHistory);

// View changes in most recent entry
const latestChanges = eraHistory[0].changes;
console.table(latestChanges);
```

### Cooldown Timer Debugging

To check cooldown status:

```javascript
// In browser console
const lastSaveTimes = JSON.parse(localStorage.getItem('music-besties-data')).lastSaveTime;

// Calculate time remaining for an era
const era = 'red';
const lastSave = new Date(lastSaveTimes[era]);
const cooldownHours = 24;
const cooldownEnd = new Date(lastSave.getTime() + (cooldownHours * 3600000));
const timeRemaining = Math.max(0, cooldownEnd - new Date());

console.log(`Cooldown for ${era}:`, {
  lastSave,
  cooldownEnd,
  timeRemaining: timeRemaining / 3600000 + ' hours',
  canSave: timeRemaining <= 0
});
```

### Reddit Verification Testing

To simulate different verification states for testing:

```javascript
// In browser console
const userData = JSON.parse(localStorage.getItem('music-besties-data'));

// Set verification status
if (!userData.redditVerification) userData.redditVerification = {};
userData.redditVerification.status = 'verified'; // or 'not_verified', 'pending', 'failed'
userData.redditVerification.username = 'test_user';

localStorage.setItem('music-besties-data', JSON.stringify(userData));
window.location.reload();
```

### State Reset

To reset the application state for testing:

```javascript
// In browser console
localStorage.removeItem('music-besties-data');
window.location.reload();
```

### Guest Mode Testing

To toggle between guest and authenticated user:

```javascript
// In browser console
const userData = JSON.parse(localStorage.getItem('music-besties-data'));

// Toggle guest mode
if (!userData.userAccount) userData.userAccount = {};
userData.userAccount.isGuest = !userData.userAccount.isGuest;

localStorage.setItem('music-besties-data', JSON.stringify(userData));
window.location.reload();
```

## Performance Monitoring

Key performance metrics to monitor:

- Time to render dashboard with many albums
- History tab rendering with large history datasets
- League table generation with many users
- State update time when changing rankings
- Cooldown timer accuracy across sessions

### Performance Testing Utilities

```javascript
// In browser console

// Measure component render time
console.time('Component Render');
// ... component renders ...
console.timeEnd('Component Render');

// Measure data processing time
console.time('Match Calculation');
// ... bestie matching algorithm runs ...
console.timeEnd('Match Calculation');
```

## API Integration

### Reddit OAuth Flow

The Reddit verification process uses the following OAuth flow:

1. Redirect user to Reddit authorization URL
2. User grants permissions on Reddit
3. Reddit redirects back with authorization code
4. Exchange code for access token
5. Use token to fetch user information and subscriptions

```javascript
// Example OAuth initialization
function initiateRedditAuth() {
  const clientId = process.env.VUE_APP_REDDIT_CLIENT_ID;
  const redirectUri = encodeURIComponent(process.env.VUE_APP_REDDIT_REDIRECT_URI);
  const scope = encodeURIComponent('identity read');
  const state = generateRandomState(); // Store this for verification
  const duration = 'temporary';
  
  const authUrl = `https://www.reddit.com/api/v1/authorize?client_id=${clientId}&response_type=code&state=${state}&redirect_uri=${redirectUri}&duration=${duration}&scope=${scope}`;
  
  // Store state in localStorage for verification when Reddit redirects back
  localStorage.setItem('redditAuthState', state);
  
  // Redirect user to Reddit
  window.location.href = authUrl;
}
```

### Debugging OAuth Issues

Common OAuth issues and solutions:

- **Redirect URI mismatch**: Ensure the redirect URI exactly matches what's registered with Reddit
- **Invalid state parameter**: Verify state parameter is being properly stored and checked
- **Token exchange failing**: Check that client credentials are correct
- **Insufficient permissions**: Ensure requested scopes include 'identity' and 'read'

## Deployment Considerations

### Environment Variables

The application requires the following environment variables:

```
VUE_APP_REDDIT_CLIENT_ID=your_client_id
VUE_APP_REDDIT_REDIRECT_URI=https://your-app.com/auth/reddit/callback
VUE_APP_SUPABASE_URL=your_supabase_url
VUE_APP_SUPABASE_KEY=your_supabase_key
```

### Build Configuration

The production build process includes:

1. Environment-specific variable injection
2. Bundle optimization for performance
3. Service worker registration for offline capabilities
4. Social sharing metadata generation

```bash
# Production build command
npm run build
```
