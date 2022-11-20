# DATABASE: PostgreSQL

## Table: `users`
| `id` (PK) | `email` | `password` | `firstName` | `lastName` | `city` | `country` | `timeCreated` |
| - | - | - | - | - | - | - | - |
| 1 | harry.potter@hogwarts.edu | hashed_password | Harry | Potter | London | UK | 2010-04-30T16:50:00Z |

## Table: `tokens`
| `id` (PK) | `userId` (FK) | `token` | `name` | `timeCreated` |
| - | - | - | - | - |
| 7 | 1 | random_64_character_alphanumeric_string | Harry's iPhone | 2010-04-30T16:50:00Z |

## Table: `locations`
| `id` (PK) | `userId` (FK) | `tokenId` (FK) | `private` | `latitude` | `longitude` | `timestamp` |
| - | - | - | - | - | - | - |
| 4 | 1 | 7 | 1 | 45.516 | -122.636 | 2010-04-30T16:50:00Z |

# API DOCUMENTATION

Swagger please.

# API ENDPOINTS

- (All endpoints must require Content-Type: application/json header)
- Any endpoints that are flagged with “ ** REQUIRES AUTH ** ” must include the header `X-Auth-Token: tokenHere` to authenticate the action. To do so, please:
  - Check the tokens table to ensure the token exists
  - Then check the request is coming from the user that the token belongs to.

> Note: Tokens will not expire unless the user logs out of a device, which removes that token (see the logout endpoint)

## Register: `POST /v1/auth/register`
- Create an entry in the users table (password must be hashed and salted, please do not store in plain text!)
- Return the ID of the new account if successful

Request body:
```
{
  "email": "harry.potter@hogwarts.edu",
  "password": "iloveginny",
  "firstName": "Harry",
  "lastName": "Potter",
  "city": "London",
  "country": "UK"
}
```

Response body (on success):
```
{
  "id": integer (ID of new user)
}
```

## Login: `POST /v1/auth/login`
- Generate a new token (tokens must be a string of 64 random alphanumeric characters)
- Add it to the tokens table. Use the device parameter in the request body to populate the name column.

Request body:
```
{
  "email": "harry.potter@hogwarts.edu",
  "password": "iloveginny",
  "device": "Harry's iPhone"
}
```

Response body (on success):
```
{
  "id": integer (ID of new token)
}
```

## Logout `DELETE /v1/auth/${userId}/logout` ** REQUIRES AUTH **
- Delete all specified tokens from the tokens table

Request body:
```
{
  "tokens": [ 7 ] (Array, IDs of the tokens to delete)
}
```

Response body (on success):
```
{
  "invalidated": [ 7 ] (Array, IDs of the tokens that were deleted)
}
```

## Send location: `POST /v1/locations/${userId}` ** REQUIRES AUTH **
- Create a new “location” entry in the locations table.

Request body:
```
{
  "timestamp": "2010-04-30T16:50:00Z",
  "position": {
    "latitude": 45.516,
    "longitude": -122.636
  },
  "private": boolean,
}
```

Response body (on success):
```
{
  "id": integer (ID of location entry)
}
```

## Get all locations: `GET /v1/locations` ** REQUIRES AUTH **
- Generate a response body that includes all locations from the locations table.
- Include/exclude the user’s name, according to whether or not it is a private location.
- If not a private location, the user’s name will need to be pulled from the users table.

Example response body:
```
[
  {
    "private": false,
    "firstName": "Harry",
    "lastName": "Potter",
    "timestamp": "2010-04-30T16:50:00Z",
    "position": {
      "latitude": 45.516,
      "longitude": -122.636
    }
  },
  {
    "private": true,
    "timestamp": "2010-04-30T16:50:00Z",
    "position": {
      "latitude": 45.516,
      "longitude": -122.636
    }
  },
  {
    "private": false,
    "firstName": "Ron",
    "lastName": "Weasley",
    "timestamp": "2010-04-30T16:50:00Z",
    "position": {
      "latitude": 45.516,
      "longitude": -122.636
    }
  },
]
```
