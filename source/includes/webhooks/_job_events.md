# Job Events

## Job created

```json
{
  "action": "job_created",
  "payload": {
    "job": {
      "id": 371417,
      "name": "Software Engineer",
      "requisition_id": null,
      "notes": "Looking for the best!",
      "confidential": false,
      "job_post_id": 2154,
      "status": "open",
      "created_at": "2016-10-20T18:16:32Z",
      "opened_at": "2016-10-20T18:16:32Z",
      "closed_at": null,
      "departments": [
        {
          "id": 7,
          "name": "Technology",
          "external_id": "ex-dept-1"
        }
      ],
      "offices": [
        {
          "id": 13,
          "name": "New York City",
          "location": "New York, NY",
          "external_id": "ex-office-1"
        },
        {
          "id": 14,
          "name": "St. Louis",
          "location": null,
          "external_id": null
        }
      ],
      "hiring_team": {
        "hiring_managers": [
          {
            "user_id": 1234,
            "employee_id": "abc-123"
          }
        ],
        "sourcers": [],
        "recruiters": [
          {
            "user_id": 2345,
            "employee_id": null
          },
          {
            "user_id": 3456,
            "employee_id": "abc-234"
          }
        ],
        "coordinators": []
      },
      "openings": [
        {
          "id": 1234,
          "opening_id": "abc-1",
          "custom_fields": []
        },
        {
          "id": 1235,
          "opening_id": "abc-2",
          "custom_fields": []
        }
      ],
      "custom_fields": {
        "approved": {
          "name": "Approved",
          "type": "boolean",
          "value": true
        },
        "employment_type": {
          "name": "Employment Type",
          "type": "single_select",
          "value": "Full-time"
        },
        "salary_range": {
          "name": "SalaryRange",
          "type": "currency_range",
          "value": {
            "unit": "USD",
            "min_value": "10000.0",
            "max_value": "20000.0"
          }
        }
      }
    }
  }
}
```

The Job Created event is triggered when a new job is created from scratch or copied from another job.

| Attribute | Note |
|-----------|------|
| `hiring_team` | Field contains the Greenhouse users responsible for this job.  Each field contains the user's Greenhouse user id and the user's external employee id from the customer's system.  The employee id will be null if it has not been set in Greenhouse.
| `openings` | Field contains all the openings in this job. The custom field element on each opening may be omitted if the organization does not have custom fields on openings enabled.

## Job deleted

This webhook only fires when jobs are deleted from the Greenhouse system. This only happens when a job is closed and then the "Delete" button is clicked from the Job Dashboard.

