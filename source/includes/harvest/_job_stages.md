# Job Stages

An organization's job stages.

## The job stage object

```json
{
  "id": 72200,
  "name": "Face to Face",
  "created_at": "2016-10-22T05:31:37.263Z",
  "updated_at": "2016-10-22T05:31:37.263Z",
  "active": true,
  "job_id": 98765,
  "priority": 0,
  "interviews": [
    {
      "id": 6001,
      "name": "Cultural Fit Interview",
      "schedulable": true,
      "estimated_minutes": 30,
      "default_interviewer_users": [
        {
          "id": 821,
          "first_name": "Robert",
          "last_name": "Robertson",
          "name": "Robert Robertson",
          "employee_id": "100377"
        }
      ],
      "interview_kit": {
        "id": 9123,
        "content": "<h5>Purpose</h5><span>Determine whether or not the candidate would be a strong fit.</span>",
        "questions": [
          {
            "id": 11052,
            "question": "Is this person really a good fit?"
          }
        ]
      }
    },
    {
      "id": 6002,
      "name": "Executive Interview",
      "schedulable": true,
      "estimated_minutes": 60,
      "default_interviewer_users": [
        {
          "id": 4080,
          "first_name": "Kate",
          "last_name": "Austen",
          "name": "Kate Austen",
          "employee_id": "12345"
        }
      ],
      "interview_kit": {
        "id": 9124,
        "content": "<h5>Purpose</h5><span>See if they can work with the boss.</span>",
        "questions": [
          {
            "id": 11053,
            "question": "What's their favorite color?"
          },
          {
            "id": 11054,
            "question": "Do they really want to work here?"
          }
        ]
      }
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The job stage's unique identifier |
| name | The name for this job stage |
| active | One of `true` or `false`:<br>`true` - The job stage is active<br>`false` - The job stage was deleted |
| job_id | The job that this stage belongs to |
| priority| Numeric field used for ordering, with the lowest values ordered first. For example, priority 0 indicates the first stage on a job
| interviews | An array of interview steps associated with this job stage.<br>Each Step contains:<br>`id` - The step's unique identifier<br>`name` - The name of this interview step<br>`schedulable` - True / False value for whether this step can be scheduled<br>`interview_kit` - Details about the interview, including unique ID, interview prep content, and custom interview questions |


## GET: List Job Stages

```shell
curl 'https://harvest.greenhouse.io/v1/job_stages' 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 6001,
    "name": "Cultural Fit Interview",
    "created_at": "2015-11-22T05:31:37.263Z",
    "updated_at": "2015-11-22T05:31:37.263Z",
    "job_id": 12345,
    "priority": 0,
    "interviews": [
      {
        "id": 7890,
        "name": "Cultural Fit Interview",
        "schedulable": true,
        "estimated_minutes": 30,
        "default_interviewer_users": [
          {
            "id": 821,
            "first_name": "Robert",
            "last_name": "Robertson",
            "name": "Robert Robertson",
            "employee_id": "100377"
          }
        ],
        "interview_kit": {
          "id": 9124,
          "content": "<h5>Purpose</h5><span>Determine whether or not the candidate would be a strong fit.</span>",
          "questions": [
              {
                "id": 11052,
                "question": "Is this person really a good fit?"
              }
            ]        
          }
        }
      ]
    },
  {
    "id": 6002,
    "name": "Executive Interview",
    "created_at": "2015-11-22T05:31:37.263Z",
    "updated_at": "2015-11-22T05:31:37.263Z",
    "job_id": 34567,
    "priority": 1,
    "interviews": [
      {
        "id": 7345,
        "name": "Executive Interview",
        "schedulable": true,
        "estimated_minutes": 60,
        "default_interviewer_users": [
          {
            "id": 4080,
            "first_name": "Kate",
            "last_name": "Austen",
            "name": "Kate Austen",
            "employee_id": "12345"
          }
        ],
        "interview_kit": {
          "id": 9125,
          "content": "<h5>Purpose</h5><span>Determine whether or not the candidate would be a strong fit.</span>",
          "questions": [
              {
                "id": 11053,
                "question": "What's their favorite color?"
              },
              {
                "id": 11054,
                "question": "Do they really want to work here?"
              }
            ]        
          }
        }
      ]
    }
  ]
