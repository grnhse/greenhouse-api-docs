# Scorecards

All submitted scorecards ordered by candidate.

## The scorecard object

```json
{
  "id": 123,
  "updated_at": "2016-08-22T19:52:38.384Z",
  "created_at": "2016-08-22T19:52:38.384Z",
  "interview": "Application Review",
  "interview_step": {
    "id": 432,
    "name": "Application Review"
  },
  "candidate_id": 1234,
  "application_id": 3456,
  "interviewed_at": "2016-08-18T16:00:00.000Z",
  "submitted_by": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "interviewer": {
    "id": 821,
    "first_name": "Robert",
    "last_name": "Robertson",
    "name": "Robert Robertson",
    "employee_id": "100377"
  },
  "submitted_at": "2014-03-26T21:59:51Z",
  "overall_recommendation": "yes",
  "attributes": [
    {
      "name": "Communication",
      "type": "Skills",
      "note": "What a great communicator!",
      "rating": "yes"
    },
    {
      "name": "Adaptable",
      "type": "Skills",
      "note": null,
      "rating": "yes"
    },
    {
      "name": "Relationship Manager",
      "type": "Skills",
      "note": null,
      "rating": "mixed"
    },
    {
      "name": "Project Management",
      "type": "Qualifications",
      "note": null,
      "rating": "mixed"
    },
    {
      "name": "Problem Solver",
      "type": "Qualifications",
      "note": null,
      "rating": "no"
    },
    {
      "name": "Analytical",
      "type": "Skills",
      "note": null,
      "rating": "definitely_not"
    }
  ],
  "ratings": {
    "definitely_not": [
      "Analytical"
    ],
    "no": [
      "Problem Solver"
    ],
    "mixed": [
      "Relationship Manager",
      "Project Management"
    ],
    "yes": [
      "Communication",
      "Adaptable"
    ],
    "strong_yes": []
  },
  "questions": [
    {
      "id": null,
      "question": "Key Take-Aways",
      "answer": "Seems like a decent candidate."
    },
    {
      "id": null,
      "question": "Private Notes",
      "answer": "Seems like a decent candidate."
    },
    {
      "id": 1234567,
      "question": "Does the candidate have experience designing APIs?",
      "answer": "Yes"
    },
    {
      "id": 1234568,
      "question": "Which team would you suggest for this candidate?",
      "answer": "Alpha Team"
    },
    {
      "id": 1234569,
      "question": "Where would the candidate be willing to work?",
      "answer": "London, Dubai, San Diego"
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The scorecard's unique identifier |
| candidate_id | The ID of the [candidate](#candidates) whom this scorecard was written for.
| submitted_by | The [user](#users) who submitted this scorecard.  Note that this user may not necessarily be the the interviewer, since scorecards can be submitted on behalf of other users.
| interviewer | The [user](#users) who interviewed the candidate.
| overall_recommendation | One of: `definitely_not`, `no`, `yes`, `strong_yes`, `no_decision`
| attributes | Array containing the attributes of the Scorecard. Describes each attribute's name, type, rating (can be "no_decision"), and an optional note.
| questions | An array of custom questions and answers recorded during the interview. Each question can include basic HTML formatting (`<p>`, `<ul>`, `<li>`, `<b>`, `<i>`, `<a>`). Render or sanitize as needed.

## GET: List Scorecards

```shell
curl 'https://harvest.greenhouse.io/v1/scorecards'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 123,
    "updated_at": "2016-08-22T19:52:38.384Z",
    "created_at": "2016-08-22T19:52:38.384Z",
    "interview": "Application Review",
    "interview_step": {
      "id": 432,
      "name": "Application Review"
    },
    "candidate_id": 1234,
    "application_id": 3456,
    "interviewed_at": "2016-08-18T16:00:00.000Z",
    "submitted_by": {
      "id": 4080,
      "first_name": "Kate",
      "last_name": "Austen",
      "name": "Kate Austen",
      "employee_id": "12345"
    },
    "interviewer": {
      "id": 821,
      "first_name": "Robert",
      "last_name": "Robertson",
      "name": "Robert Robertson",
      "employee_id": "100377"
    },
    "submitted_at": "2014-03-26T21:59:51Z",
    "overall_recommendation": "yes",
    "attributes": [
      {
        "name": "Communication",
        "type": "Skills",
        "note": "What a great communicator!",
        "rating": "yes"
      },
      {
        "name": "Adaptable",
        "type": "Skills",
        "note": null,
        "rating": "yes"
      },
      {
        "name": "Relationship Manager",
        "type": "Skills",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Project Management",
        "type": "Qualifications",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Problem Solver",
        "type": "Qualifications",
        "note": null,
        "rating": "no"
      },
      {
        "name": "Analytical",
        "type": "Skills",
        "note": null,
        "rating": "definitely_not"
      }
    ],
    "ratings": {
      "definitely_not": [
        "Analytical"
      ],
      "no": [
        "Problem Solver"
      ],
      "mixed": [
        "Relationship Manager",
        "Project Management"
      ],
      "yes": [
        "Communication",
        "Adaptable"
      ],
      "strong_yes": []
    },
    "questions": [
      {
        "id": null,
        "question": "Key Take-Aways",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": null,
        "question": "Private Notes",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": 1234567,
        "question": "Does the candidate have experience designing APIs?",
        "answer": "Yes"
      },
      {
        "id": 1234568,
        "question": "Which team would you suggest for this candidate?",
        "answer": "Alpha Team"
      },
      {
        "id": 1234569,
        "question": "Where would the candidate be willing to work?",
        "answer": "London, Dubai, San Diego"
      }
    ]
  },
  {
    "id": 3414169,
    "updated_at": "2016-01-08T19:07:08.295Z",
    "created_at": "2016-01-08T19:07:08.295Z",
    "interview": "Behavioral Phone Interview",
    "interview_step": {
      "id": 433,
      "name": "Behavioral Phone Interview"
    },
    "candidate_id": 14271904,
    "application_id": 23558552,
    "interviewed_at": "2016-01-08T17:00:00.000Z",
    "submitted_by": {
        "id": 158104,
        "first_name": "Jane",
        "last_name": "Doe",
        "name": "Dane Doe",
        "employee_id": "034509364"
    },
    "interviewer": {
      "id": 821,
      "first_name": "Robert",
      "last_name": "Robertson",
      "name": "Robert Robertson",
      "employee_id": "100377"
    },
    "submitted_at": "2016-01-08T19:07:08.295Z",
    "overall_recommendation": "no",
    "attributes": [
      {
        "name": "Communication",
        "type": "Skills",
        "note": "What a great communicator!",
        "rating": "yes"
      },
      {
        "name": "Adaptable",
        "type": "Skills",
        "note": null,
        "rating": "yes"
      },
      {
        "name": "Relationship Manager",
        "type": "Skills",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Project Management",
        "type": "Qualifications",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Problem Solver",
        "type": "Qualifications",
        "note": null,
        "rating": "no"
      },
      {
        "name": "Analytical",
        "type": "Skills",
        "note": null,
        "rating": "definitely_not"
      }
    ],
    "ratings": {
      "definitely_not": [
        "Analytical"
      ],
      "no": [
        "Problem Solver"
      ],
      "mixed": [
        "Relationship Manager",
        "Project Management"
      ],
      "yes": [
        "Communication",
        "Adaptable"
      ],
      "strong_yes": []
    },
    "questions": [
      {
        "id": null,
        "question": "Key Take-Aways",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": null,
        "question": "Private Notes",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": 1234567,
        "question": "Does the candidate have experience designing APIs?",
        "answer": "Yes"
      },
      {
        "id": 1234568,
        "question": "Which team would you suggest for this candidate?",
        "answer": "Alpha Team"
      },
      {
        "id": 1234569,
        "question": "Where would the candidate be willing to work?",
        "answer": "London, Dubai, San Diego"
      }
    ]
  }
]
```

List all of an organization's scorecards.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/scorecards`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| *per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| *skip_count | If `true`, the performance of retrieving scorecards will improve. This will remove `last` from the `link` response header.
| created_before | Return only scorecards that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only scorecards that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before | Return only scorecards that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after | Return only scorecards that were updated at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.

