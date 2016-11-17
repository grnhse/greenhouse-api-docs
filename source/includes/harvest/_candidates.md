# Candidates

An organization's candidates.

## The candidate object

```json
{
  "id": 6801407,
  "first_name": "Zooey",
  "last_name": "Teddy",
  "company": "Leeo, Inc",
  "title": "Senior Digital Marketing Manager",
  "created_at": "2015-05-29T18:19:00Z",
  "last_activity": "2015-05-29T20:01:05Z",
  "photo_url": "https://blah.s3.amazonaws.com/people/photos/006/801/407/original/photo.jpg?AWSAccessKeyId=AKIAJOIDJAU24P2KP55A&Expires=1453190734&Signature=sd1cv%2BQuFCL%2F2TDJeBH5r4mM0jU%3D",
  "attachments": [],
  "application_ids": [
    7827056
  ],
  "phone_numbers": [
    {
      "value": "330-281-8004",
      "type": "home"
    },
    {
      "value": "330-281-8004",
      "type": "home"
    }
  ],
  "addresses": [
    {
      "value": "21 Jump Street, New York, NY 10003",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "zooey.teddy.6801407@example.com",
      "type": "personal"
    },
    {
      "value": "zooey.teddy.6801407@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "http://www.example.com/",
      "type": "personal"
    }
  ],
  "social_media_addresses": [],
  "recruiter": {
    "id": 78582,
    "name": "Carl Sacramento"
  },
  "coordinator": null,
  "tags": [],
  "custom_fields": {
    "current_salary": null,
    "desired_salary": null
  }
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The candidate's unique identifier |
| company | The company at which the candidate currently works
| title | The candidate's current title
| application_ids | Array of [application](#applications) IDs associated with this candidate. Can contain none, one, or several application IDs.
| phone_numbers[].type | One of: ["home", "work", "mobile", "skype", "other"]
| addresses[].type | One of: ["home", "work", "other"]
| email_addresses[].type | One of: ["personal", "work", "other"]
| website_addresses[].type | One of: ["personal", "company", "portfolio", "blog", "other"]
| recruiter | The recruiter [user](#users) who is responsible for this candidate.
| coordinator | The coordinator [user](#users) who is responsible for this candidate.
| attachments[].type | One of: ["admin_only", "public", "cover_letter", "offer_packet", "resume", "take_home_test"]
| attachments[].url | URLs expire in 30 days.
| custom_fields | Contains a hash of the custom fields configured for this resource. The properties in this hash reflect the active custom fields as of the time this method is called.

## List candidates

```shell
curl 'https://harvest.greenhouse.io/v1/candidates' 
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 6801407,
    "first_name": "Zooey",
    "last_name": "Teddy",
    "company": "Leeo, Inc",
    "title": "Senior Digital Marketing Manager",
    "created_at": "2015-05-29T18:19:00Z",
    "last_activity": "2015-05-29T20:01:05Z",
    "photo_url": "https://blah.s3.amazonaws.com/people/photos/006/801/407/original/photo.jpg?AWSAccessKeyId=AKIAJOIDJAU24P2KP55A&Expires=1453190734&Signature=sd1cv%2BQuFCL%2F2TDJeBH5r4mM0jU%3D",
    "attachments": [],
    "application_ids": [
      7827056
    ],
    "phone_numbers": [
      {
        "value": "330-281-8004",
        "type": "home"
      },
      {
        "value": "330-281-8004",
        "type": "home"
      }
    ],
    "addresses": [
      {
        "value": "21 Jump Street, New York, NY 10003",
        "type": "home"
      }
    ],
    "email_addresses": [
      {
        "value": "zooey.teddy.6801407@example.com",
        "type": "personal"
      },
      {
        "value": "zooey.teddy.6801407@example.com",
        "type": "personal"
      }
    ],
    "website_addresses": [
      {
        "value": "http://www.example.com/",
        "type": "personal"
      }
    ],
    "social_media_addresses": [],
    "recruiter": {
      "id": 78582,
      "name": "Carl Sacramento"
    },
    "coordinator": null,
    "tags": [],
    "custom_fields": {
      "current_salary": null,
      "desired_salary": null
    }
  },
]
```

List all of an organization's candidates.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| created_before | Return only candidates that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only candidates that were created after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before | Return only candidates that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after | Return only candidates that were updated after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.

<br>

[See noteworthy response attributes.] (#the-candidate-object)

## Retrieve a candidate

```shell
curl 'https://harvest.greenhouse.io/v1/candidates/{id}' 
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 6801407,
  "first_name": "Zooey",
  "last_name": "Teddy",
  "company": "Leeo, Inc",
  "title": "Senior Digital Marketing Manager",
  "created_at": "2015-05-29T18:19:00Z",
  "last_activity": "2015-05-29T20:01:05Z",
  "photo_url": "https://blah.s3.amazonaws.com/people/photos/006/801/407/original/photo.jpg?AWSAccessKeyId=AKIAJOIDJAU24P2KP55A&Expires=1453190734&Signature=sd1cv%2BQuFCL%2F2TDJeBH5r4mM0jU%3D",
  "attachments": [],
  "application_ids": [
    7827056
  ],
  "phone_numbers": [
    {
      "value": "330-281-8004",
      "type": "home"
    },
    {
      "value": "330-281-8004",
      "type": "home"
    }
  ],
  "addresses": [
    {
      "value": "21 Jump Street, New York, NY 10003",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "zooey.teddy.6801407@example.com",
      "type": "personal"
    },
    {
      "value": "zooey.teddy.6801407@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "http://www.example.com/",
      "type": "personal"
    }
  ],
  "social_media_addresses": [],
  "recruiter": {
    "id": 78582,
    "name": "Carl Sacramento"
  },
  "coordinator": null,
  "tags": [],
  "custom_fields": {
    "current_salary": null,
    "desired_salary": null
  }
}
```

Retrieve a candidate by its `id`.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the candidate to retrieve

<br>

[See noteworthy response attributes.] (#the-candidate-object)

## Edit a candidate

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/candidates/{id}'
-H "On-Behalf-Of: {greenhouse user ID}" 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "first_name": "John",
  "last_name": "Locke",
  "company": "The Tustin Box Company",
  "title": "Man of Mystery",
  "phone_numbers": [
    {
      "value": "555-1212",
      "type": "mobile"
    }
  ],
  "addresses": [
    {
      "value": "123 Fake St.",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "john.locke+work@example.com",
      "type": "work"
    },
    {
      "value": "john.locke@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "johnlocke.example.com",
      "type": "personal"
    }
  ],
  "social_media_addresses": [
    {
      "value": "linkedin.example.com/john.locke"
    },
    {
      "value": "@johnlocke"
    }
  ],
  "tags": [
    "Walkabout",
    "Orientation"
  ]
}
```
> The above returns a JSON response, structured like this:

