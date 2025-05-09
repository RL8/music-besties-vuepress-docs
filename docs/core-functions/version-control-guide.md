# Version Control Guide

This guide outlines the version control process for the Music Besties application and its documentation.

## Version Numbering System

The Music Besties project uses a linked versioning system:

1. **Application Version**: Uses semantic versioning (MAJOR.MINOR.PATCH)
   - MAJOR: Breaking changes
   - MINOR: New features, backward compatible
   - PATCH: Bug fixes, backward compatible

2. **Documentation Version**: Uses semantic versioning (MAJOR.MINOR.PATCH)
   - MAJOR: Must match the application major version
   - MINOR: Significant documentation updates
   - PATCH: Small fixes and improvements

## Version Update Requirements

### When to Update Versions

| Change Type | App Version | Docs Version |
|-------------|-------------|--------------|
| App functionality change | Update as needed | Update major to match app |
| Major documentation restructuring | No change | Update minor version |
| Documentation fixes/improvements | No change | Update patch version |
| GitHub Pages deployment | No change | Update patch version |

### Required Updates with Each Commit

For every commit to the documentation repository:

1. Update the Documentation Version in index.md
2. Update the Last Updated timestamp
3. Add a brief entry to the Changes column
4. Ensure the Application Version major number matches the Documentation Version

## Implementation Locations

Version information is maintained in the following locations:

1. **Primary**: index.md (Version Information table)
2. **README.md**: Contains a reminder about version updates
3. **GitHub PR Template**: Includes a version update checklist
4. **mkdocs.yml**: Contains a reminder comment

## Deployment Process

When deploying updates to GitHub Pages:

1. Build the documentation locally: `python -m mkdocs build`
2. Verify all changes are correct
3. Update version information in index.md
4. Deploy to GitHub Pages: `python -m mkdocs gh-deploy`
5. Create a chat log summary following the established procedure

## Version History

Maintain a concise version history in the index.md file, showing:
- Most recent version at the top
- Brief bullet points of key changes
- Date of update

## Best Practices

1. **Consistency**: Always follow the versioning system
2. **Clarity**: Make change descriptions clear and concise
3. **Completeness**: Update all version references
4. **Communication**: Document all significant changes
