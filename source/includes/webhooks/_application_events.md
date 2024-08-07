# Application Events

## Application created

```json
{
  "action": "new_candidate_application",
  "payload": {
    "application": {
      "id": 71980812,
      "rejected_at": null,
      "prospect": false,
      "status": "active",
      "applied_at": "2017-10-27T14:44:43Z",
      "last_activity_at": "2017-10-27T14:44:42Z",
      "url": "http://app.greenhouse.io/people/60304594?application_id=71980812",
      "source": {
        "id": 16,
        "name": "LinkedIn (Prospecting)"
      },
      "credited_to": {
        "id": 92120,
        "email": "test123@example.com",
        "name": "Greenhouse Admin",
        "employee_id": "123ABC"
      },
      "rejection_reason": null,
      "rejection_details": null,
      "current_stage": {
        "id": 2944102,
        "name": "Preliminary Phone Screen",
        "interviews": [
          {
            "id": 4368004,
            "name": "Preliminary Screening Call",
            "status": "to_be_scheduled",
            "interview_kit": {
              "url": "http://app.greenhouse.io/guides/4368142/people/60304594?application_id=71980812",
              "content": "<p>Directions on how to conduct this interview.</p>",
              "questions": [
                {
                  "id": 3136352,
                  "question": "Could you tell me about your previous experience?"
                },
                {
                  "id": 3136353,
                  "question": "Why do you want to work with us?"
                }
              ]
            },
            "interviewers": []
          }
        ]
      },
      "prospect_detail": {
        "prospect_pool": null,
        "prospect_stage": null,
        "prospect_owner": null
      },
      "custom_fields": {
        "application_custom_test": {
          "name": "Application Custom Test",
          "type": "single_select",
          "value": null
        },
        "custom_boolean_test": {
          "name": "Custom Boolean Test",
          "type": "boolean",
          "value": null
        }
      },
      "candidate": {
        "id": 60304594,
        "first_name": "Jane",
        "last_name": "Smith",
        "title": "Manager",
        "company": "Current Company Co.",
        "created_at": "2017-10-27T14:44:42Z",
        "external_id": null,
        "photo_url": null,
        "url": "http://app.greenhouse.io/people/60304594",
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "555-555-5555",
            "type": "mobile"
          }
        ],
        "email_addresses": [
          {
            "value": "person@work.com",
            "type": "work"
          },
          {
            "value": "person@example.com",
            "type": "personal"
          }
        ],
        "addresses": [
          {
            "value": "123 Test Street\nNew York, NY 10001",
            "type": "home"
          }
        ],
        "website_addresses": [
          {
            "value": "mysite.com",
            "type": "personal"
          }
        ],
        "social_media_addresses": [
          {
            "value": "socialmedia.com"
          }
        ],
        "educations": [
          {
            "school_name": "Stanford University",
            "degree": "Bachelor's Degree",
            "discipline": "Computer Science",
            "start_date": "09/15/2007",
            "end_date": "05/15/2011"
          }
        ],
        "employments": [],
        "recruiter": {
          "id": 92121,
          "email": "employee@test.com",
          "name": "Betty Smith",
          "employee_id": "123ABC"
        },
        "coordinator": {
          "id": 92427,
          "email": "user@example.com",
          "name": "Bonnie Bonnet",
          "employee_id": "456DEF"
        },
        "attachments": [
          {
            "filename": "Test Cover Letter.docx",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "cover_letter"
          },
          {
            "filename": "Test Resume.docx",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "resume"
          }
        ],
        "tags": [
          "Ruby",
          "Comp Sci"
        ],
        "custom_fields": {
          "date_test": {
            "name": "Date Test",
            "type": "date",
            "value": ""
          },
          "desired_salary": {
            "name": "Desired Salary",
            "type": "short_text",
            "value": null
          },
          "graduation_year_1": {
            "name": "Graduation Year",
            "type": "single_select",
            "value": null
          },
          "work_remotely": {
            "name": "Work Remotely",
            "type": "boolean",
            "value": null
          }
        }
      },
      "jobs": [
        {
          "id": 274075,
          "name": "Data Scientist",
          "requisition_id": "ABC",
          "notes": null,
          "confidential": false,
          "job_post_id": 263533,
          "status": "open",
          "created_at": "2016-07-14T17:21:30Z",
          "opened_at": "2016-07-20T16:00:00Z",
          "closed_at": null,
          "url": "http://app.greenhouse.io/sdash/274075",
          "departments": [
            {
              "id": 8717,
              "name": "Data Science",
              "external_id": "ex-dept-1"
            }
          ],
          "offices": [
            {
              "id": 16478,
              "name": "London",
              "location": "London, United Kingdom",
              "external_id": "ex-office-1"
            }
          ],
          "hiring_team": {
            "hiring_managers": [
              {
                "user_id": 92913,
                "employee_id": "123ABC"
              }
            ],
            "sourcers": [
              {
                  "user_id": 92427,
                "employee_id": null
              }
            ],
            "recruiters":  [
              {
                  "user_id": 92427,
                "employee_id": null
              }
            ],
            "coordinators": [
              {
                "user_id": 92427,
                "employee_id": "DEFG123"
              }
            ]
          },
          "custom_fields": {
            "date_test": {
              "name": "Date Test",
              "type": "date",
              "value": "2017-10-27"
            },
            "employment_type": {
              "name": "Employment",
              "type": "single_select",
              "value": "Full-time"
            },
            "replacement_role_": {
              "name": "Replacement Role",
              "type": "boolean",
              "value": true
            },
            "salary_range_2": {
              "name": "Salary Range",
              "type": "currency_range",
              "value": {
                "unit": null,
                "min_value": "10000.0",
                "max_value": "10000.0"
              }
            },
            "test_field_1": {
              "name": "Test Short Text Field",
              "type": "short_text",
              "value": "test"
            },
            "test_user_field": {
              "name": "Test User Field",
              "type": "user",
              "value": {
                "user_id": 117730,
                "name": "Job Admin",
                "email": "asegal+jobadmin@greenhouse.io",
                "employee_id": "user-abc"
              }
            }
          }
        }
      ]
    }
  }
}
```

