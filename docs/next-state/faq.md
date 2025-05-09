# Frequently Asked Questions (FAQ)

## General Questions

### What is Music Besties?
Music Besties is an application that allows you to rank and review your favorite songs, track your music preferences over time, and connect with others who share similar music taste.

### What's new in version 1.1?
Version 1.1 introduces several new features including user accounts, ranking history tracking, a 24-hour cooldown between ranking saves, bestie matching with other users, Reddit verification, enhanced privacy controls, and improved sharing capabilities.

### Is Music Besties free to use?
Yes, Music Besties is completely free to use. All features are available without any subscription or payment.

### Which devices can I use Music Besties on?
Music Besties works on any device with a modern web browser, including desktops, laptops, tablets, and mobile phones. The interface adapts responsively to different screen sizes.

## Account Questions

### Do I need to create an account to use Music Besties?
No, you can use Music Besties as a guest with access to core ranking and review features. However, creating an account gives you access to social features like bestie matching and enhanced sharing options.

### How do I upgrade from guest mode to a full account?
Go to Settings → Account → Upgrade Account. You'll be prompted to enter an email address, password, and display name. Your existing rankings and reviews will be automatically transferred to your new account.

### Can I use Music Besties on multiple devices?
Yes, if you create an account, your data will sync across all devices when you log in. Guest mode data is stored locally on each device and does not sync.

### How do I delete my account?
Go to Settings → Account → Delete Account. This will permanently remove all your data from our servers. Note that this action cannot be undone.

## Ranking & Review Features

### Why is there a 24-hour cooldown between ranking saves?
The cooldown is designed to encourage thoughtful curation rather than frequent changes. It helps you reflect on your rankings and make more meaningful decisions about your music preferences.

### Can I edit my rankings during the cooldown period?
Yes, you can make changes to your rankings at any time. The cooldown only affects when you can save those changes. You can continue to edit and arrange your rankings, but you'll need to wait until the cooldown period ends to save them.

### How does the history tracking work?
Every time you save your rankings, a snapshot is created that records what changed (songs added, removed, or moved). You can view this history by clicking the history icon on the dashboard or by selecting the History tab in the sidebar when viewing an album.

### Can I restore previous rankings?
Yes, from the History tab in the sidebar, you can view previous versions of your rankings and restore any of them. This will replace your current rankings with the selected historical version.

### How many reviews can I write per album?
You can write one review per album, but you can edit your review as many times as you like. There is no cooldown for saving review changes.

## Social Features

### How does bestie matching work?
Bestie matching analyzes your rankings across all albums and finds other users with similar preferences. The algorithm considers both the songs you've ranked and their positions in your rankings to calculate a match percentage.

### Why do I need to verify through Reddit?
Reddit verification helps ensure a positive community experience by connecting users who are active in music-related communities. It reduces spam and creates a more engaged user base.

### Which subreddits qualify for verification?
Any music-related subreddit qualifies, including artist-specific subreddits (like r/taylorswift), genre subreddits (like r/popheads), or general music appreciation subreddits (like r/musicappreciation).

### Can other users see all my rankings and reviews?
Only if you allow it. You have granular privacy controls that let you decide what content is visible to others. You can make your profile completely private or selectively share rankings, reviews, or bestie matches.

### How do I share my rankings with friends?
From any album in your collection, open the sidebar and click the Share button. You'll get a unique link that you can send to friends. They can view your rankings even if they don't have a Music Besties account.

## Technical Questions

### Will my data from version 1.0 be preserved?
Yes, all your rankings and reviews from version 1.0 will be automatically migrated to version 1.1. No action is required on your part to preserve your data.

### How is my data stored?
Your data is primarily stored in your browser's localStorage. If you create an account, your data is also securely stored in our Supabase database, allowing you to access it across devices.

### Is my data secure?
Yes, we take data security seriously. We use industry-standard encryption for data transmission and storage. Your Reddit authentication is handled securely through OAuth, and we never store your Reddit password.

### What permissions does the app request from Reddit?
The app only requests basic identity information (username) and the ability to read your subscribed subreddits list. We do not request permission to post, comment, or access your Reddit messages.

### Can I export my data?
Yes, go to Settings → Account → Export Data to download a JSON file containing all your rankings, reviews, and history. This file can be used as a backup or for personal analysis.

## Troubleshooting

### My rankings disappeared after updating to v1.1
First, try clearing your browser cache and reloading the app. If that doesn't work, check if you're logged in with the correct account. If you were using guest mode in v1.0, your data should still be available on the same device and browser.

### The cooldown timer seems incorrect
The cooldown timer is based on your device's system clock. If the timer seems incorrect, check that your system time is accurate. You can also try clearing the app's cache to reset the timer state.

### I can't connect my Reddit account
Make sure you're using a valid Reddit account that meets the minimum requirements (account age >30 days, subscribed to at least one music subreddit). If problems persist, try disconnecting and reconnecting, or use a different browser.

### The app is running slowly on my device
Try clearing your browser cache and closing other applications or tabs. If you have a large collection with many rankings and reviews, the app might perform better on desktop devices with more processing power.

### How do I report a bug or suggest a feature?
You can report bugs or suggest features through the feedback form in Settings → Feedback, or by emailing support@musicbesties.app. Please include as much detail as possible, including your device, browser, and steps to reproduce any issues.

## Privacy Questions

### Does Music Besties collect my personal information?
We collect minimal personal information, limited to your email address (if you create an account) and your Reddit username (if you verify through Reddit). We do not collect or store any other personal information.

### Can I use Music Besties anonymously?
Yes, you can use guest mode without providing any personal information. Even if you create an account, you can use a pseudonym as your display name and set all privacy settings to private.

### Who can see my music preferences?
Only people you choose to share with. By default, all privacy settings are set to private when you first create an account. You can adjust these settings at any time in Settings → Privacy.

### Does Music Besties share my data with third parties?
No, we do not sell or share your data with third parties. The only external service we interact with is Reddit for verification purposes, and that's only if you choose to connect your Reddit account.

### How long is my data retained?
Your data is retained as long as you maintain an account with us. If you delete your account, all your data is permanently removed from our servers within 30 days.
