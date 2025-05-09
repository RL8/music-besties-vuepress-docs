# Technical Implementation

This section provides detailed technical information about the implementation of Music Besties v1.1 features.

## Architecture Overview

Music Besties follows a component-based architecture using Vue.js with a local-first data approach. The v1.1 release introduces several new technical components:

1. **History Tracking System**: Versioned history of user rankings with change detection
2. **Cooldown Timer**: Time-based restrictions on ranking saves
3. **Social Matching Algorithm**: Similarity calculation between user preferences
4. **Reddit OAuth Integration**: External authentication and verification
5. **Privacy Control System**: Granular permission management for shared content

## Local Storage Schema

The application uses browser localStorage as its primary data store, with the following schema:

```javascript
// localStorage['music-besties-data']
{
  // Core user selections (from v1.0)
  "rankings": {
    "red": ["all_too_well", "state_of_grace", "22"],
    "fearless": ["love_story", "you_belong_with_me", "fifteen"]
  },
  
  // User reviews (from v1.0)
  "reviews": {
    "red": {
      "rating": 5,
      "comment": "This album perfectly captures the emotions of heartbreak.",
      "timestamp": "2025-05-05T15:30:00.000Z"
    }
  },
  
  // New in v1.1: Ranking history with change tracking
  "history": {
    "red": [
      {
        "id": "hist_1683590400000",
        "timestamp": "2025-05-08T15:00:00.000Z",
        "changes": [
          {
            "songId": "state_of_grace",
            "oldRank": 3,
            "newRank": 2,
            "changeType": "moved"
          },
          {
            "songId": "22",
            "oldRank": 2,
            "newRank": 3,
            "changeType": "moved"
          }
        ]
      }
    ]
  },
  
  // New in v1.1: Cooldown timer tracking
  "lastSaveTime": {
    "red": "2025-05-08T15:00:00.000Z",
    "fearless": "2025-05-07T10:30:00.000Z"
  },
  
  // New in v1.1: User account information
  "userAccount": {
    "userId": "user_12345",
    "displayName": "MusicLover",
    "isGuest": false,
    "createdAt": "2025-05-01T09:00:00.000Z"
  },
  
  // New in v1.1: Privacy settings
  "privacySettings": {
    "publicProfile": true,
    "showRankings": true,
    "showReviews": true,
    "showBesties": false
  },
  
  // New in v1.1: Reddit verification
  "redditVerification": {
    "username": "music_fan_123",
    "isVerified": true,
    "verifiedDate": "2025-05-05T09:15:00.000Z",
    "verificationStatus": "verified"
  }
}
```

## History Tracking Implementation

The history tracking system records changes to user rankings over time:

### Change Detection Algorithm

```javascript
function detectChanges(oldRanking, newRanking) {
  const changes = [];
  
  // Find removed items
  oldRanking.forEach((songId, index) => {
    if (!newRanking.includes(songId)) {
      changes.push({
        songId,
        oldRank: index + 1,
        newRank: null,
        changeType: 'removed'
      });
    }
  });
  
  // Find added or moved items
  newRanking.forEach((songId, index) => {
    const oldIndex = oldRanking.indexOf(songId);
    
    if (oldIndex === -1) {
      // Added
      changes.push({
        songId,
        oldRank: null,
        newRank: index + 1,
        changeType: 'added'
      });
    } else if (oldIndex !== index) {
      // Moved
      changes.push({
        songId,
        oldRank: oldIndex + 1,
        newRank: index + 1,
        changeType: 'moved'
      });
    }
  });
  
  return changes;
}
```

### History Entry Creation

```javascript
function createHistoryEntry(albumId, oldRanking, newRanking) {
  const changes = detectChanges(oldRanking, newRanking);
  
  // Only create history if there are changes
  if (changes.length === 0) return null;
  
  const timestamp = new Date();
  
  return {
    id: `hist_${timestamp.getTime()}`,
    timestamp: timestamp.toISOString(),
    changes
  };
}
```

## Cooldown Timer Implementation

The cooldown timer enforces a 24-hour waiting period between ranking saves:

### Time Calculation

```javascript
function calculateTimeRemaining(lastSaveTime, cooldownHours = 24) {
  if (!lastSaveTime) return 0;
  
  const now = new Date();
  const lastSave = new Date(lastSaveTime);
  const cooldownEnd = new Date(lastSave.getTime() + (cooldownHours * 3600000));
  
  return Math.max(0, cooldownEnd - now);
}
```

