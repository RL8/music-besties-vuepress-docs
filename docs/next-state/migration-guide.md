# Migration Guide: Music Besties v1.0 to v1.1

This guide helps users and developers transition from Music Besties v1.0 to v1.1, outlining key changes, new features, and required actions.

## For Users

### What's New in v1.1

Music Besties v1.1 introduces several exciting new features to enhance your music curation experience:

1. **User Accounts**
   - Create a personal account to access social features
   - Continue as a guest with limited functionality
   - Seamlessly upgrade from guest to full account

2. **Ranking History**
   - Track changes to your rankings over time
   - Restore previous versions of your rankings
   - View detailed change history with timestamps

3. **Thoughtful Curation with Cooldown**
   - 24-hour cooldown between ranking saves
   - Encourages more thoughtful music curation
   - Visual timer shows when next save is available

4. **Bestie Matching**
   - Find users with similar music taste
   - View match percentages and common favorites
   - Connect with the community

5. **Reddit Verification**
   - Verify your account through Reddit
   - Ensures positive community engagement
   - Unlocks full social features

6. **Enhanced Privacy Controls**
   - Granular control over what you share
   - Choose visibility of rankings, reviews, and matches
   - Public profile toggle for complete privacy

7. **Improved Sharing**
   - Share rankings and reviews with direct links
   - Compare your rankings with friends
   - Embed your rankings on other platforms

### Migration Steps for Users

1. **Update the Application**
   - If using the web version, clear your browser cache and reload
   - If using a mobile app, update through your app store

2. **Data Preservation**
   - All your existing rankings and reviews will be automatically migrated
   - No action required to preserve your data

3. **Account Creation (Optional)**
   - You'll be prompted to create an account or continue as a guest
   - Creating an account allows access to social features
   - Guest mode still provides access to core ranking functionality

4. **Privacy Settings**
   - On first login, review and set your privacy preferences
   - Default settings are privacy-focused (minimal sharing)
   - You can change these settings at any time

5. **Reddit Verification (Optional)**
   - To access Bestie Matching, verify through Reddit
   - Navigate to Settings → Connect Reddit Account
   - Follow the prompts to complete verification

## For Developers

### Technical Changes

1. **Data Schema Updates**
   - New localStorage fields for history, user accounts, and settings
   - Backward compatible with v1.0 data structure
   - See [Technical Documentation](./technical.md) for complete schema

2. **API Integrations**
   - Reddit OAuth for user verification
   - Supabase for user authentication and data storage
   - Environment variables required for API connections

3. **Component Structure**
   - New components for history tracking, cooldown, and social features
   - Enhanced state management with Vuex
   - Modular architecture for better maintainability

### Migration Steps for Developers

1. **Environment Setup**
   - Add required environment variables:
     ```
     VUE_APP_REDDIT_CLIENT_ID=your_reddit_client_id
     VUE_APP_REDDIT_REDIRECT_URI=your_redirect_uri
     VUE_APP_SUPABASE_URL=your_supabase_url
     VUE_APP_SUPABASE_KEY=your_supabase_key
     ```

2. **Data Migration**
   - Run the provided migration script to update localStorage schema:
     ```javascript
     // Example migration script
     function migrateDataToV1_1() {
       const userData = JSON.parse(localStorage.getItem('music-besties-data') || '{}');
       
       // Add new fields with defaults
       userData.history = userData.history || {};
       userData.lastSaveTime = userData.lastSaveTime || {};
       userData.userAccount = userData.userAccount || {
         isGuest: true,
         createdAt: new Date().toISOString()
       };
       userData.privacySettings = userData.privacySettings || {
         publicProfile: false,
         showRankings: false,
         showReviews: false,
         showBesties: false
       };
       
       // Save updated data
       localStorage.setItem('music-besties-data', JSON.stringify(userData));
       
       return userData;
     }
     ```

3. **Component Integration**
   - Add new components to your application
   - Update routing to include new views
   - Implement cooldown timer in the ranking save flow

4. **Testing Considerations**
   - Test data migration with various v1.0 data states
   - Verify Reddit OAuth flow with test accounts
   - Check privacy controls across all sharing features

## Breaking Changes

While we've aimed to make the migration as seamless as possible, there are a few breaking changes to be aware of:

1. **Ranking Save Behavior**
   - The 24-hour cooldown is enforced for all ranking saves
   - This may affect automated tests or rapid editing workflows
   - Use the `bypassCooldown` flag for development environments only

2. **LocalStorage Structure**
   - Direct manipulation of localStorage is not recommended
   - Use the provided API methods to access and modify data
   - Custom implementations may need updates for compatibility

3. **Dependency Updates**
   - Vue updated to version 3.2+
   - Vuex updated to version 4.0+
   - Axios updated to version 1.0+

## Troubleshooting

### Common Issues

1. **Missing Rankings**
   - Clear browser cache and reload
   - Check localStorage permissions
   - Contact support if data cannot be recovered

2. **Reddit Verification Failures**
   - Ensure you're subscribed to at least one music-related subreddit
   - Check that your Reddit account is in good standing
   - Try disconnecting and reconnecting your account

3. **Cooldown Timer Issues**
   - If timer appears stuck, check your system clock
   - Clear application cache to reset timer state
   - Cooldown is per-album, so you can still edit other albums

### Getting Help

If you encounter issues during migration:

1. Check the [FAQ section](./faq.md)
2. Visit our [community forum](https://community.musicbesties.app)
3. Contact support at support@musicbesties.app

## Timeline

- **May 15, 2025**: v1.1 Public Release
- **June 15, 2025**: v1.0 End of Support
- **July 1, 2025**: Mandatory Upgrade Deadline

After July 1, 2025, v1.0 will no longer be accessible, and all users will be automatically upgraded to v1.1 on their next visit.
