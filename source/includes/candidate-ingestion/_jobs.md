# Jobs

## Retrieve Jobs

```shell
curl 'https://api.greenhouse.io/v1/partner/jobs'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> API Response

```json
[
  {
    "id": 146859,
    "name": "Auror",
    "status": "open",
    "public": true
  },
  {
    "id": 150050,
    "name": "Professor",
    "status": "open",
    "public": true
  },
  {
    "id": 147886,
    "name": "Caretaker",
    "status": "open",
    "public": false
  }
]
```

Retrieve jobs that are visible for the current user, including all jobs listed on their organization’s public careers page and unpublished jobs the user can access.

`GET https://api.greenhouse.io/v1/partner/jobs`

*scope: jobs.view*

### Request Parameters

This request is simply the URL. It takes no parameters.

### Response Parameters

| Property Name | Type           | Description
--------------- | -------------- | --------------
id              | Integer        | The ID of the job.
name            | String         | The name as it appears in Greenhouse, NOT necessarily how it appears on the public job board.
status          | String         | Always ‘open’.
public          | Boolean        | True if this job has any job posts that are currently live on any job board.