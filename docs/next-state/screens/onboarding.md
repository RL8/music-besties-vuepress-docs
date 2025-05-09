# Onboarding View

The Onboarding View is a new screen introduced in v1.1 that provides a smooth introduction to the Music Besties application for new users. It offers options for guest mode or account creation, with a special flow for users arriving via shared links.

## Screen Overview

**Purpose:** Introduce new users to the application and provide a frictionless entry point with guest mode, while offering a tailored experience for users arriving from shared links

**Primary Components:**
- WelcomeCarousel.vue (introduction slides with app features)
- GuestModeButton.vue (option to start using app without account)
- RegistrationForm.vue (fields for creating new account)
- ComparisonFlow.vue (special flow for users from shared links)
- ProgressIndicator.vue (dots or bars showing onboarding progress)
- SkipButton.vue (option to bypass detailed onboarding)

## Visual Layout

```
+-----------------------------------------------------+
|                   Music Besties                     |
+-----------------------------------------------------+
|                                                     |
|                  [Welcome Image]                    |
|                                                     |
| Welcome to Music Besties!                           |
|                                                     |
| Rank, review, and share your favorite music         |
| while connecting with other fans.                   |
|                                                     |
| • Create personalized rankings                      |
| • Track how your taste evolves                      |
| • Find your music besties                           |
|                                                     |
| [Start as Guest]                                    |
|                                                     |
| [Create Account]                                    |
|                                                     |
| Already have an account? [Login]                    |
|                                                     |
| ○ ● ○ ○                                           |
|                                                     |
| [Skip]                                              |
|                                                     |
+-----------------------------------------------------+
```

*Onboarding view showing the welcome screen with app introduction and options. The screen includes a welcome image, feature highlights, guest mode button, account creation button, login link, progress indicators, and skip button.*

## Component Details

### WelcomeCarousel.vue

The WelcomeCarousel component displays a series of introduction slides highlighting key app features.

**Properties:**
- `slides` (Array): List of slide objects with `title`, `description`, `image`, and `features` properties
- `currentSlideIndex` (Number): Index of the currently displayed slide
- `autoAdvance` (Boolean): Whether to automatically advance slides after a delay

**Events:**
- `@slideChange`: Emitted when the slide changes, includes the new slide index
- `@complete`: Emitted when the user reaches the last slide

**Implementation Notes:**
- Swipeable slides with touch support
- Animated transitions between slides
- Responsive images that adapt to screen size
- Bullet point lists for feature highlights

### GuestModeButton.vue

The GuestModeButton component provides an option to start using the app without creating an account.

**Properties:**
- `label` (String): Button text to display
- `showIcon` (Boolean): Whether to display an icon

**Events:**
- `@click`: Emitted when the button is clicked

**Implementation Notes:**
- Secondary visual styling to differentiate from account creation
- Clear explanation of guest mode limitations via tooltip
- Accessible focus states
- Tracking of guest user sessions

### RegistrationForm.vue

The RegistrationForm component allows users to create a new account.

**Properties:**
- `initialValues` (Object): Pre-filled form values if available
- `showPasswordRequirements` (Boolean): Whether to display password requirements
- `redirectUrl` (String): URL to redirect to after successful registration

**Events:**
- `@submit`: Emitted when the form is submitted, includes form data
- `@cancel`: Emitted when the form is cancelled

**Implementation Notes:**
- Form validation with helpful error messages
- Password strength indicator
- Optional fields for profile customization
- Integration with Supabase authentication

### ComparisonFlow.vue

The ComparisonFlow component provides a specialized onboarding experience for users arriving via shared links.

**Properties:**
- `sharedProfileId` (String): ID of the profile that was shared
- `sharedContentType` (String): Type of content that was shared ("rankings" or "review")
- `sharedContentId` (String): ID of the specific content that was shared