<br>
[See noteworthy response attributes.] (#the-scorecard-object)

## GET: List Scorecards for Application

```shell
curl 'https://harvest.greenhouse.io/v1/applications/{id}/scorecards'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 211231,
    "updated_at": "2016-08-22T19:52:38.384Z",
    "created_at": "2016-08-22T19:52:38.384Z",
    "interview": "Application Review",
    "interview_step": {
      "id": 432,
      "name": "Application Review"
    },
    "candidate_id": 2131415,
    "application_id": 23558552,
    "interviewed_at": "2016-08-18T16:00:00.000Z",
    "submitted_by": {
      "id": 4080,
      "first_name": "Kate",
      "last_name": "Austen",
      "name": "Kate Austen",
      "employee_id": "12345"
    },
    "interviewer": {
      "id": 821,
      "first_name": "Robert",
      "last_name": "Robertson",
      "name": "Robert Robertson",
      "employee_id": "100377"
    },
    "submitted_at": "2014-03-26T21:59:51Z",
    "overall_recommendation": "yes",
    "attributes": [
      {
        "name": "Communication",
        "type": "Skills",
        "note": "What a great communicator!",
        "rating": "yes"
      },
      {
        "name": "Adaptable",
        "type": "Skills",
        "note": null,
        "rating": "yes"
      },
      {
        "name": "Relationship Manager",
        "type": "Skills",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Project Management",
        "type": "Qualifications",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Problem Solver",
        "type": "Qualifications",
        "note": null,
        "rating": "no"
      },
      {
        "name": "Analytical",
        "type": "Skills",
        "note": null,
        "rating": "definitely_not"
      }
    ],
    "ratings": {
      "definitely_not": [
        "Analytical"
      ],
      "no": [
        "Problem Solver"
      ],
      "mixed": [
        "Relationship Manager",
        "Project Management"
      ],
      "yes": [
        "Communication",
        "Adaptable"
      ],
      "strong_yes": []
    },
    "questions": [
      {
        "id": null,
        "question": "Key Take-Aways",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": null,
        "question": "Private Notes",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": 1234567,
        "question": "Does the candidate have experience designing APIs?",
        "answer": "Yes"
      },
      {
        "id": 1234568,
        "question": "Which team would you suggest for this candidate?",
        "answer": "Alpha Team"
      },
      {
        "id": 1234569,
        "question": "Where would the candidate be willing to work?",
        "answer": "London, Dubai, San Diego"
      }
    ]
  },
  {
    "id": 3414169,
    "updated_at": "2016-01-08T19:07:08.295Z",
    "created_at": "2016-01-08T19:07:08.295Z",
    "interview": "Behavioral Phone Interview",
    "interview_step": {
      "id": 433,
      "name": "Behavioral Phone Interview"
    },
    "candidate_id": 14271904,
    "application_id": 23558552,
    "interviewed_at": "2016-01-08T17:00:00.000Z",
    "submitted_by": {
        "id": 158104,
        "first_name": "Jane",
        "last_name": "Doe",
        "name": "Dane Doe",
        "employee_id": "034509364"
    },
    "interviewer": {
      "id": 821,
      "first_name": "Robert",
      "last_name": "Robertson",
      "name": "Robert Robertson",
      "employee_id": "100377"
    },
    "submitted_at": "2016-01-08T19:07:08.295Z",
    "overall_recommendation": "no",
    "attributes": [
      {
        "name": "Communication",
        "type": "Skills",
        "note": "What a great communicator!",
        "rating": "yes"
      },
      {
        "name": "Adaptable",
        "type": "Skills",
        "note": null,
        "rating": "yes"
      },
      {
        "name": "Relationship Manager",
        "type": "Skills",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Project Management",
        "type": "Qualifications",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Problem Solver",
        "type": "Qualifications",
        "note": null,
        "rating": "no"
      },
      {
        "name": "Analytical",
        "type": "Skills",
        "note": null,
        "rating": "definitely_not"
      }
    ],
    "ratings": {
      "definitely_not": [
        "Analytical"
      ],
      "no": [
        "Problem Solver"
      ],
      "mixed": [
        "Relationship Manager",
        "Project Management"
      ],
      "yes": [
        "Communication",
        "Adaptable"
      ],
      "strong_yes": []
    },
    "questions": [
      {
        "id": null,
        "question": "Key Take-Aways",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": null,
        "question": "Private Notes",
        "answer": "Seems like a decent candidate."
      },
      {
        "id": 1234567,
        "question": "Does the candidate have experience designing APIs?",
        "answer": "Yes"
      },
      {
        "id": 1234568,
        "question": "Which team would you suggest for this candidate?",
        "answer": "Alpha Team"
      },
      {
        "id": 1234569,
        "question": "Where would the candidate be willing to work?",
        "answer": "London, Dubai, San Diego"
      }
    ]
  }
]
```

List all submitted scorecards for the requested application.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{id}/scorecards`

### URL Parameters

Parameter | Description
--------- | -----------
id | ID of application whose scorecards you want to retrieve.

<br>
[See noteworthy response attributes.] (#the-scorecard-object)

## GET: Retrieve Scorecard

```shell
curl 'https://harvest.greenhouse.io/v1/scorecards/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 211231,
  "updated_at": "2016-08-22T19:52:38.384Z",
  "created_at": "2016-08-22T19:52:38.384Z",
  "interview": "Application Review",
  "interview_step": {
    "id": 432,
    "name": "Application Review"
  },
  "candidate_id": 2131415,
  "application_id": 23558552,
  "interviewed_at": "2016-08-18T16:00:00.000Z",
  "submitted_by": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "interviewer": {
    "id": 821,
    "first_name": "Robert",
    "last_name": "Robertson",
    "name": "Robert Robertson",
    "employee_id": "100377"
  },
  "submitted_at": "2014-03-26T21:59:51Z",
  "overall_recommendation": "yes",
  "attributes": [
    {
      "name": "Communication",
      "type": "Skills",
      "note": "What a great communicator!",
      "rating": "yes"
    },
    {
      "name": "Adaptable",
      "type": "Skills",
      "note": null,
      "rating": "yes"
    },
    {
      "name": "Relationship Manager",
      "type": "Skills",
      "note": null,
      "rating": "mixed"
    },
    {
      "name": "Project Management",
      "type": "Qualifications",
      "note": null,
      "rating": "mixed"
    },
    {
      "name": "Problem Solver",
      "type": "Qualifications",
      "note": null,
      "rating": "no"
    },
    {
      "name": "Analytical",
      "type": "Skills",
      "note": null,
      "rating": "definitely_not"
    }
  ],
  "ratings": {
    "definitely_not": [
      "Analytical"
    ],
    "no": [
      "Problem Solver"
    ],
    "mixed": [
      "Relationship Manager",
      "Project Management"
    ],
    "yes": [
      "Communication",
      "Adaptable"
    ],
    "strong_yes": []
  },
  "questions": [
    {
      "id": null,
      "question": "Key Take-Aways",
      "answer": "Seems like a decent candidate."
    },
    {
      "id": null,
      "question": "Private Notes",
      "answer": "Seems like a decent candidate."
    },
    {
      "id": 1234567,
      "question": "Does the candidate have experience designing APIs?",
      "answer": "Yes"
    },
    {
      "id": 1234568,
      "question": "Which team would you suggest for this candidate?",
      "answer": "Alpha Team"
    },
    {
      "id": 1234569,
      "question": "Where would the candidate be willing to work?",
      "answer": "London, Dubai, San Diego"
    }
  ]
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/scorecards/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the scorecard to retrieve

<br>
[See noteworthy response attributes.] (#the-scorecard-object)