```

List all of an organization's job stages.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/job_stages`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| *per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| *skip_count | If `true`, the performance of retrieving job stages will improve. This will remove `last` from the `link` response header.
| created_before | Return only job stages that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only job stages that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before | Return only job stages that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after | Return only job stages that were updated at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.

<br>
[See noteworthy response attributes.](#the-job-stages-object)

## GET: List Job Stages for Job

```shell
curl 'https://harvest.greenhouse.io/v1/jobs/{id}/stages' 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 72200,
    "name": "Face to Face",
    "created_at": "2015-11-22T05:31:37.263Z",
    "updated_at": "2015-11-22T05:31:37.263Z",
    "job_id": 146218,
    "priority": 0,
    "interviews": [
      {
        "id": 6001,
        "name": "Cultural Fit Interview",
        "schedulable": true,
        "estimated_minutes": 30,
        "default_interviewer_users": [
          {
            "id": 821,
            "first_name": "Robert",
            "last_name": "Robertson",
            "name": "Robert Robertson",
            "employee_id": "100377"
          }
        ],
        "interview_kit": {
          "id": 9128,
          "content": "<h5>Purpose</h5><span>Determine whether or not the candidate would be a strong fit.</span>",
          "questions": [
            {
              "id": 11052,
              "question": "Is this person really a good fit?"
            }
          ]
        }
      },
      {
        "id": 6002,
        "name": "Executive Interview",
        "schedulable": true,
        "created_at": "2015-11-22T05:31:37.263Z",
        "updated_at": "2015-11-22T05:31:37.263Z",
        "job_id": 146219,
        "estimated_minutes": 60,
        "default_interviewer_users": [
          {
            "id": 4080,
            "first_name": "Kate",
            "last_name": "Austen",
            "name": "Kate Austen",
            "employee_id": "12345"
          }
        ],
        "interview_kit": {
          "id": 9129,
          "content": "<h5>Purpose</h5><span>See if they can work with the boss.</span>",
          "questions": [
            {
              "id": 11053,
              "question": "What's their favorite color?"
            },
            {
              "id": 11054,
              "question": "Do they really want to work here?"
            }
          ]
        }
      }
    ]
  },
  {
    "id": 72199,
    "name": "Offer",
    "created_at": "2015-11-22T05:31:37.263Z",
    "updated_at": "2015-11-22T05:31:37.263Z",
    "job_id": 146220,
    "priority": 1,
    "interviews": []
  },
  {
    "id": 72194,
    "name": "Application Review",
    "created_at": "2015-11-22T05:31:37.263Z",
    "updated_at": "2015-11-22T05:31:37.263Z",
    "job_id": 146221,
    "priority": 2,
    "interviews": [
      {
        "id": 8004,
        "name": "Application Review",
        "schedulable": false,
        "interview_kit": {
          "id": 9130,
          "content": null,
          "questions": []
        }
      }
    ]
  }
]
```

Retrieve the stages for the specified job id.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{id}/stages`

### URL Parameters

Parameter | Description
--------- | -----------
| id | The ID of the job whose job stages you want to retrieve.

### Querystring parameters

Parameter | Description
--------- | -----------
| created_before | Return only job stages that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only job stages that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before | Return only job stages that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after | Return only job stages that were updated at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.

<br>
[See noteworthy response attributes.](#the-job-stage-object)

## GET: Retrieve Job Stage

```shell
curl 'https://harvest.greenhouse.io/v1/job_stages/{id}' 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 6001,
  "name": "Cultural Fit Interview",
  "created_at": "2015-11-22T05:31:37.263Z",
  "updated_at": "2015-11-22T05:31:37.263Z",
  "job_id": 12345,
  "priority": 1,
  "interviews": [
    {
      "id": 7890,
      "name": "Cultural Fit Interview",
      "schedulable": true,
      "estimated_minutes": 30,
      "default_interviewer_users": [
        {
          "id": 821,
          "first_name": "Robert",
          "last_name": "Robertson",
          "name": "Robert Robertson",
          "employee_id": "100377"
        }
      ],
      "interview_kit": {
        "id": 9127,
        "content": "<h5>Purpose</h5><span>Determine whether or not the candidate would be a strong fit.</span>",
        "questions": [
            {
              "id": 11052,
              "question": "Is this person really a good fit?"
            }
          ]        
        }
      }
    ]
  }
```

Retreieve a job stage by its `id`.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/job_stages/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the job stage to retrieve


<br>
[See noteworthy response attributes.](#the-job-stages-object)