**Events:**
- `@setupComplete`: Emitted when the comparison setup is complete
- `@skip`: Emitted when the user chooses to skip the comparison flow

**Implementation Notes:**
- Shows the shared content immediately
- Guides users to create their own rankings for comparison
- Explains the bestie matching feature
- Provides a clear path to account creation after comparison

### ProgressIndicator.vue

The ProgressIndicator component shows the user's position in the onboarding flow.

**Properties:**
- `totalSteps` (Number): Total number of steps in the onboarding process
- `currentStep` (Number): Current step number
- `style` (String): Visual style ("dots" or "bar")

**Events:**
- `@stepClick`: Emitted when a step indicator is clicked, includes the step number

**Implementation Notes:**
- Visual representation of progress through onboarding
- Interactive navigation between steps (if enabled)
- Accessible labels for screen readers
- Responsive sizing based on available space

### SkipButton.vue

The SkipButton component allows users to bypass the detailed onboarding process.

**Properties:**
- `label` (String): Button text to display
- `destination` (String): Where to direct users after skipping ("dashboard" or "login")

**Events:**
- `@skip`: Emitted when the button is clicked, includes destination

**Implementation Notes:**
- Subtle visual styling to avoid drawing focus
- Confirmation dialog for users who might skip accidentally
- Analytics tracking of skip events
- Accessible keyboard interaction

## User Interactions

| Interaction | Result | Technical Implementation |
|-------------|--------|---------------------------|
| Swipe carousel | Advances to next/previous slide | Touch event handling with animation |
| Click Start as Guest | Begins using app without account | Creates temporary local storage profile, navigates to Dashboard |
| Click Create Account | Opens registration form | Displays form fields, handles validation |
| Click Login | Opens login form | Navigates to login screen |
| Click Skip | Bypasses detailed onboarding | Emits `@skip` event, navigates to destination |
| Click progress indicator | Jumps to specific onboarding step | Emits `@stepClick` event, updates current slide |

## User Flows

The Onboarding View supports multiple user flows:

### Standard New User Flow
1. User sees welcome carousel with app features
2. User chooses to start as guest or create account
3. If guest mode selected, user is directed to Dashboard with local storage only
4. If account creation selected, user completes registration form
5. After registration, user is directed to Dashboard with authenticated session

### Shared Link Flow
1. User arrives via a shared profile or content link
2. User sees the shared content immediately
3. User is prompted to create their own version for comparison
4. After creating rankings, user sees comparison results
5. User is prompted to create account to save comparison and appear in league table

### Returning User Flow
1. User with existing account clicks "Login"
2. User authenticates with credentials
3. User is directed to Dashboard with previous data loaded

## State Management

The Onboarding View interacts with the following state:

- **Onboarding Progress**: Tracks user's position in the onboarding flow
- **Registration Data**: Collects and validates user input for account creation
- **Guest Profile**: Temporary user data stored locally
- **Shared Content**: Information about content that was shared via link
- **Authentication State**: Manages user login and registration process

## Guest Mode Implementation

Guest mode allows users to start using the app immediately without creating an account:

1. A temporary user profile is created in local storage
2. User can create rankings, write reviews, and explore the app
3. When attempting to use social features, user is prompted to create an account
4. If user later creates an account, all guest data is migrated to the authenticated profile
5. Guest data is preserved across browser sessions but not synchronized across devices

## Responsive Behavior

The Onboarding View adapts to different screen sizes:
- **Mobile**: Single-column layout with optimized touch targets
- **Tablet**: Enhanced layout with larger images and side-by-side elements
- **Desktop**: Full-width layout with rich visuals and expanded content

## Accessibility Considerations

The Onboarding View includes several accessibility features:

- All images have descriptive alt text
- Carousel can be navigated with keyboard controls
- Form fields have proper labels and error messages
- Color contrast meets WCAG AA standards
- Skip links allow bypassing repetitive content
- Progress indicators have appropriate ARIA attributes
