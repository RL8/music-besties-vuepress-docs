# Developer Debugger

This section provides breakdown of the technical details of each screen in the app <!-- AI: Never edit this text -->

## Dashboard View

### Component Structure

```
App.vue
└── DashboardView.vue
    ├── HeaderBar.vue
    ├── EraCard.vue (multiple instances in grid)
    ├── SidebarPanel.vue (conditionally rendered)
    └── LeftSidebarNavigation.vue (conditionally rendered)
```

### State Dependencies

| Component | State Dependencies | Events Emitted |
|-----------|-------------------|----------------|
| DashboardView | `eras`, `userSelections` | None |
| HeaderBar | `currentView` | `open-navigation`, `edit-mode` |
| EraCard | `era`, `userSelections[era.id]` | `open-sidebar` |
| SidebarPanel | `selectedEra`, `userSelections[selectedEra.id]` | `close`, `switch-tab`, `edit-review` |
| LeftSidebarNavigation | `currentView` | `navigate`, `close` |

### Common Issues

- **Era cards not rendering**: Check that the `eras` array is properly loaded
- **Star ratings not displaying**: Verify `userSelections` object has the correct structure
- **Sidebar not opening**: Ensure `open-sidebar` event is being emitted with the correct era ID
- **Navigation not working**: Check that event handlers for navigation events are properly connected

## Edit Rankings View

### Component Structure

```
App.vue
└── EditRankingsView.vue
    ├── HeaderControls.vue
    ├── SelectionTabs.vue
    │   └── TabContent.vue (multiple instances)
    ├── ItemChip.vue (multiple instances)
    └── SelectionCounter.vue
```

### State Dependencies

| Component | State Dependencies | Events Emitted |
|-----------|-------------------|----------------|
| EditRankingsView | `selectedEra`, `userSelections` | None |
| HeaderControls | `hasChanges` | `save`, `cancel` |
| SelectionTabs | `tabs`, `activeTab` | `tab-change` |
| ItemChip | `item`, `isSelected`, `selectionIndex` | `toggle-selection` |
| SelectionCounter | `selectedCount`, `totalCount` | None |

### Common Issues

- **Drag and drop not working**: Check browser console for errors in event handlers
- **Rankings not saving**: Verify state updates are being committed to localStorage
- **Tabs not switching**: Ensure `tab-change` event is being handled correctly

## Debugging Tools

### Local Storage Inspector

To inspect the application's data in localStorage:

```javascript
// In browser console
const userData = JSON.parse(localStorage.getItem('musicBestiesUserData'));
console.table(userData);
```

### State Reset

To reset the application state for testing:

```javascript
// In browser console
localStorage.removeItem('musicBestiesUserData');
window.location.reload();
```

### Performance Monitoring

Key performance metrics to monitor:

- Time to render dashboard with many albums
- Drag and drop responsiveness with large song lists
- State update time when changing rankings
