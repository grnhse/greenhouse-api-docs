# Users

## The user object

Your organization's Greenhouse users.


```json
{
  "id": 112,
  "name": "Juliet Burke",
  "emails": [
    "juliet.burke@example.com",
     "other.woman@example.com"
  ],
  "disabled": false,
  "site_admin": true
}
```

### Noteworthy Attributes

| Attribute | Description |
|-----------|-------------|
| id | The user's unique identifier |
| site_admin | If `true`, this user is a site admin, which means the user has full permissions on all non-private jobs.

## List users

```shell
curl 'https://harvest.greenhouse.io/v1/users' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 112,
    "name": "Juliet Burke",
    "emails": [
      "juliet.burke@example.com",
       "other.woman@example.com"
    ],
    "disabled": false,
    "site_admin": true
  },
  {
    "id": 712,
    "name": "Mr. Eko",
    "emails": [
      "mr.eko@example.com"
    ],
    "disabled": true,
    "site_admin": false
  }
]
```

List all of an organization's Greenhouse users.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/users`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.] (#the-user-object)

## Retrieve a user 

```shell
curl 'https://harvest.greenhouse.io/v1/users/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 112,
  "name": "Juliet Burke",
  "emails": [
    "juliet.burke@example.com",
     "other.woman@example.com"
  ],
  "disabled": false,
  "site_admin": true
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/users/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the user to retrieve

<br>
[See noteworthy response attributes.] (#the-user-object)