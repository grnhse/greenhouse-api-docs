# Candidate Events

## Candidate deleted

This webhook will fire when a candidate or prospect is deleted from Greenhouse.  This occurs when the Harvest delete candidate methods are used, when a candidate is merged into another candidate, when a candidate is deleted in the application, and once for each candidate in a bulk delete operation.  Deleting a candidate will cause other deletes within Greenhouse but we will not fire an individual webhook for those deletions.  In the case of the applications that this delete causes, we will include an array of those Application IDs that will be removed from Greenhouse.

```json
{
  "action": "delete_candidate",
  "payload": {
    "person": {
        "id": 37031511,
        "first_name": "Jack",
        "last_name": "Sparrow",
        "company": "Pirate Shipping",
        "title": "Captain",
        "created_at": "2013-03-22T00:00:00Z",
        "headline": "Eager to find a new commission",
        "is_private": false,
        "recruiter_user_id": 123,
        "coordinator_user_id": 456,
        "can_email": false,
        "deleted_application_ids": [
                46196263,
                46196258
            ]
        }
    }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `is_private` | True or false; if this candidate has been marked private in Greenhouse. |
| `recruiter_user_id` | The Greenhouse user_id of this candidate's recruiter |
| `coordinator_user_id` | The Greenhouse user_id of this candidate's coordinator |
| `can_email` | True or false; if this candidate can be e-mailed. |
| `application_ids` | This is an array containing the Greenhouse application IDs that will be deleted as a consequence of this candidate being deleted |
| `deleted_application_ids` | In many merge cases, this section will be blank, as applications will have been merged into the new candidate. |

## Candidate hired

```json
{
  "action": "hire_candidate",
  "payload": {
    "application": {
      "id": 46194062,
      "opening": {
        "opening_id": "1234-56",
        "custom_fields": []
      },
      "credited_to": {
        "id": 158104,
        "email": "bob_johnson1@localhost.com",
        "name": "Robert Johnson",
        "employee_id": "123ABC"
      },
      "source": {
        "id": 25,
        "public_name": "Monster"
      },
      "url": "https://app.greenhouse.io/people/35897443?application_id=46194062",
      "candidate": {
        "id": 35897443,
        "first_name": "Johnny",
        "last_name": "Smith",
        "title": "Previous Title",
        "external_id": "12345",
        "url": "https://app.greenhouse.io/people/35897443",
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "518-555-1212",
            "type": "work"
          },
          {
            "value": "212-555-1212",
            "type": "home"
          }
        ],
        "email_addresses": [
          {
            "value": "personal@example.com",
            "type": "personal"
          },
          {
            "value": "work@example.com",
            "type": "work"
          }
        ],
        "addresses": [
          {
            "value": "455 Broadway New York, NY 10280",
            "type": "home"
          }
        ],
        "educations": [
          {
            "school_name": "Harvard University",
            "degree": "Bachelor's Degree",
            "discipline": "Information Systems",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "employments": [
          {
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "recruiter": {
          "id": 55,
          "email": "bob_johnson@localhost.com",
          "name": "Bob Johnson",
          "employee_id": "456DEF"
        },
        "coordinator": {
          "id": 56,
          "email": "bob_johnson_approver1@localhost.com",
          "name": "Robert J Approver",
          "employee_id": "789GHI"
        },
        "attachments": [
          {
            "filename": "resume.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "resume"
          }
        ],
        "custom_fields": {
          "desired_level": {
            "name": "Desired Level",
            "type": "short_text",
            "value": "Senior"
          },
          "favorite_programming_language": {
            "name": "Favorite Programming Language",
            "type": "short_text",
            "value": "Rails"
          }
        }
      },
      "job": {
        "id": 323753,
        "name": "Developer",
        "open_date": "2014-11-20T22:49:14Z",
        "close_date": "2014-11-25T22:49:14Z",
        "requisition_id": null,
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
      },
      "jobs": [
        {
          "id": 323753,
          "name": "Developer",
          "requisition_id": null,
          "confidential": false,
          "opened_at": "2014-11-20T22:49:14Z",
          "closed_at": "2014-11-25T22:49:14Z",
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
      ],
      "custom_fields": {
        "custom_application_field": {
          "name": "Custom Application Field",
          "type": "short_text",
          "value": "Example123"
        }
      },
      "offer": {
        "id": 506409,
        "version": 2,
        "created_at": "2014-11-20T22:49:14Z",
        "sent_at": "2014-11-10",
        "resolved_at": "2014-11-20T22:49:14Z",
        "starts_at": "2015-01-23",
        "custom_fields": {
          "salary": {
            "name": "Salary",
            "type": "currency",
            "value": {
              "amount": 80000,
              "unit": "USD"
            }
          },
          "seasons": {
            "name": "Seasons",
            "type": "multi_select",
            "value": [
              "Season 1",
              "Season 2"
            ]
          }
        }
      }
    }
  }
}
```

The Hire Candidate event occurs when an offer is accepted. This is triggered by clicking the "Accept Offer" button on the candidate's Private tab.

### Noteworthy attributes

See webhook [common attributes](#common-attributes).

| Attribute | Note |
|-----------|------|
| `application.offer.id` | Unique Greenhouse identifier of the offer. Information not included in the webhook can be retrieved via [Harvest API - GET Offers](/harvest.html#offers)
| `application.offer.created_at` | Date when this offer was drafted.
| `application.offer.sent_on` | Date when this offer was sent to the candidate.
| `application.offer.resolved_at` | Date the offer was accepted.
| `application.offer.starts_at` | The candidate's start date. Expected format is YYYY-MM-DD
| `application.job` | Deprecated. Use `application.jobs[]` instead
| `application.job.close_date` | Deprecated. Use `application.jobs[].closed_at` instead.
| `application.job.open_date` | Deprecated. Use `application.jobs[].opened_at` instead.
| `application.opening.custom_fields` | This element may be omitted if the organization does not have custom fields for openings enabled.

## Candidate merged

This webhook will fire when a candidate or prospect is merged with another candidate.  This process should fire for regular manual merges and auto-merges.  It will also fire per candidate for a bulk merge.  This webhook supersedes the candidate deleted webhook.  If both candidate deleted and candidate merged are configured on your site, only the candidate merged webhook will fire when candidate records are removed via merge.  If a candidate deleted webhook is configured but candidate merged is not, then the candidate deleted webhook will fire when a candidate record is deleted via merge.  The payload for a candidate merged webhook matches the payload for candidate deleted except it contains the ID of the winning candidate record.

```json
{
  "action": "merge_candidate",
  "payload": {
    "person": {
        "id": 37031511,
        "first_name": "Jack",
        "last_name": "Sparrow",
        "company": "Pirate Shipping",
        "title": "Captain",
        "created_at": "2013-03-22T00:00:00Z",
        "headline": "Eager to find a new commission",
        "is_private": false,
        "recruiter_user_id": 123,
        "coordinator_user_id": 456,
        "can_email": false,
        "new_candidate_id": 457456
    }
  }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `new_candidate_id` | The ID of the candidate to whom this candidate has been merged |

## Candidate stage change

```json
{
  "action": "candidate_stage_change",
  "payload": {
    "application": {
      "id": 265277,
      "rejected_at": null,
      "prospect": false,
      "status": "active",
      "applied_at": "2013-03-22T00:00:00Z",
      "last_activity_at": "2015-02-09T16:38:36Z",
      "url": "https://app.greenhouse.io/people/265772?application_id= 265277",
      "source": {
        "id": 31,
        "name": "Agency"
      },
      "credited_to": {
        "id": 15,
        "email": "ada@example.com",
        "name": "Ada Lacey",
        "employee_id": "123ABC"
      },
      "rejection_reason": null,
      "rejection_details": null,
      "current_stage": {
        "id": 71416,
        "name": "Assessment",
        "interviews": [
          {
            "id": 113101,
            "name": "Assessment",
            "status": "to_be_scheduled",
            "interview_kit": {
              "url": "https://app.greenhouse.io/guides/113153/people/265772",
              "content": "Assess their skills",
              "questions": []
            },
            "interviewers": [
              {
                "id": 2622,
                "display_name": "Carl Buddha",
                "status": "tentative"
              }
            ]
          }
        ]
      },
      "custom_fields": {
        "custom_application_field": {
          "name": "Custom Application Field",
          "type": "short_text",
          "value": "Example"
        }
      },
      "candidate": {
        "id": 265772,
        "first_name": "Giuseppe",
        "last_name": "Hurley",
        "title": "Great Person",
        "company": null,
        "created_at": "2013-10-04T01:24:44Z",
        "external_id": "241b399ce4b0fd1c84e5528d",
        "photo_url": null,
        "url": "https://app.greenhouse.io/people/265772",
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "330-281-8004",
            "type": "home"
          }
        ],
        "email_addresses": [
          {
            "value": "giuseppe.hurley@example.com",
            "type": "personal"
          }
        ],
        "addresses": [
          {
            "value": "123 Fake St.",
            "type": "home"
          }
        ],
        "website_addresses": [
          {
            "value": "ghurley.example.com",
            "type": "personal"
          }
        ],
        "social_media_addresses": [
          {
            "value": "linkedin.example.com/ghurley"
          }
        ],
        "educations": [
          {
            "school_name": "Harvard University",
            "degree": "Bachelor's Degree",
            "discipline": "Information Systems",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "employments": [
          {
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "recruiter": {
          "id": 3128,
          "email": "alicia.flopple.3128@example.com",
          "name": "Alicia Flopple",
          "employee_id": "789GHI"
        },
        "coordinator": {
          "id": 3128,
          "email": "alicia.flopple.3128@example.com",
          "name": "Alicia Flopple",
          "employee_id": "789GHI"
        },
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
        "tags": [
          "Import from Previous ATS"
        ],
        "custom_fields": {
          "favorite_color": {
            "name": "Favorite Color",
            "type": "short_text",
            "value": "Blue"
          }
        }
      },
      "jobs": [
        {
          "id": 3485,
          "name": "Designer",
          "requisition_id": null,
          "notes": "Digital and print",
          "confidential": false,
          "job_post_id": 553282,
          "status": "open",
          "created_at": "2013-10-02T22:59:29Z",
          "opened_at": "2015-01-23T00:25:04Z",
          "closed_at": null,
          "departments": [
            {
              "id": 237,
              "name": "Community",
              "external_id": "ex-dept-1"
            }
          ],
          "offices": [
            {
              "id": 54,
              "name": "New York",
              "location": "New York, NY",
              "external_id": "ex-office-1"
            }
          ],
          "custom_fields": {
            "employment_type": {
              "name": "Employment Type",
              "type": "single_select",
              "value": "Full Time"
            }
          }
        }
      ]
    }
  }
}
```

### Noteworthy response attributes

See webhook [common attributes](#common-attributes).

| Attribute | Note |
|-----------|------|
| `application.current_stage.interviews[].interviewers.status` | One of: `needs_action`, `declined`, `tentative`, `accepted`
| `application.current_stage.interviews[].status` | One of: `to_be_scheduled`, `scheduled`, `awaiting_feedback`, `complete`, `skipped`, `collect_feedback`, `to_be_sent`, `sent`, `received`

## Candidate unhired

```json
{
  "action": "unhire_candidate",
  "payload": {
    "application": {
      "id": 265293,
      "rejected_at": null,
      "prospect": false,
      "status": "active",
      "applied_at": "2013-03-22T00:00:00Z",
      "last_activity_at": "2015-03-18T20:28:09Z",
      "url": "https://app.greenhouse.io/people/265788?application_id=265293",
      "source": {
        "id": 27,
        "public_name": "LinkedIn"
      },
      "credited_to": null,
      "rejection_reason": null,
      "rejection_details": null,
      "current_stage": {
        "id": 678901,
        "name": "Application Review",
        "interviews": [
          {
            "id": 989099,
            "name":"Application Review",
            "status": "collect_feedback",
            "interview_kit": {
              "url": "http://app.greenhouse.io/guides/67656/people/265788",
              "content": "",
              "questions": []
            },
            "interviewers": []
          }
        ]
      },
      "custom_fields": {
        "custom_application_field": {
          "name": "Custom Application Field",
          "type": "short_text",
          "value": null
        }
      },
      "candidate": {
        "id": 265788,
        "first_name": "Hector",
        "last_name": "Porter",
        "title": null,
        "company": null,
        "created_at": "2013-10-04T01:24:48Z",
        "external_id": null,
        "photo_url": null,
        "url": "https://app.greenhouse.io/people/265788",
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "330-281-8004",
            "type": "home"
          }
        ],
        "email_addresses": [
          {
            "value": "hector.porter.265788@example.com",
            "type": "personal"
          }
        ],
        "addresses": [],
        "website_addresses": [],
        "social_media_addresses": [],
        "educations": [
          {
            "school_name": "Harvard University",
            "degree": "Bachelor's Degree",
            "discipline": "Information Systems",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "employments": [
          {
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "recruiter": null,
        "coordinator": null,
        "attachments": [
          {
            "filename": "resume.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "resume"
          }
        ],
        "tags": [
          "Import from Previous ATS"
        ],
        "custom_fields": {
          "favorite_color": {
            "name": "Favorite Color",
            "type": "short_text",
            "value": "Blue"
          }
        }
      },
      "jobs": [
        {
          "id": 371417,
          "name": "Designer",
          "requisition_id": null,
          "notes": "Digital and print",
          "confidential": false,
          "job_post_id": 54321,
          "status": "open",
          "created_at": "2013-10-02T22:59:29Z",
          "opened_at": "2015-01-23T00:25:04Z",
          "closed_at": null,
          "departments": [
            {
              "id": 14501,
              "name": "Community",
              "external_id": "ex-dept-1"
            }
          ],
          "offices": [
            {
              "id": 9099,
              "name": "New York",
              "location": "New York, NY",
              "external_id": "ex-office-1"
            }
          ],
          "custom_fields": {
            "employment_type": {
              "name": "Employment Type",
              "type": "single_select",
              "value": "Full Time"
            }
          }
        }
      ]
    }
  }
}
```

This webhook only fires when the "Unhire" button is clicked in Greenhouse.  This button is only available on the candidate profile page after a candidate has been hired.

See webhook [common attributes](#common-attributes).

## Candidate/Prospect rejected

```json
{
  "action": "reject_candidate",
  "payload": {
    "application": {
      "id": 265293,
      "rejected_at": "2015-02-11T15:50:41Z",
      "prospect": false,
      "status": "rejected",
      "applied_at": "2013-03-22T00:00:00Z",
      "last_activity_at": "2015-02-11T15:50:41Z",
      "url": "https://app.greenhouse.io/people/265788?application_id=265293",
      "source": {
        "id": 27,
        "public_name": "LinkedIn"
      },
      "credited_to": null,
      "rejection_reason": {
        "id": 14,
        "name": "Too Junior",
        "type": {
          "id": 3,
          "name": "Wrong skill set"
        }
      },
      "rejection_details": {
        "custom_fields": {
          "custom_rejection_question_field": {
            "name": "Custom Rejection Question Field",
            "type": "short_text",
            "value": "Example"
          }
        }
      },
      "current_stage": {
        "id": 2708728,
        "name": "Offer",
        "interviews": []
      },
      "custom_fields": {
        "custom_application_field": {
          "name": "Custom Application Field",
          "type": "short_text",
          "value": "Example123"
        }
      },
      "candidate": {
        "id": 265788,
        "first_name": "Hector",
        "last_name": "Porter",
        "title": null,
        "company": null,
        "created_at": "2013-10-04T01:24:48Z",
        "external_id": null,
        "photo_url": null,
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "330-281-8004",
            "type": "home"
          }
        ],
        "email_addresses": [
          {
            "value": "hector.porter.265788@example.com",
            "type": "personal"
          }
        ],
        "addresses": [],
        "website_addresses": [],
        "social_media_addresses": [],
        "educations": [
          {
            "school_name": "Harvard University",
            "degree": "Bachelor's Degree",
            "discipline": "Information Systems",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "employments": [
          {
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "recruiter": null,
        "coordinator": null,
        "attachments": [
          {
            "filename": "resume.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "resume"
          }
        ],
        "tags": [
          "Imported"
        ],
        "custom_fields": {
          "favorite_color": {
            "name": "Favorite Color",
            "type": "short_text",
            "value": "Blue"
          }
        }
      },
      "jobs": [
        {
          "id": 371417,
          "name": "Designer",
          "requisition_id": null,
          "notes": "Digital and print",
          "confidential": false,
          "job_post_id": 54321,
          "status": "open",
          "created_at": "2013-10-02T22:59:29Z",
          "opened_at": "2015-01-23T00:25:04Z",
          "closed_at": null,
          "departments": [
            {
              "id": 237,
              "name": "Community",
              "external_id": "ex-dept-1"
            }
          ],
          "offices": [
            {
              "id": 9099,
              "name": "New York",
              "location": "New York, NY",
              "external_id": "ex-office-1"
            }
          ],
          "custom_fields": {
            "employment_type": {
              "name": "Employment Type",
              "type": "single_select",
              "value": "Full Time"
            }
          }
        }
      ]
    }
  }
}
```

The Reject Candidate event occurs when a prospect or candidate is rejected for a position. When candidates are rejected via a bulk action, a webhook will fire once for each candidate or prospect rejected.

See webhook [common attributes](#common-attributes).

## Candidate/Prospect unrejected

```json
{
  "action": "unreject_candidate",
  "payload": {
    "application": {
      "id": 265293,
      "rejected_at": null,
      "prospect": false,
      "status": "active",
      "applied_at": "2013-03-22T00:00:00Z",
      "last_activity_at": "2015-02-11T15:50:41Z",
      "url": "https://app.greenhouse.io/people/265788?application_id=265293",
      "source": {
        "id": 27,
        "public_name": "LinkedIn"
      },
      "credited_to": null,
      "rejection_reason": null,
      "rejection_details": null,
      "current_stage": {
        "id": 2708728,
        "name": "Offer",
        "interviews": []
      },
      "custom_fields": {
        "custom_application_field": {
          "name": "Custom Application Field",
          "type": "short_text",
          "value": "Example123"
        }
      },
      "candidate": {
        "id": 265788,
        "first_name": "Hector",
        "last_name": "Porter",
        "title": null,
        "company": null,
        "created_at": "2013-10-04T01:24:48Z",
        "external_id": null,
        "photo_url": null,
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "330-281-8004",
            "type": "home"
          }
        ],
        "email_addresses": [
          {
            "value": "hector.porter.265788@example.com",
            "type": "personal"
          }
        ],
        "addresses": [],
        "website_addresses": [],
        "social_media_addresses": [],
        "educations": [
          {
            "school_name": "Harvard University",
            "degree": "Bachelor's Degree",
            "discipline": "Information Systems",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "employments": [
          {
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "01/01/2012",
            "end_date": "01/01/2016"
          }
        ],
        "recruiter": null,
        "coordinator": null,
        "attachments": [
          {
            "filename": "resume.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "resume"
          }
        ],
        "tags": [
          "Imported"
        ],
        "custom_fields": {
          "favorite_color": {
            "name": "Favorite Color",
            "type": "short_text",
            "value": "Blue"
          }
        }
      },
      "jobs": [
        {
          "id": 371417,
          "name": "Designer",
          "requisition_id": null,
          "notes": "Digital and print",
          "confidential": false,
          "job_post_id": 54321,
          "status": "open",
          "created_at": "2013-10-02T22:59:29Z",
          "opened_at": "2015-01-23T00:25:04Z",
          "closed_at": null,
          "departments": [
            {
              "id": 237,
              "name": "Community",
              "external_id": "ex-dept-1"
            }
          ],
          "offices": [
            {
              "id": 9099,
              "name": "New York",
              "location": "New York, NY",
              "external_id": "ex-office-1"
            }
          ],
          "custom_fields": {
            "employment_type": {
              "name": "Employment Type",
              "type": "single_select",
              "value": "Full Time"
            }
          }
        }
      ]
    }
  }
}
```

The Unreject Candidate event occurs when a prospect or candidate is unrejected.

See webhook [common attributes](#common-attributes).

## Candidate/Prospect updated

```json
{
  "action": "update_candidate",
  "payload": {
    "candidate": {
      "id": 15696179,
      "first_name": "Ronald",
      "last_name": "Ronnie",
      "title": "Director of Strategic Initiatives",
      "company": "Example",
      "created_at": "2016-08-23T17:51:27Z",
      "external_id": "946aa514658",
      "photo_url": null,
      "url": "https://app.greenhouse.io/people/15696179",
      "phone_numbers": [
        {
          "value": "911",
          "type": "mobile"
        }
      ],
      "email_addresses": [
        {
          "value": "123456email@email.com",
          "type": "work"
        }
      ],
      "addresses": [
        {
          "value": "99-99 5th Ave.\nNew York, NY 101-11",
          "type": "home"
        }
      ],
      "website_addresses": [
        {
          "value": "google.com",
          "type": "personal"
        }
      ],
      "social_media_addresses": [
        {
          "value": "@ronaldronnie99999"
        }
      ],
      "educations": [
        {
          "school_name": "Harvard University",
          "degree": "Bachelor's Degree",
          "discipline": "Information Systems",
          "start_date": "01/01/2012",
          "end_date": "01/01/2016"
        }
      ],
      "employments": [
        {
          "company_name": "Greenhouse",
          "title": "Engineer",
          "start_date": "01/01/2012",
          "end_date": "01/01/2016"
        }
      ],
      "recruiter": {
        "id": 169779,
        "email": "hank.hollandaise.169779@example.com",
        "name": "Hank Hollandaise",
        "employee_id": "123ABC"
      },
      "coordinator": {
        "id": 83637,
        "email": "sterling.kang.83637@example.com",
        "name": "Sterling Kang",
        "employee_id": "456DEF"
      },
      "attachments": [
        {
          "filename": "resumeA.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "resume"
        },
        {
          "filename": "resumeB.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "resume"
        }
      ],
      "tags": [
        "foo",
        "File Import"
      ],
      "custom_fields": {
        "current_salary": {
          "name": "Current Salary",
          "type": "short_text",
          "value": null
        },
        "desired_salary": {
          "name": "Desired Salary",
          "type": "short_text",
          "value": null
        }
      }
    }
  }
}
```

The Candidate or Prospect Updated event occurs when a candidate or prospect's standard field or custom field is updated.  For instance, an update to a candidate's first name would trigger this event.

See webhook [common attributes](#common-attributes).

## Candidate anonymized

This webhook will fire when a particular candidate receives an anonymize event. Anonymize events may occur from the [Anonymize Endpoint](#put-anonymize-candidate) in Harvest or may be configured in the GDPR page in the Greenhouse application. An anonymize webhook consists of the action type, the id of the candidate who had properties anonymized, and the information that was anonymized.

```json
{
  "action": "candidate_anonymized",
  "payload": {
    "candidate_id": 37031511,
    "anonymized_fields": ["full_name", "current_title"]
  }
}
```

### Anonymized Fields

A list of possible anonymized fields are provided. If the item in "attribute" is received in the anonymized_fields array, the corresponding changes in notes have been applied in Greenhouse. Note that some of these fields may not be accessible via other webhooks or via Harvest.

| Attribute | Anonymize Process |
|------------|--------|
| `activity_items` | Destroy all items in the candidate's activity feed of type "activity". In Harvest's Activity Feed endpoint, these are items in the `activities` section. |
| `addresses` | Destroy all values from `candidate.addresses` |
| `all_offer_versions` | For each of this candidate's applications, destroy all offers. (For legacy reasons, this will also raise an [Offer Deleted](#offer-deleted) webhook if one is configured.) |
| `application_questions` | For each of this candidate's applications, destroy all values from `application.answers`. |
| `attachments` | Destroy all attachments on this candidate and all their associated applications. |
| `candidate_stage_data` | For each of this candidate's applications, set the `created_at` time to now, remove the candidate from the current stage, destroy all stage transition information, and set the candidate back to the first stage. |
| `coordinator` | Set `candidate.coordinator` to null |
| `credited_to` | For each of this candidate's application, destroy `application.credited_to`. |
| `custom_application_fields` | For each of this candidate's applications, destroy `application.custom_fields`. |
| `custom_candidate_fields` | Destroy all values from `candidate.custom_fields` |
| `custom_rejection_question_fields` | For each of this candidate's application, destroy all custom fields on rejection details. |
| `current_company` | Set `candidate.company` to null. |
| `current_title` | Set `candidate.title` to null. |
| `education` | Remove all values from `candidate.educations` |
| `email_addresses` | Destroy all values from `candidate.email_addresses` |
| `employment` | Remove all values from `candidate.employments` |
| `emails` | Destroy record of any e-mails sent to this candidate via Greenhouse. |
| `follow_up_reminders` | Destroy any follow-up reminders configured on this person. |
| `full_name` | Set `candidate.first_name` to "Anonymized" and `candidate.last_name` to the `candidate.id`. |
| `headline` | Set the candidate's headline to null. |
| `inmails` | Destroy record of any LinkedIn Inmails synced to this candidate from LinkedIn. |
| `innotes` | Destroy record of any LinkedIn Innotes synced to this candidate from LinkedIn. |
| `location` | For each of this candidate's applications, set `application.location` to null. |
| `notes` | Destroy all notes on this candidate. |
| `offers` | Destroy all information on all offers on any of this candidate's applications without destroying that an offer was made. |
| `phone_numbers` | Remove all values from `candidate.phone_numbers` |
| `prospect_jobs` | Remove all associations between this prospect and jobs. |
| `prospect_offices` | Remove all associations between this prospect and offices. |
| `prospect_offices_and_departments` | Remove all associations between this prospect and departments. |
| `prospect_owner` | For each of this candidate's prospect applications, destroy the prospect owner. |
| `prospect_pool_and_stage` | For each of this candidate's application, destroy the prospect pool and the prospect pool stage. |
| `recruiter` | Set `candidate.recruiter` to null |
| `referral_questions` | Destroy all referral answers for this candidate. |
| `rejection_notes` | Destroy all notes specifically related to this candidate's rejection. |
| `rejection_reasons` | Set `rejection_reason` on all candidate applications to null. |
| `scorecards_and_interviews` | Destroy all scorecards with this candidate id and all interviews with any application from this candidate id |
| `social_media_links` | Remove all values from `candidate.social_media_addresses` |
| `source` | Remove `application.source` in all this candidate's applications. |
| `tags` | Remove all values from `candidate.tags` |
| `third_party_integrations` | Disconnect the candidate's profile from the LinkedIn CSA and RSC integrations. |
| `touchpoints` | Destroy all touchpoints on the candidate, all the candidate's applications, and any notes associated with touchpoints. |
| `websites` | Remove all values from `candidate.website_addresses` |
