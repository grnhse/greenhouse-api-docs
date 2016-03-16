# Scorecards

All submitted scorecards ordered by candidate.

## The scorecard object

```json
{
  "id": 123,
  "interview": "Application Review",
  "interviewed_at": "2014-03-26T04:00:00Z",
  "candidate_id": 1234,
  "submitted_by": {
    "id": 4080,
    "name": "Kate Austen"
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
      "type": "Skills",
      "note": null,
      "rating": "mixed"
    },
    {
      "name": "Problem Solver",
      "type": "Skills",
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
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The scorecard's unique identifier |
| candidate_id | The ID of the [candidate](#candidates) whom this scorecard was written for.
| submitted_by | The [user](#users) who submitted this scorecard.
| overall_recommendation | One of: `definitely_not`, `no`, `yes`, `strong_yes`, `mixed`, `no_decision`
| attributes | Array containing the attributes of the Scorecard. Describes each attribute's name, type, rating (can be "no_decision"), and an optional note.

## List scorecards

```shell
curl 'https://harvest.greenhouse.io/v1/scorecards' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 123,
    "interview": "Application Review",
    "interviewed_at": "2014-03-26T04:00:00Z",
    "candidate_id": 1234,
    "submitted_by": {
      "id": 4080,
      "name": "Kate Austen"
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
        "type": "Skills",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Problem Solver",
        "type": "Skills",
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
      }
    ]
  },
  { },
]
```

List all scorecards.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/scorecards`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.] (#the-scorecard-object)

## Retrieve a scorecard

```shell
curl 'https://harvest.greenhouse.io/v1/scorecards/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 123,
  "interview": "Application Review",
  "interviewed_at": "2014-03-26T04:00:00Z",
  "candidate_id": 1234,
  "submitted_by": {
    "id": 4080,
    "name": "Kate Austen"
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
      "type": "Skills",
      "note": null,
      "rating": "mixed"
    },
    {
      "name": "Problem Solver",
      "type": "Skills",
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

## List scorecards for application

```shell
curl 'https://harvest.greenhouse.io/v1/applications/{id}/scorecards' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 123,
    "interview": "Application Review",
    "interviewed_at": "2014-03-26T04:00:00Z",
    "candidate_id": 1234,
    "submitted_by": {
      "id": 4080,
      "name": "Kate Austen"
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
        "type": "Skills",
        "note": null,
        "rating": "mixed"
      },
      {
        "name": "Problem Solver",
        "type": "Skills",
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
      }
    ]
  },
  { },
]
```

List all submitted scorecards for the requested application.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{id}/scorecards`

### Query Parameters

Parameter | Description
--------- | -----------
id | ID of application whose scorecards you want to retrieve.

<br>
[See noteworthy response attributes.] (#the-scorecard-object)