# Scheduled Interviews

## The scheduled interview object 

Interviews that have been scheduled for the specified application.

```json
{
  "id": 9128481,
  "start": {
    "date_time": "2014-03-26T22:15:00.000Z"
  },
  "end": {
    "date_time": "2014-03-26T22:30:00.000Z"
  },
  "location": "Big Conference Room",
  "status": "awaiting_feedback",
  "interview": {
    "id": 7001,
    "name": "Culture Fit"
  },
  "organizer": {
    "id": 2000,
    "name": "Jack Shepard"
  },
  "interviewers": [
    {
      "id": 4080,
      "name": "Kate Austen",
      "email": "kate.austen@example.com",
      "scorecard_id": 11274
    }
  ]
}
```
### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The scheduled interview's unique identifier |
| start | A date_time value if this interview has a precise start time, or a date value if this is an all-day event.
| end | A date_time value if this interview has a precise start time, or a date value if this is an all-day event.
| location | The location of the interview.
| status | One of: `to_be_scheduled`, `scheduled`, `awaiting_feedback`, `complete`, `skipped`, `collect_feedback`, `to_be_sent`, `sent`, `received`.
| organizer | The [user](#users) who is the organizer for this interview
| interviewers | An array containing the [users](#users) who have interviews with this candidate, including, if applicable, the ID of the scorecard they completed.

## List scheduled interviews

```shell
curl 'https://harvest.greenhouse.io/v1/applications/{id}/scheduled_interviews' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json

[
  {
    "id": 9128481,
    "start": {
      "date_time": "2014-03-26T22:15:00.000Z"
    },
    "end": {
      "date_time": "2014-03-26T22:30:00.000Z"
    },
    "location": "Big Conference Room",
    "status": "awaiting_feedback",
    "interview": {
      "id": 7001,
      "name": "Culture Fit"
    },
    "organizer": {
      "id": 2000,
      "name": "Jack Shepard"
    },
    "interviewers": [
      {
        "id": 4080,
        "name": "Kate Austen",
        "email": "kate.austen@example.com",
        "scorecard_id": 11274
      }
    ]
  },
  {
    "id": 9128482,
    "start": {
      "date": "2014-07-08"
    },
    "end": {
      "date": "2014-07-09"
    },
    "location": "Small Conference Room",
    "interview": {
      "id": 7002,
      "name": "Whiteboarding Challenge"
    },
    "organizer": {
      "id": 2000,
      "name": "Jack Shepard"
    },
    "status": "complete",
    "interviewers": [
      {
        "id": 3412,
        "name": "Charlie Pace",
        "email": "youalleverybody@example.com",
        "scorecard_id": null
      }
    ]
  }
]
```

Interviews that have been scheduled for this application.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{id}/scheduled_interviews`

### Query Parameters

Parameter | Description
--------- | -----------
id | ID of the application to retrieve

<br>
[See noteworthy response attributes.] (#the-scheduled-interview-object)