# Applications

## The application object

Applications associate [candidates](#candidates) with [jobs](#jobs). There are 2 kinds of applications: candidates and prospects. Candidate applications always have exactly 1 job. Prospect applications can have 0 or more jobs.

```json
{
  "id": 985314,
  "candidate_id": 978031,
  "prospect": false,
  "applied_at": "2014-03-26T20:11:39.000Z",
  "last_activity_at": "2014-03-27T16:13:15.000Z",
  "source": {
    "id": 1871,
    "public_name": "Happy Hour"
  },
  "credited_to": {
    "id": 4080,
    "name": "Kate Austen"
  },
  "jobs": [
    {
      "id": 123,
      "name": "Accounting Manager"
    }
  ],
  "status": "rejected",
  "current_stage": {
    "id": 62828,
    "name": "Recruiter Phone Screen"
  },
  "custom_fields": {
    "bio": null,
    "birthday": null
  }
}
```
### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | Application ID |
| prospect | If `true`, this is a prospect application which means that the associated person is a prospect and has not yet applied for this job.
| status | One of: `active`, `rejected`, `hired`.
| jobs | An array containing the [job](#jobs) that the candidate applied for.
| candidate_id | The ID of the [candidate](#candidates) who is applying for this job.
| current_stage | The current [stage](#job-stages) that this application is in.
| credited_to.id | The ID of the user who will receive credit for this application.
| answers | The answers provided to the questions in this application. Array contains the text value of the question and answer. Answers are always plaintext strings; booleans are represented with Yes or No.
| custom_fields | Contains a hash of the custom fields configured for this resource. The properties in this hash reflect the active custom fields as of the time this method is called.


## List applications

```shell
curl 'https://harvest.greenhouse.io/v1/applications'
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 4341,
    "candidate_id": 23123,
    "prospect": true,
    "applied_at": "2014-03-26T18:03:45.000Z",
    "last_activity_at": "2014-03-27T16:12:02.000Z",
    "source": null,
    "credited_to": {
      "id": 4080,
      "name": "Kate Austen"
    },
    "rejected_at": null,
    "rejection_reason": null,
    "jobs": [],
    "status": "active",
    "current_stage": null,
    "answers": []
  },
]
```
List all of an organization's applications.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| *per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| created_before | Return only applications that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only applications that were created after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| last_activity_after | Return only applications where 'updated_at' is after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| job_id | If supplied, only return applications that involve this job. Will return both candidates and prospects.

<br>
[See noteworthy response attributes.](#the-application-object)

## Retrieve an application

```shell
curl 'https://harvest.greenhouse.io/v1/applications/{id}'
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 4341,
  "candidate_id": 23123,
  "prospect": true,
  "applied_at": "2014-03-26T18:03:45.000Z",
  "last_activity_at": "2014-03-27T16:12:02.000Z",
  "source": null,
  "credited_to": {
    "id": 4080,
    "name": "Kate Austen"
  },
  "rejected_at": null,
  "rejection_reason": null,
  "jobs": [],
  "status": "active",
  "current_stage": null,
  "answers": []
}
```

Retrieve an application by its `id`.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{id}`

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the application to retrieve

<br>
[See noteworthy response attributes.] (#the-application-object)


## Advance an application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/advance'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "from_stage_id": 1
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 985314,
  "candidate_id": 978031,
  "prospect": false,
  "applied_at": "2014-03-26T20:11:39.000Z",
  "last_activity_at": "2014-03-27T16:13:15.000Z",
  "source": {
    "id": 1871,
    "public_name": "Happy Hour"
  },
  "credited_to": {
    "id": 4080,
    "name": "Kate Austen"
  },
  "jobs": [
    {
      "id": 123,
      "name": "Accounting Manager"
    }
  ],
  "status": "active",
  "current_stage": {
    "id": 2,
    "name": "Recruiter Phone Screen"
  }
}
```

Move this application to the next stage. The response is populated with the application's information which will reflect its new state. Note that only applications in the `active` state can be advanced.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/advance`


### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
from_stage_id | Yes | integer | The ID of the job stage this application is currently in.


## Move an application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/move'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "from_stage_id": 1,
  "to_stage_id": 2
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 985314,
  "candidate_id": 978031,
  "prospect": false,
  "applied_at": "2014-03-26T20:11:39.000Z",
  "last_activity_at": "2014-03-27T16:13:15.000Z",
  "source": {
    "id": 1871,
    "public_name": "Happy Hour"
  },
  "credited_to": {
    "id": 4080,
    "name": "Kate Austen"
  },
  "jobs": [
    {
      "id": 123,
      "name": "Accounting Manager"
    }
  ],
  "status": "active",
  "current_stage": {
    "id": 2,
    "name": "Recruiter Phone Screen"
  }
}
```

Move this application from one stage to another. The response is populated with the application's information which will reflect its new state. Note that only applications in the `active` state can be moved.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/move`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
from_stage_id | Yes | integer | The ID of the job stage this application is currently in.
to_stage_id | Yes | integer | The ID of the job stage this application should be moved to.

<br>

[See noteworthy response attributes.] (#the-application-object)

## Reject an application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/reject'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "rejection_reason_id": 815,
  "notes": "The candidate is not qualified for this position.",
  "rejection_email": {
    "send_email_at": "2014-03-26T20:11:39Z",
    "email_template_id": 42
  }
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 985314,
  "candidate_id": 978031,
  "prospect": false,
  "applied_at": "2014-03-26T20:11:39.000Z",
  "last_activity_at": "2014-03-27T16:13:15.000Z",
  "source": {
    "id": 1871,
    "public_name": "Happy Hour"
  },
  "credited_to": {
    "id": 4080,
    "name": "Kate Austen"
  },
  "jobs": [
    {
      "id": 123,
      "name": "Accounting Manager"
    }
  ],
  "status": "rejected",
  "current_stage": {
    "id": 62828,
    "name": "Recruiter Phone Screen"
  }
}
```

Reject this application. The response is populated with the application's information which will reflect its new state. Note that only applications in the `active` state can be rejected.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/reject`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
rejection_reason_id | No | integer | The ID of the reason why this application was rejected.
notes | No | string | Notes on why this application was rejected. These will be added to the activity feed.
rejection_email | No | hash | An email will be sent to the candidate notifying them of this rejection.
rejection_email.sent_email_at | Yes, if sending rejection_email | string | The rejection email will be delayed until this time.
rejection_email.email_template_id | No | string | The template the to use for the rejection email.

## Unreject an application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/unreject'\
  -H "On-Behalf-Of: {greenhouse user ID}"\
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> A successful response:

```json
{
  "id": 985314,
  "candidate_id": 978031,
  "prospect": false,
  "applied_at": "2014-03-26T20:11:39.000Z",
  "last_activity_at": "2014-03-27T16:13:15.000Z",
  "source": {
    "id": 1871,
    "public_name": "Happy Hour"
  },
  "credited_to": {
    "id": 4080,
    "name": "Kate Austen"
  },
  "jobs": [
    {
      "id": 123,
      "name": "Accounting Manager"
    }
  ],
  "status": "active",
  "current_stage": {
    "id": 62828,
    "name": "Recruiter Phone Screen"
  }
}
```

> An unsuccessful response:

```json
{
  "errors": [
    {
      "message": "Application must be 'rejected', is currently 'active'"
    }
  ]
}
```

Unreject this application. The response is populated with the application in its new state. Note that only applications in the `rejected` state can be unrejected.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/unreject`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the application to unreject

### JSON Body Parameters

No JSON body parameters

## Delete an application

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/applications/{id}'\
  -H "On-Behalf-Of: {greenhouse user ID}"\
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> A successful response:

```json
{
  "message": "Application 38766866 has been deleted."
}
```

> An unsuccessful response:

```json
{
  "message": "Resource not found"
}
```

Delete this application.

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/applications/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the application to delete

### JSON Body Parameters

No JSON body parameters

