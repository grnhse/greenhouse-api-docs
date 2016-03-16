# Activity Feed

## The activity feed object
The activity feed is the list of activities on a candidate's profile, including interviews, notes, and emails.

```json
{
  "note": [
    {
      "created_at": "2014-03-26T20:11:40Z",
      "body": "Very mysterious.",
      "private": false,
      "user": {
        "id": 512,
        "name": "Sayid Jarrah"
      }
    }
  ],
  "email": [
    {
      "created_at": "2014-04-01T15:55:06Z",
      "subject": "Regarding your application",
      "body": "Hey John,  just wanted to touch base!",
      "from": "boone.carlyle@example.com",
      "to": "john.locke@example.com",
      "cc": null,
      "user": {
        "id": 214,
        "name": "Boone Carlyle"
      }
    }
  ],
  "activity": [
    {
      "created_at": "2014-04-01T15:55:29Z",
      "body": "Reason: Lacking hustle\n\nThis candidate turned out to be problematic for us...",
      "user": {
        "id": 214,
        "name": "Boone Carlyle"
      }
    },
    {
      "created_at": "2014-03-26T20:26:38Z",
      "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
      "user": null
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| note | An array of notes associated with this candidate.
| email | An array of emails sent to and from this candidate.
| activity | An array of events associated with this candidate




## Retrieve activity feed for candidate

```shell
curl 'https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "note": [
    {
      "created_at": "2014-03-26T20:11:40Z",
      "body": "Very mysterious.",
      "private": false,
      "user": {
        "id": 512,
        "name": "Sayid Jarrah"
      }
    }
  ],
  "email": [
    {
      "created_at": "2014-04-01T15:55:06Z",
      "subject": "Regarding your application",
      "body": "Hey John,  just wanted to touch base!",
      "from": "boone.carlyle@example.com",
      "to": "john.locke@example.com",
      "cc": null,
      "user": {
        "id": 214,
        "name": "Boone Carlyle"
      }
    }
  ],
  "activity": [
    {
      "created_at": "2014-04-01T15:55:29Z",
      "body": "Reason: Lacking hustle\n\nThis candidate turned out to be problematic for us...",
      "user": {
        "id": 214,
        "name": "Boone Carlyle"
      }
    },
    {
      "created_at": "2014-03-26T20:26:38Z",
      "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
      "user": null
    }
  ]
}
```

Retrieve a candidate's activity feed.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the candidate whose activity feed you want to retrieve.

<br>
[See noteworthy response attributes.](#the-activity-feed-object)