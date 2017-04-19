# Tracking Links

Job Posts can have tracking links associated with them that tell you the source and referrer for a particular job post link.

## The tracking link object

```json
{
  "id": 162,
  "token": "tnch4u",
  "created_at": "2012-10-07T15:06:35.975Z",
  "updated_at": "2016-09-27T17:52:56.533Z",
  "related_post_id": 1,
  "related_post_type": "SocialMediaPost",
  "job_id": 271,
  "source": {
    "id": 4,
    "public_name": "Twitter"
  },
  "credited_to": {
    "id": 1,
    "name": "Some Employee",
    "employee_id": "ABC12345"
  }
},
```

## JSON Schema

To view the JSON Schema definition for the Tracking Link object, please [click here](/schemas/tracking_links.json). This will tell you all of the valid types and definitions, as well as expected fields in the response.

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The tracking link's unique identifier |
| token | The token present in the url |
| related_post_id | If there is an associated social media post, the Greenhouse ID for that post |
| related_post_type | What type of post (for example, Social Media posts will be "SocialMediaPost") |
| job_id | The job associated with this tracking link |
| source | The source of the job (recruiter, social media site, etc) |
| credited_to | The employee credited with a referral for this tracking link |

## GET: List A Job's Tracking Links

List all of a job's tracking links

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/jobs/{job_id}/tracking_links'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 154,
    "token": "28gqos",
    "created_at": "2012-10-05T22:02:14.156Z",
    "updated_at": "2016-09-27T17:52:56.533Z",
    "related_post_id": null,
    "related_post_type": null,
    "job_id": 271,
    "source": null,
    "credited_to": null
  },
  {
    "id": 162,
    "token": "tnch4u",
    "created_at": "2012-10-07T15:06:35.975Z",
    "updated_at": "2016-09-27T17:52:56.533Z",
    "related_post_id": 1,
    "related_post_type": "SocialMediaPost",
    "job_id": 271,
    "source": {
      "id": 4,
      "public_name": "Twitter"
    },
    "credited_to": null
  },
  {
    "id": 163,
    "token": "ios7u4",
    "created_at": "2012-10-07T18:44:28.673Z",
    "updated_at": "2016-09-27T17:52:56.533Z",
    "related_post_id": null,
    "related_post_type": null,
    "job_id": 271,
    "source": null,
    "credited_to": null
  },
  {
    "id": 164,
    "token": "7ofrcb",
    "created_at": "2012-10-07T19:24:59.135Z",
    "updated_at": "2016-09-27T17:52:56.533Z",
    "related_post_id": null,
    "related_post_type": null,
    "job_id": 271,
    "source": null,
    "credited_to": null
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{job_id}/tracking_links`

### URL Parameters

Parameter | Description
--------- | -----------
job_id | The ID of the job associated with the tracking link

[See noteworthy response attributes.](#the-tracking-link-object)

## GET: List tags applied to candidate

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/jobs/{job_id}/tracking_links/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 162,
    "token": "tnch4u",
    "created_at": "2012-10-07T15:06:35.975Z",
    "updated_at": "2016-09-27T17:52:56.533Z",
    "related_post_id": 1,
    "related_post_type": "SocialMediaPost",
    "job_id": 271,
    "source": {
      "id": 4,
      "public_name": "Twitter"
    },
    "credited_to": {
      "id": 1,
      "name": "Some Employee",
      "employee_id": "ABC12345"
    }
  }
]
```

Retrieve the specific tracking link for a specified job.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{job_id}/tracking_links/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the tracking link you want to receive
job_id | The ID of the job associated with the tracking link

<br>

[See noteworthy response attributes.](#the-tracking-link-object)