### Save Eligibility Check

```javascript
function canSaveRankings(albumId) {
  const userData = JSON.parse(localStorage.getItem('music-besties-data') || '{}');
  const lastSaveTimes = userData.lastSaveTime || {};
  const lastSaveTime = lastSaveTimes[albumId];
  
  return calculateTimeRemaining(lastSaveTime) === 0;
}
```

## Social Matching Algorithm

The bestie matching feature uses a similarity algorithm to find users with similar music taste:

### Similarity Calculation

```javascript
function calculateSimilarity(userA, userB) {
  // Get all albums ranked by both users
  const commonAlbums = Object.keys(userA.rankings).filter(albumId => 
    userB.rankings[albumId] && userB.rankings[albumId].length > 0
  );
  
  if (commonAlbums.length === 0) return 0;
  
  let totalSimilarity = 0;
  let commonFavorites = [];
  
  // Calculate similarity for each common album
  commonAlbums.forEach(albumId => {
    const rankingsA = userA.rankings[albumId];
    const rankingsB = userB.rankings[albumId];
    
    // Find songs ranked by both users
    const commonSongs = rankingsA.filter(songId => rankingsB.includes(songId));
    
    // Calculate position similarity
    let positionSimilarity = 0;
    commonSongs.forEach(songId => {
      const posA = rankingsA.indexOf(songId);
      const posB = rankingsB.indexOf(songId);
      const posDiff = Math.abs(posA - posB);
      const maxPos = Math.max(rankingsA.length, rankingsB.length) - 1;
      
      // Higher similarity for songs ranked in similar positions
      positionSimilarity += 1 - (posDiff / maxPos);
      
      // Track common favorites (songs in top 3 for both users)
      if (posA < 3 && posB < 3) {
        commonFavorites.push(songId);
      }
    });
    
    // Normalize position similarity
    positionSimilarity = commonSongs.length > 0 ? 
      positionSimilarity / commonSongs.length : 0;
    
    // Calculate overlap ratio
    const overlapRatio = commonSongs.length / 
      Math.max(rankingsA.length, rankingsB.length);
    
    // Combine metrics for this album
    const albumSimilarity = (positionSimilarity * 0.7) + (overlapRatio * 0.3);
    totalSimilarity += albumSimilarity;
  });
  
  // Calculate final similarity percentage
  const averageSimilarity = totalSimilarity / commonAlbums.length;
  const similarityPercentage = Math.round(averageSimilarity * 100);
  
  return {
    matchPercentage: similarityPercentage,
    commonFavorites: [...new Set(commonFavorites)].slice(0, 5) // Top 5 common favorites
  };
}
```

## Reddit OAuth Integration

The Reddit verification process uses OAuth 2.0 for authentication:

### Authorization Flow

```javascript
// Step 1: Redirect to Reddit authorization page
function initiateRedditAuth() {
  const clientId = process.env.VUE_APP_REDDIT_CLIENT_ID;
  const redirectUri = encodeURIComponent(process.env.VUE_APP_REDDIT_REDIRECT_URI);
  const state = generateRandomState(); // For CSRF protection
  const scope = encodeURIComponent('identity read');
  
  // Store state for verification
  localStorage.setItem('redditAuthState', state);
  
  // Redirect to Reddit
  const authUrl = `https://www.reddit.com/api/v1/authorize?client_id=${clientId}&response_type=code&state=${state}&redirect_uri=${redirectUri}&duration=temporary&scope=${scope}`;
  window.location.href = authUrl;
}