The New Candidate Application event occurs when a new application is created for a candidate.

See webhook [common attributes](#common-attributes).

## Application deleted

This webhook only fires when individual applications are destroyed.  This occurs when the Harvest API delete endpoint is used, when a candidate is removed from a specific job, or when two duplicate candidates on the same job are merged together.  This will not fire when a candidate is deleted.  A candidate being deleted implies all their applications have been deleted with them.

```json
{
  "action": "delete_application",
  "payload": {
    "application": {
        "id": 46194062,
        "candidate_id": 37031511,
        "job_id": 371417,
        "created_at": "2013-03-22T00:00:00Z",
        "source_id": 2,
        "candidate_rejection_reason_id": null,
        "rejection_note_id": 123,
        "rejected_at": "2014-04-22T01:00:00Z",
        "referrer_id": 158104,
        "prospect": false,
        "rejected_by_user_id": 158103
        }
    }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `rejected_by_user_id` | The Greenhouse user who rejected this application, if the application is rejected. |

## Application updated

```json
{
  "action": "application_updated",
  "payload": {
    "application": {
      "id": 22202940,
      "rejected_at": null,
      "prospect": false,
      "prospect_detail": {
        "prospect_owner": null,
        "prospect_pool": null,
        "prospect_stage": null
      },
      "status": "active",
      "applied_at": "2015-12-03T06:31:26Z",
      "last_activity_at": "2015-12-03T06:31:26Z",
      "url": "https://app.greenhouse.io/people/13857579?application_id=22202940",
      "source": {
        "id":2,
        "name": "Jobs page on your website"
      },
      "credited_to": {
        "id": 3695,
        "email": "beauregard.blacksmith.3695@example.com",
        "name": "Beauregard Blacksmith",
        "employee_id": "123ABC"
      },
      "rejection_reason": null,
      "rejection_details": null,
      "current_stage": {
        "id": 711020,
        "name": "Application Review",
        "interviews": [
          {
            "id": 1063685,
            "name": "Application Review",
            "status": "collect_feedback",
            "interview_kit": {
              "url": "http://app.greenhouse.io/guides/1063859/people/13857579",
              "content": "",
              "questions":[]
            },
            "interviewers": []
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
        "id": 13857579,
        "first_name": "Hank",
        "last_name": "Von Diablo",
        "title": null,
        "company": null,
        "created_at": "2015-12-03T06:31:26Z",
        "external_id": null,
        "photo_url": null,
        "url": "https://app.greenhouse.io/people/13857579",
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "330-281-8004",
            "type": "other "
          }
        ],
        "email_addresses": [
          {
            "value": "hank.von diablo.13857579@example.com",
            "type": "personal"
          }
        ],
        "addresses": [],
        "website_addresses": [
          {
            "value": "http://www.example.com/",
            "type": "other"
          }
        ],
        "social_media_addresses": [
          {
            "value": "https://twitter.com/TheRock"
          }
        ],
        "educations": [],
        "recruiter":null,
        "coordinator": null,
        "attachments":[],
        "tags":[],
        "custom_fields": {
          "current_salary": {
            "name": "Current Salary",
            "type": "short_text",
            "value": null
          },
          "desired_salary": {
            "name": "Desired Salary",
            "type": "short_text",
            "value":null
          }
        }
      },
      "jobs": []
    }
  }
}


```

The Application Updated event occurs when an application is updated.

See webhook [common attributes](#common-attributes).

## Offer created

This webhook fires when creating a new offer in Greenhouse. This may also fire when changing an offer if the change causes a new version to be created. When bulk creating offers, this will fire per offer created.

```json
{
    "action": "offer_created",
    "payload": {
        "id": 12345,
        "application_id": 234556,
        "job_id": 45678,
        "user_id": 67890,
        "version": 1,
        "sent_on": "2013-03-22",
        "resolved_at": "2013-03-25T00:00:00Z",
        "start_date": "04/15/2013",
        "notes": "Vacation scheduled 4/20 - 4/23",
        "offer_status": "Accepted",
        "custom_fields": {
            "custom_application_field": {
                "name": "Custom Application Field",
                "type": "short_text",
                "value": "Example"
            }
        }
    }
}
```

## Offer approved

This webhook fires when an offer requires approval and the approval is received.

```json
{
    "action": "offer_approved",
    "payload": {
        "id": 12345,
        "application_id": 234556,
        "job_id": 45678,
        "user_id": 67890,
        "version": 1,
        "sent_on": "2013-03-22",
        "resolved_at": "2013-03-25T00:00:00Z",
        "start_date": "04/15/2013",
        "notes": "Vacation scheduled 4/20 - 4/23",
        "offer_status": "Accepted",
        "custom_fields": {
            "custom_application_field": {
                "name": "Custom Application Field",
                "type": "short_text",
                "value": "Example"
            }
        }
    }
}
```

## Offer updated

This webhook fires when an offer is updated. In some cases, an offer may be changed without generating a new version. In that case, this will fire by itself. If a change causes a new offer version to be generated, this will fire on the old version with the update to deprecate this offer and also a new "create" webhook will fire for the new version. This webhook should also fire when a person is hired,  which marks the offer as "accepted."

```json
{
    "action": "offer_updated",
    "payload": {
        "id": 12345,
        "application_id": 234556,
        "job_id": 45678,
        "user_id": 67890,
        "version": 2,
        "sent_on": "2013-03-22",
        "resolved_at": "2013-03-25T00:00:00Z",
        "start_date": "04/15/2013",
        "notes": "Vacation scheduled 4/20 - 4/23",
        "offer_status": "Deprecated",
        "custom_fields": {
            "custom_application_field": {
                "name": "Custom Application Field",
                "type": "short_text",
                "value": "Example"
            }
        }
    }
}
```

## Offer deleted

This webhook only fires when offers are deleted from the Greenhouse system.  This only happens when the "Delete" link is clicked on an individual offer or when the anonymize candidate process is run with the "all_offer_versions" option selected.  This will not fire individually when an application is deleted.

```json
{
  "action": "offer_deleted",
  "payload": {
    "offer": {
      "id": 506406,
      "application_id": 46194062,
      "offering_user_id": 158104,
      "offer_status": "Created",
      "version": 1,
      "sent_on": "2013-03-22",
      "resolved_at": "2013-03-25T00:00:00Z",
      "notes": "These are notes on the offer.",
      "job_id": 371417
  }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `offer_status` | One of Created, Accepted, Rejected, or Deprecated. |
| `version` | This is the version of the offer in Greenhouse.  New versions are triggered when certain fields are updated. |
| `sent_on` | When the offer was sent to the candidate |
| `resolved_at` | When this version was either accepted, rejected, or deprecated (a new version was made) |


## Prospect created

```json
{
  "action": "new_prospect_application",
  "payload": {
    "application": {
      "id": 979554,
      "rejected_at": null,
      "prospect": true,
      "status": "active",
      "applied_at": "2014-12-02T23:10:16Z",
      "last_activity_at": "2014-12-02T23:10:16Z",
      "url": "https://app.greenhouse.io/people/968190?application_id=979554",
      "source": {
        "id": 13,
        "public_name": "Referral"
      },
      "credited_to": {
        "id": 2622,
        "email": "carl.buddha.2622@example.com",
        "name": "Carl Buddha",
        "employee_id": "123ABC"
      },
      "rejection_reason": null,
      "rejection_details": null,
      "current_stage": null,
      "custom_fields": {
        "custom_application_field": {
          "name": "Custom Application Field",
          "type": "short_text",
          "value": null
        }
      },
      "candidate": {
        "id": 968190,
        "first_name": "Trisha",
        "last_name": "Troy",
        "title": null,
        "company": null,
        "created_at": "2014-12-02T23:10:16Z",
        "external_id": null,
        "photo_url": null,
        "is_private": false,
        "can_email": true,
        "phone_numbers": [
          {
            "value": "123456",
            "type": "other"
          }
        ],
        "email_addresses": [
          {
            "value": "t.troy@example.com",
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
        "recruiter": {
          "id": 3128,
          "email": "alicia.flopple.3128@example.com",
          "name": "Alicia Flopple",
          "employee_id": "456DEF"
        },
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

The New Prospect Application event occurs when a new prospect application is created.

See webhook [common attributes](#common-attributes).

