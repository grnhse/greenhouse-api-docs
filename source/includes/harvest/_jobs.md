# Jobs

## The job object

Your organization's jobs.

```json
{
  "id": 6404,
  "name": "Archaeologist",
  "requisition_id": "abc123",
  "notes": "<p>Resistance to electro-magnetic radiation a plus!</p>",
  "status": "closed",
  "created_at": "2013-12-10T14:42:58Z",
  "opened_at": "2013-12-11T14:42:58Z",
  "closed_at": "2013-12-12T14:42:58Z",
  "departments": [
    {
      "id": 562,
      "name": "Exploration"
    }
  ],
  "offices": [
    {
      "id": 175,
      "name": "San Francisco",
      "location": {
        "name": "San Francisco, CA"
      }
    }
  ],
  "custom_fields": {
    "employment_type": "Full-Time",
    "maximum_budget": "$81.5k",
    "salary_range": {
      "min_value": 70000,
      "max_value": 90000,
      "unit": "USD"
    }
  },
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 84275,
        "name": "Kaylee Prime"
      },
      {
        "id": 169779,
        "name": "Hank Hollandaise"
      }
    ],
    "recruiters": [
      {
        "id": 81111,
        "name": "Samuel Skateboard",
        "responsible": false
      },
      {
        "id": 153448,
        "name": "Stegosaurus Heels",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 122635,
        "name": "Teddy Pizzazz",
        "responsible": true
      },
      {
        "id": 177046,
        "name": "Mirandella Lager",
        "responsible": false
      }
    ],
    "sourcers": [
      {
        "id": 122635,
        "name": "Teddy Pizzazz"
      }
    ]
  },
  "openings": [
    {
      "opening_id": "3-1",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.736Z",
      "closed_at": null,
      "application_id": null
    },
    {
      "opening_id": "3-2",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.739Z",
      "closed_at": null,
      "application_id": null
    },
    {
      "opening_id": null,
      "status": "open",
      "opened_at": "2016-02-03T20:00:00.000Z",
      "closed_at": null,
      "application_id": null
    },
    {
      "opening_id": "2-4",
      "status": "closed",
      "opened_at": "2016-02-03T16:38:46.985Z",
      "closed_at": "2016-02-03T16:39:09.811Z",
      "application_id": 1232
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The job's unique identifier |
| requisition_id | An arbitrary ID provided by an external source; does not map to another entity within Greenhouse.
| status | One of `open`, `closed`, `draft`.
| departments | An array containing the [department](#departments) which this job belongs to.
| offices | An array containing the [offices](#offices) this job is associated with.
| hiring_team | Lists the names and User IDs of the hiring managers, recruiters, coordinators and sourcers associated with this job. For recruiters and coordinators, there is a `responsible` boolean flag which indicates that the user is the responsible recruiter or coordinator for this job.
| custom_fields | Contains any custom job fields which have been defined by your organization.
| openings | Lists the openings associated with this job.
| openings[].id | Custom identifier set by an organization. Can be `null`.
| openings[].status | One of: `["open", "closed"]`
| openings[].opened_at | Timestamp when the opening was created. |
| openings[].closed_at | Timestamp when the opening was closed. An opening is closed when it is filled or removed.
| openings[].application_id | If the opening is closed and a candidate was hired to fill the opening, this is the ID of the candidate's application. Otherwise, null.


## List jobs

```shell
curl 'https://harvest.greenhouse.io/v1/jobs' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 144371,
    "name": "Good Cop",
    "requisition_id": "1",
    "notes": null,
    "status": "open",
    "created_at": "2015-11-19T19:53:32.662Z",
    "opened_at": "2015-11-19T19:53:32.662Z",
    "closed_at": null,
    "departments": [
      {
        "id": 13585,
        "name": "Rule Enforcement"
      }
    ],
    "offices": [
      {
        "id": 8787,
        "name": "New York City",
        "location": {
          "name": "New York, NY, United States"
        }
      }
    ],
    "hiring_team": {
      "hiring_managers": [
        {
          "id": 158108,
          "name": "Sam McsSamson"
        }
      ],
      "recruiters": [
        {
          "id": 158101,
          "name": "Major Tom",
          "responsible": true
        }
      ],
      "coordinators": [
        {
          "id": 158109,
          "name": "Roger Cord",
          "responsible": true
        }
      ],
      "sourcers": [
        {
          "id": 158102,
          "name": "Lara Sourcerer"
        }
      ]
    },
    "custom_fields": {
      "bonus": "1000",
      "employment_type": "Full-time",
      "options": "2000",
      "salary": "54111"
    },
    "openings": [
      {
        "opening_id": "1-1",
        "status": "closed",
        "opened_at": "2015-11-19T19:53:32.564Z",
        "closed_at": "2016-01-26T23:59:07.592Z",
        "application_id": 24709881
      },
      {
        "opening_id": "1-2",
        "status": "open",
        "opened_at": "2015-11-19T19:53:32.565Z",
        "closed_at": null,
        "application_id": null
      }
    ]
  }
]
```

List all of your organization's jobs.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.](#the-job-object)


## Retrieve a job

```shell
curl 'https://harvest.greenhouse.io/v1/jobs/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 144371,
  "name": "Good Cop",
  "requisition_id": "1",
  "notes": null,
  "status": "open",
  "created_at": "2015-11-19T19:53:32.662Z",
  "opened_at": "2015-11-19T19:53:32.662Z",
  "closed_at": null,
  "departments": [
    {
      "id": 13585,
      "name": "Rule Enforcement"
    }
  ],
  "offices": [
    {
      "id": 8787,
      "name": "New York City",
      "location": {
        "name": "New York, NY, United States"
      }
    }
  ],
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 158108,
        "name": "Sam McsSamson"
      }
    ],
    "recruiters": [
      {
        "id": 158101,
        "name": "Major Tom",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 158109,
        "name": "Roger Cord",
        "responsible": true
      }
    ],
    "sourcers": [
      {
        "id": 158102,
        "name": "Lara Sourcerer"
      }
    ]
  },
  "custom_fields": {
    "bonus": "1000",
    "employment_type": "Full-time",
    "options": "2000",
    "salary": "54111"
  },
  "openings": [
    {
      "opening_id": "1-1",
      "status": "closed",
      "opened_at": "2015-11-19T19:53:32.564Z",
      "closed_at": "2016-01-26T23:59:07.592Z",
      "application_id": 24709881
    },
    {
      "opening_id": "1-2",
      "status": "open",
      "opened_at": "2015-11-19T19:53:32.565Z",
      "closed_at": null,
      "application_id": null
    }
  ]
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{id}`


### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the job to retrieve

<br>
[See noteworthy response attributes.](#the-job-object)