```json
[
  {
    "id": 123,
    "first_name": "John",
    "last_name": "Locke",
    "company": "The Tustin Box Company",
    "title": "Man of Mystery",
    "created_at": "2014-03-26T20:11:39Z",
    "last_activity": "2014-03-26T20:11:39Z",
    "photo_url": null,
    "attachments": [
      {
        "filename": "resume.pdf",
        "url": "https://prod-heroku.s3.amazonaws.com/...",
        "type": "resume"
      },
      {
        "filename": "cover_letter.pdf",
        "url": "https://prod-heroku.s3.amazonaws.com/...",
        "type": "cover_letter"
      },
      {
        "filename": "portfolio.pdf",
        "url": "https://prod-heroku.s3.amazonaws.com/...",
        "type": "attachment"
      }
    ],
    "application_ids": [
      456
    ],
    "phone_numbers": [
      {
        "value": "555-1212",
        "type": "mobile"
      }
    ],
    "addresses": [
      {
        "value": "123 Fake St.",
        "type": "home"
      }
    ],
    "email_addresses": [
      {
        "value": "john.locke+work@example.com",
        "type": "work"
      },
      {
        "value": "john.locke@example.com",
        "type": "personal"
      }
    ],
    "website_addresses": [
      {
        "value": "johnlocke.example.com",
        "type": "personal"
      }
    ],
    "social_media_addresses": [
      {
        "value": "linkedin.example.com/john.locke"
      },
      {
        "value": "@johnlocke"
      }
    ],
    "recruiter": {
      "id": 712,
      "name": "Charlie Pace"
    },
    "coordinator": {
      "id": 16,
      "name": "Hugo Reyes"
    },
    "tags": [
      "Walkabout",
      "Orientation"
    ],
    "custom_fields": {
      "current_salary": "$23k",
      "desired_salary": "$42k"
    }
  }
]
```