```json
{
  "action": "job_deleted",
  "payload": {
    "job": {
      "id": 209256,
      "name": "Project Manager"
    }
  }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `id` | The internal Greenhouse Job id |
| `name` | The name of the job that was deleted |

## Job updated

```json
{
  "action": "job_updated",
  "payload": {
    "job": {
      "id": 100445,
      "name": "Assistant Store Manager, NYC",
      "requisition_id": null,
      "notes": "<p>Looking for the best!<\/p>",
      "confidential": false,
      "job_post_id": 88010,
      "status": "open",
      "created_at": "2015-08-11T23:02:09Z",
      "opened_at": "2015-08-11T23:02:09Z",
      "closed_at": null,
      "departments": [
        {
          "id": 74,
          "name": "Guideshops",
          "external_id": "ex-dept-1"
        }
      ],
      "offices": [
        {
          "id": 104,
          "name": "New York",
          "location": "New York, NY",
          "external_id": "ex-office-1"
        }
      ],
      "hiring_team": {
        "hiring_managers": [
          {
            "user_id": 1234,
            "employee_id": "abc-123"
          }
        ],
        "sourcers": [],
        "recruiters": [
          {
            "user_id": 2345,
            "employee_id": null
          },
          {
            "user_id": 3456,
            "employee_id": "abc-234"
          }
        ],
        "coordinators": []
      },
      "openings": [
        {
          "id": 1234,
          "opening_id": "abc-1",
          "custom_fields": []
        },
        {
          "id": 1235,
          "opening_id": "abc-2",
          "custom_fields": []
        }
      ],
      "custom_fields": {
        "bonus": {
          "name": "Bonus",
          "type": "short_text",
          "value": null
        },
        "employment_type": {
          "name": "Employment Type",
          "type": "single_select",
          "value": null
        },
        "options": {
          "name": "Options",
          "type": "short_text",
          "value": null
        },
        "salary": {
          "name": "Salary",
          "type": "short_text",
          "value": null
        }
      }
    }
  }
}
```

The Job Updated event is triggered any time one or more of the following fields are changed for a job: Internal Job Name, Department, Office, Level, Open Date, Status, Notes, Team and Responsibilities, and How To Sell This Job. Changes to custom fields on a job will also trigger this webhook.


| Attribute | Note |
|-----------|------|
| `hiring_team` | Field contains the Greenhouse users responsible for this job.  Each field contains the user's Greenhouse user id and the user's external employee id from the customer's system.  The employee id will be null if it has not been set in Greenhouse.
| `openings` | Field contains all the openings in this job. The custom field element on each opening may be omitted if the organization does not have custom fields on openings enabled.

## Job Approved

```json
{
  "action": "job_approved",
  "payload": {
    "approval_flow": {
      "approval_flow_type": "open_job"
    },
    "job": {
      "id": 100445,
      "name": "Assistant Store Manager, NYC",
      "requisition_id": null,
      "notes": "<p>Looking for the best!<\/p>",
      "confidential": false,
      "job_post_id": 88010,
      "status": "open",
      "created_at": "2015-08-11T23:02:09Z",
      "opened_at": "2015-08-11T23:02:09Z",
      "closed_at": null,
      "departments": [
        {
          "id": 74,
          "name": "Guideshops",
          "external_id": "ex-dept-1"
        }
      ],
      "offices": [
        {
          "id": 104,
          "name": "New York",
          "location": "New York, NY",
          "external_id": "ex-office-1"
        }
      ],
      "hiring_team": {
        "hiring_managers": [
          {
            "user_id": 1234,
            "employee_id": "abc-123"
          }
        ],
        "sourcers": [],
        "recruiters": [
          {
            "user_id": 2345,
            "employee_id": null
          },
          {
            "user_id": 3456,
            "employee_id": "abc-234"
          }
        ],
        "coordinators": []
      },
      "openings": [
        {
          "id": 1234,
          "opening_id": "abc-1",
          "custom_fields": []
        },
        {
          "id": 1235,
          "opening_id": "abc-2",
          "custom_fields": []
        }
      ],
      "custom_fields": {
        "bonus": {
          "name": "Bonus",
          "type": "short_text",
          "value": null
        },
        "employment_type": {
          "name": "Employment Type",
          "type": "single_select",
          "value": null
        },
        "options": {
          "name": "Options",
          "type": "short_text",
          "value": null
        },
        "salary": {
          "name": "Salary",
          "type": "short_text",
          "value": null
        }
      }
    }
  }
}
```

The Job Approved event is triggered when the final approval is received in a Greenhouse job's approval flow. "Approvals to start recruiting" will be identified as "approval_flow_type": "open_job" while "Official job approval" will be identified as "approval_flow_type": "offer_job".

## Job Post created

This webhook fires when a job post or prospect post is created. This occurs when a new job post or prospect post is added from the job set up.

If `job_id` **is** present in the payload, the payload represents a new **job post**.

If `job_id` **is not** present, the payload represents a new **prospect post**.


```json
{
  "action": "job_post_created",
  "payload": {
    "id": 1815002,
    "title": "A Cool Job",
    "location": "New York, NY",
    "content": "<p>Hey, this is a neat job. You should apply!</p>",
    "internal_content": null,
    "updated_at": "2017-10-12T15:06:32.691Z",
    "job_id": 1842002,
    "external": true,
    "internal": false,
    "live": false,
    "questions": [
      {
        "required": false,
        "private": false,
        "label": "LinkedIn Profile",
        "type": "input_text",
        "values": []
      },
      {
        "required": false,
        "private": false,
        "label": "Website",
        "type": "input_text",
        "values": []
      },
      {
        "required": false,
        "private": false,
        "label": "How did you hear about this job?",
        "type": "input_text",
        "values": []
      }
    ]
  }
}
```

## Job Post updated

This webhook fires when a job post or prospect post is updated via the "Edit Job Post" page. It also fires when the live status of the job changes from on to off or vice-versa.

If `job_id` **is** present in the payload, the payload represents an updated **job post**.

If `job_id` **is not** present, the payload represents an updated **prospect post**.

```json
{
  "action": "job_post_updated",
  "payload": {
    "id": 1813002,
    "title": "A Cool Job",
    "location": "At a Cool Place",
    "content": "<p>Come work for us!</p>",
    "internal_content": null,
    "updated_at": "2017-10-12T18:29:08.399Z",
    "job_id": 1842002,
    "external": true,
    "internal": false,
    "live": false,
    "questions": [
      {
        "required": false,
        "private": false,
        "label": "LinkedIn Profile",
        "type": "input_text",
        "values": []
      },
      {
        "required": false,
        "private": false,
        "label": "Website",
        "type": "input_text",
        "values": []
      },
      {
        "required": false,
        "private": false,
        "label": "How did you hear about this job?",
        "type": "input_text",
        "values": []
      }
    ]
  }
}
```

## Job Post deleted

This webhook fires when a job post or prospect post is deleted.  This occurs when the delete link is clicked on a post. Only posts that are not live may be deleted. This will not fire if a job itself is deleted; a job being deleted implies all of its posts have been deleted with them.

If `job_id` **is** present in the payload, the payload represents a deleted **job post**.

If `job_id` **is not** present, the payload represents a deleted **prospect post**.

```json
{
  "action": "job_post_deleted",
  "payload": {
    "job_post": {
      "id": 258341,
      "job_id": 284999,
      "title": "Software Engineer",
      "location": "Dallas",
      "content": "<p>A pretty interesting job post!</p>",
      "updated_at": "2017-01-19T20:01:53.146Z",
      "internal_content": null,
      "questions": [
        {
          "required": false,
          "private": false,
          "label": "LinkedIn Profile",
          "type": "input_text",
          "values": []
        },
        {
          "required": false,
          "private": false,
          "label": "Website",
          "type": "input_text",
          "values": []
        },
        {
          "required": false,
          "private": false,
          "label": "How did you hear about this job?",
          "type": "input_text",
          "values": []
        },
        {
          "required": true,
          "private": true,
          "label": "Are you a cool engineer?",
          "type": "multi_value_single_select",
          "values": [
            "Yes",
            "No",
            "As a cucumber"
          ]
        }
      ],
      "external": true,
      "internal": false,
      "live": false
    }
  }
}
```
## Job Stage deleted

This webhook only fires when interview stages on a job are removed.  This occurs when the remove stage link is used in the Job Setup section of the application. This will not fire when a job is deleted. A job being deleted implies all of its stages have been deleted with them.

```json
{
  "action": "job_interview_stage_deleted",
  "payload": {
    "job_interview_stage": {
      "id": 430608,
      "job_id": 60453,
      "created_at": "2015-03-11T13:25:25.313Z",
      "updated_at": "2016-08-16T09:29:33.650Z",
      "name": "Phone Screen",
      "active": true
    }
  }
}
```
