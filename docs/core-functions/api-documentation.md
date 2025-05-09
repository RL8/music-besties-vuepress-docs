# API Documentation

This document provides comprehensive documentation for the APIs used in the Music Besties application.

## API Overview

[Overview of the APIs used in the application]

## Authentication

### Authentication Methods

[Description of authentication methods]

### API Keys

[Description of API key management]

## Endpoints

### User Management

#### Get User Profile

**Endpoint:** `GET /api/users/{userId}`

**Description:** Retrieves a user's profile information.

**Parameters:**
- `userId` (path parameter): The ID of the user to retrieve.

**Response:**
```json
{
  "userId": "string",
  "username": "string",
  "email": "string",
  "profilePicture": "string",
  "createdAt": "string",
  "updatedAt": "string"
}
```

**Status Codes:**
- 200: Success
- 404: User not found
- 500: Server error

### Music Management

#### Get Music Recommendations

**Endpoint:** `GET /api/music/recommendations`

**Description:** Retrieves music recommendations for a user.

**Parameters:**
- `userId` (query parameter): The ID of the user to get recommendations for.
- `limit` (query parameter, optional): The maximum number of recommendations to return.

**Response:**
```json
{
  "recommendations": [
    {
      "id": "string",
      "title": "string",
      "artist": "string",
      "album": "string",
      "coverArt": "string",
      "previewUrl": "string"
    }
  ]
}
```

**Status Codes:**
- 200: Success
- 400: Invalid request
- 500: Server error

## Error Handling

### Error Codes

[Description of error codes]

### Error Responses

[Description of error responses]

## Rate Limiting

[Description of rate limiting]

## Versioning

[Description of API versioning]

## Deprecation Policy

[Description of API deprecation policy]