// Step 2: Handle the callback from Reddit
async function handleRedditCallback(code, state) {
  // Verify state to prevent CSRF attacks
  const storedState = localStorage.getItem('redditAuthState');
  if (state !== storedState) {
    throw new Error('State verification failed');
  }
  
  // Exchange code for token
  const tokenResponse = await exchangeCodeForToken(code);
  
  // Use token to get user information
  const userInfo = await getUserInfo(tokenResponse.access_token);
  
  // Verify user subscriptions
  const isVerified = await checkUserSubscriptions(tokenResponse.access_token);
  
  // Store verification result
  storeVerificationResult(userInfo.name, isVerified);
  
  return {
    username: userInfo.name,
    isVerified,
    verificationStatus: isVerified ? 'verified' : 'failed'
  };
}
```

### Subscription Verification

```javascript
async function checkUserSubscriptions(accessToken) {
  // List of positive community subreddits to check
  const positiveSubreddits = [
    'taylorswift',
    'popheads',
    'musicappreciation',
    // Additional communities can be added here
  ];
  
  try {
    const response = await fetch('https://oauth.reddit.com/subreddits/mine/subscriber', {
      headers: {
        'Authorization': `Bearer ${accessToken}`,
        'User-Agent': 'Music Besties/1.1'
      }
    });
    
    const data = await response.json();
    const subscribedSubreddits = data.data.children.map(child => 
      child.data.display_name.toLowerCase()
    );
    
    // Check if user is subscribed to at least one positive community
    return positiveSubreddits.some(subreddit => 
      subscribedSubreddits.includes(subreddit.toLowerCase())
    );
  } catch (error) {
    console.error('Error checking subscriptions:', error);
    return false;
  }
}
```

## Privacy Control System

The privacy control system manages what content is visible to other users:

### Content Visibility Check

```javascript
function isContentVisible(contentType, userId) {
  // Get user's privacy settings
  const userData = JSON.parse(localStorage.getItem('music-besties-data') || '{}');
  const privacySettings = userData.privacySettings || {};
  
  // Public profile must be enabled for any content to be visible
  if (!privacySettings.publicProfile) return false;
  
  // Check specific content type visibility
  switch (contentType) {
    case 'rankings':
      return privacySettings.showRankings === true;
    case 'reviews':
      return privacySettings.showReviews === true;
    case 'besties':
      return privacySettings.showBesties === true;
    default:
      return false;
  }
}
```

### Shareable Content Generation

```javascript
function generateShareableContent(contentType, contentId) {
  // Get user data
  const userData = JSON.parse(localStorage.getItem('music-besties-data') || '{}');
  
  // Check privacy settings
  if (!isContentVisible(contentType, userData.userAccount?.userId)) {
    throw new Error('This content is not set to be publicly visible');
  }
  
  // Generate appropriate content based on type
  switch (contentType) {
    case 'rankings': {
      const rankings = userData.rankings[contentId] || [];
      const albumName = getAlbumName(contentId);
      
      return {
        type: 'rankings',
        albumId: contentId,
        albumName,
        rankings,
        shareUrl: `https://musicbesties.app/share/rankings/${contentId}`,
        previewText: `Check out my ${albumName} song rankings on Music Besties!`,
        previewImage: `https://musicbesties.app/album-previews/${contentId}.jpg`
      };
    }
    case 'reviews': {
      const review = userData.reviews[contentId] || {};
      const albumName = getAlbumName(contentId);
      
      return {
        type: 'review',
        albumId: contentId,
        albumName,
        rating: review.rating,
        comment: review.comment,
        shareUrl: `https://musicbesties.app/share/review/${contentId}`,
        previewText: `My ${review.rating}-star review of ${albumName} on Music Besties`,
        previewImage: `https://musicbesties.app/album-previews/${contentId}.jpg`
      };
    }
    default:
      throw new Error('Unsupported content type');
  }
}
```

## Guest Mode Implementation

Guest mode allows users to use the app without creating an account:

### Guest Account Creation

```javascript
function createGuestAccount() {
  const guestId = 'guest_' + Math.random().toString(36).substring(2, 15);
  
  const userData = JSON.parse(localStorage.getItem('music-besties-data') || '{}');
  
  // Create guest account
  userData.userAccount = {
    userId: guestId,
    displayName: 'Guest User',
    isGuest: true,
    createdAt: new Date().toISOString()
  };
  
  // Set default privacy settings (all private for guests)
  userData.privacySettings = {
    publicProfile: false,
    showRankings: false,
    showReviews: false,
    showBesties: false
  };
  
  // Save to localStorage
  localStorage.setItem('music-besties-data', JSON.stringify(userData));
  
  return userData.userAccount;
}
```

### Account Upgrade

```javascript
async function upgradeGuestAccount(email, password, displayName) {
  // Get current user data
  const userData = JSON.parse(localStorage.getItem('music-besties-data') || '{}');
  
  // Create account in Supabase
  const { user, error } = await supabase.auth.signUp({
    email,
    password
  });
  
  if (error) throw error;
  
  // Update user account information
  userData.userAccount = {
    userId: user.id,
    displayName: displayName || userData.userAccount?.displayName || 'Music Fan',
    isGuest: false,
    createdAt: userData.userAccount?.createdAt || new Date().toISOString(),
    email
  };
  
  // Set default privacy settings for new accounts
  if (!userData.privacySettings) {
    userData.privacySettings = {
      publicProfile: true,
      showRankings: true,
      showReviews: true,
      showBesties: false
    };
  }
  
  // Save to localStorage
  localStorage.setItem('music-besties-data', JSON.stringify(userData));
  
  // Sync data to Supabase for the new account
  await syncDataToCloud(userData);
  
  return userData.userAccount;
}
```

## Performance Optimizations

Several optimizations have been implemented to ensure good performance:

### Lazy Loading

Components are loaded only when needed:

```javascript
// Vue Router configuration
const routes = [
  {
    path: '/',
    component: () => import('./views/Dashboard.vue')
  },
  {
    path: '/edit',
    component: () => import('./views/EditRankings.vue')
  },
  {
    path: '/besties',
    component: () => import('./views/BestieMatching.vue')
  },
  {
    path: '/onboarding',
    component: () => import('./views/Onboarding.vue')
  }
];
```

### Memoization

Expensive calculations are cached:

```javascript
// Memoized similarity calculation
const similarityCache = new Map();