Update or `patch` a single candidate by its `id`.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/candidates/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
id | No | integer |   The ID of the candidate to retrieve
first_name | No | string | The candidate's first name
last_name | No | string | The candidate's last name
company | No | string | The candidate's company
title | No | string | The candidate's title
phone_numbers[] | No | phone_number | Array of phone numbers. Passing an empty array will clear all.
addresses[] | No | address | Array of addresses. Passing an empty array will clear all.
email_addresses[] | No | email_address | Array of email addresses. Passing an empty array will clear all.
website_addresses[] | No | website_address | Array of website addresses. Passing an empty array will clear all.
social_media_addresses[] | No | social_media_address | Array of social media addresses. Passing an empty array will clear all.
tags[] | No | string | Array of tags as strings. Passing an empty array will clear all.

<br>

[See noteworthy response attributes.] (#the-candidate-object)



## Create an attachment for a candidate

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/attachments'
-H "On-Behalf-Of: {greenhouse user ID}" 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "filename" : "resume.pdf",
  "type" : "resume",
  "content" : "R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs"
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "filename": "resume.pdf",
  "url": "https://prod-heroku.s3.amazonaws.com/...",
  "type": "resume"
}
```

Post an attachment to a candidate's profile by the candidate `id`.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/attachments`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
id | Yes | integer |   The ID of the candidate to retrieve
filename | Yes | string | Name of the file
type | Yes | string | One of: ["resume", "cover_letter", "admin_only"]
content | No | string | Base64 encoded content of the attachment (if you are providing content, you do not need to provide url)
url | No | string | Url of the attachment (if you are providing the url, you do not need to provide the content)






## Anonymize a candidate

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/candidates/{id}/anonymize?fields={field_names}'
-H "On-Behalf-Of: {greenhouse user ID}" 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 123,
  "first_name": "Anonymized",
  "last_name": "123",
  "company": "The Tustin Box Company",
  "title": "Man of Mystery",
  "created_at": "2014-03-26T20:11:39Z",
  "last_activity": "2014-03-26T20:11:39Z",
  "photo_url": null,
  "attachments": [
    {
      "filename": "resume.pdf",
      "url": "https://prod-heroku.s3.amazonaws.com/...",
      "type": "resume"
    },
    {
      "filename": "cover_letter.pdf",
      "url": "https://prod-heroku.s3.amazonaws.com/...",
      "type": "cover_letter"
    },
    {
      "filename": "portfolio.pdf",
      "url": "https://prod-heroku.s3.amazonaws.com/...",
      "type": "attachment"
    }
  ],
  "application_ids": [
    456
  ],
  "phone_numbers": [
    {
      "value": "555-1212",
      "type": "mobile"
    }
  ],
  "addresses": [
    {
      "value": "123 Fake St.",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "john.locke+work@example.com",
      "type": "work"
    },
    {
      "value": "john.locke@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "johnlocke.example.com",
      "type": "personal"
    }
  ],
  "social_media_addresses": [
    {
      "value": "linkedin.example.com/john.locke"
    },
    {
      "value": "@johnlocke"
    }
  ],
  "recruiter": {
    "id": 712,
    "name": "Charlie Pace"
  },
  "coordinator": {
    "id": 16,
    "name": "Hugo Reyes"
  },
  "tags": [
    "Walkabout",
    "Orientation"
  ],
  "custom_fields": {
    "current_salary": "$23k",
    "desired_salary": "$42k"
  }
}
```

Anonymize the data associated with a candidate.

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/candidates/{id}/anonymize?fields={field_names}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
fields | Yes | comma-delimited string | The set of field names that should be anonymized on the candidate from the following list: full_name, current_company, current_title, tags, phone_numbers, emails, social_media_links, websites, addresses, location, custom_candidate_fields, source, recruiter, coordinator, attachments, application_questions, referral_questions, notes, rejection_notes, email_addresses, activity_items, innotes, inmails, rejection_reason, scorecards_and_interviews, offers, credited_to, headline, all_offer_versions, and follow_up_reminders.

## Create a candidate's note

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed/notes'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```
{
  "user_id": "158108",
  "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
  "visibility": "admin_only"
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "created_at": "2015-07-17T16:29:31Z",
  "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
  "user": {
    "id": 214,
    "name": "Boone Carlyle"
  },
  "private": false,
  "visibility": "admin_only"
}
```

Create a candidate note.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed/notes`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
user_id | Yes | integer |   The ID of the user creating the note
body | Yes | string | Note body
visibility | Yes | string | One of: `"admin_only"`, `"private"`, `"public"`

## Delete a candidate

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/candidates/{id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> A successful response:

```json
{
  "message": "Candidate 38766866 has been deleted."
}
```

> An unsuccessful response:

```json
{
  "message": "Resource not found"
}
```

Delete this candidate.

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/candidates/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the candidate to delete

### JSON Body Parameters

No JSON body parameters