function getMemoizedSimilarity(userIdA, userIdB) {
  const cacheKey = [userIdA, userIdB].sort().join('_');
  
  if (similarityCache.has(cacheKey)) {
    return similarityCache.get(cacheKey);
  }
  
  const result = calculateSimilarity(getUserData(userIdA), getUserData(userIdB));
  similarityCache.set(cacheKey, result);
  
  return result;
}
```

### Virtualized Lists

Large lists use virtualization for better performance:

```javascript
// Example of virtualized list component
<template>
  <div class="virtualized-list" :style="{ height: totalHeight + 'px' }">
    <div 
      v-for="item in visibleItems" 
      :key="item.id"
      :style="{ transform: `translateY(${item.offsetTop}px)` }"
      class="list-item"
    >
      {{ item.content }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    items: Array,
    itemHeight: Number
  },
  data() {
    return {
      scrollTop: 0,
      viewportHeight: 0
    };
  },
  computed: {
    totalHeight() {
      return this.items.length * this.itemHeight;
    },
    visibleItems() {
      const startIndex = Math.floor(this.scrollTop / this.itemHeight);
      const endIndex = Math.min(
        this.items.length - 1,
        Math.ceil((this.scrollTop + this.viewportHeight) / this.itemHeight)
      );
      
      return this.items
        .slice(startIndex, endIndex + 1)
        .map((item, index) => ({
          ...item,
          offsetTop: (startIndex + index) * this.itemHeight
        }));
    }
  },
  mounted() {
    this.viewportHeight = this.$el.clientHeight;
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll() {
      this.scrollTop = window.scrollY;
    }
  }
};
</script>
```

## Security Considerations

Security measures have been implemented to protect user data:

### CSRF Protection

```javascript
function generateRandomState() {
  const array = new Uint8Array(16);
  window.crypto.getRandomValues(array);
  return Array.from(array, byte => byte.toString(16).padStart(2, '0')).join('');
}
```

### Content Security Policy

```html
<!-- index.html -->
<meta http-equiv="Content-Security-Policy" content="
  default-src 'self';
  connect-src 'self' https://oauth.reddit.com https://*.supabase.co;
  img-src 'self' https://i.redd.it https://*.scdn.co data:;
  script-src 'self' 'unsafe-inline';
  style-src 'self' 'unsafe-inline';
  frame-src 'none';
">
```

### Secure Storage

```javascript
// Sensitive data is not stored in localStorage
function storeAuthToken(token) {
  // Use sessionStorage for temporary auth tokens
  sessionStorage.setItem('reddit_token', token);
  
  // Set expiration
  const expiration = new Date();
  expiration.setHours(expiration.getHours() + 1);
  sessionStorage.setItem('reddit_token_expiration', expiration.toISOString());
}
```

## Browser Compatibility

The application is designed to work on modern browsers with these minimum versions:

| Browser | Minimum Version |
|---------|----------------|
| Chrome  | 80             |
| Firefox | 72             |
| Safari  | 13.1           |
| Edge    | 80             |

Feature detection is used for newer browser capabilities:

```javascript
// Example of feature detection
function supportsLocalStorage() {
  try {
    const test = 'test';
    localStorage.setItem(test, test);
    localStorage.removeItem(test);
    return true;
  } catch (e) {
    return false;
  }
}

function supportsIndexedDB() {
  return 'indexedDB' in window;
}

// Choose appropriate storage mechanism
const storage = supportsIndexedDB() ? new IndexedDBStorage() :
                supportsLocalStorage() ? new LocalStorage() :
                new MemoryStorage();
```

## Testing Strategy

The application is tested using the following approaches:

### Unit Tests

```javascript
// Example Jest test for cooldown timer
describe('Cooldown Timer', () => {
  test('should correctly calculate time remaining', () => {
    // Mock current time
    jest.spyOn(Date, 'now').mockImplementation(() => 1620500000000); // May 8, 2025, 15:00:00 GMT
    
    // Test with lastSaveTime 12 hours ago
    const lastSaveTime = new Date(1620456800000).toISOString(); // May 8, 2025, 03:00:00 GMT
    const timeRemaining = calculateTimeRemaining(lastSaveTime, 24);
    
    // Should have 12 hours remaining
    expect(Math.floor(timeRemaining / 3600000)).toBe(12);
  });
  
  test('should return 0 when cooldown is complete', () => {
    // Mock current time
    jest.spyOn(Date, 'now').mockImplementation(() => 1620500000000); // May 8, 2025, 15:00:00 GMT
    
    // Test with lastSaveTime 25 hours ago
    const lastSaveTime = new Date(1620410400000).toISOString(); // May 7, 2025, 14:00:00 GMT
    const timeRemaining = calculateTimeRemaining(lastSaveTime, 24);
    
    // Should have 0 hours remaining
    expect(timeRemaining).toBe(0);
  });
});
```

### Integration Tests

```javascript
// Example Cypress test for Reddit verification
describe('Reddit Verification', () => {
  beforeEach(() => {
    // Mock Reddit OAuth response
    cy.intercept('POST', 'https://www.reddit.com/api/v1/access_token', {
      statusCode: 200,
      body: {
        access_token: 'mock_token',
        token_type: 'bearer',
        expires_in: 3600
      }
    });
    
    // Mock user info response
    cy.intercept('GET', 'https://oauth.reddit.com/api/v1/me', {
      statusCode: 200,
      body: {
        name: 'test_user',
        id: 't2_12345'
      }
    });
    
    // Mock subscriptions response
    cy.intercept('GET', 'https://oauth.reddit.com/subreddits/mine/subscriber', {
      statusCode: 200,
      body: {
        data: {
          children: [
            { data: { display_name: 'taylorswift' } },
            { data: { display_name: 'AskReddit' } }
          ]
        }
      }
    });
  });
  
  it('should complete verification flow successfully', () => {
    // Start verification
    cy.visit('/settings');
    cy.get('[data-test="connect-reddit"]').click();
    
    // Simulate OAuth callback
    cy.visit('/auth/reddit/callback?code=test_code&state=test_state');
    
    // Check verification status
    cy.get('[data-test="verification-status"]').should('contain', 'Verified');
    cy.get('[data-test="reddit-username"]').should('contain', 'test_user');
  });
});
```

### End-to-End Tests

```javascript
// Example Playwright test for the entire ranking flow
test('complete ranking flow with cooldown', async ({ page }) => {
  // Login
  await page.goto('/');
  await page.fill('[data-test="email-input"]', 'test@example.com');
  await page.fill('[data-test="password-input"]', 'password123');
  await page.click('[data-test="login-button"]');
  
  // Navigate to edit rankings
  await page.click('[data-test="dashboard-era-red"]');
  await page.click('[data-test="edit-button"]');
  
  // Select songs
  await page.click('[data-test="song-all-too-well"]');
  await page.click('[data-test="song-state-of-grace"]');
  await page.click('[data-test="song-22"]');
  
  // Save rankings
  await page.click('[data-test="save-button"]');
  
  // Verify we're back on dashboard
  await expect(page).toHaveURL('/');
  
  // Try to edit again immediately
  await page.click('[data-test="dashboard-era-red"]');
  await page.click('[data-test="edit-button"]');
  
  // Verify cooldown timer is visible
  await expect(page.locator('[data-test="cooldown-timer"]')).toBeVisible();
  await expect(page.locator('[data-test="save-button"]')).toBeDisabled();
});
```
