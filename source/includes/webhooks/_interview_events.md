# Interview Events

## Interview deleted

This webhook fires when a scheduled interview is cancelled or the interview is deleted directly. This webhook will not fire if an interview is deleted because a candidate, application, or hiring plan is deleted.

```json
{
  "action": "interview_deleted",
  "payload": {
    "interview": {
      "id": 31087450
    }
  }
}
```

## Interview scheduled or updated

This webhook fires when an interview is scheduled. It also fires when a scheduled interview is updated, such as a new time or location. In both cases, `action` is `interview_scheduled`.

An update fires the webhook only when it changes a value in the `interview` object. A change to `updated_at` alone does not fire it. Interviewers are not in the payload. A change to interviewers fires the webhook only when it also changes another value, such as `status`.

This webhook does not fire for changes made outside scheduling. For example, it does not fire when `status` changes after a scorecard is submitted. It also does not fire when an interview is cancelled or deleted. Use the [Interview deleted](#interview-deleted) webhook for those cases.

```json
{
  "organization_id": 123456,
  "organization_name": "Example Company",
  "action": "interview_scheduled",
  "payload": {
    "interview": {
      "id": 31087450,
      "application_id": 71980812,
      "external_event_id": "0bfskb5cd3ddrp9ihj4gg7k1a4",
      "starts_at": "2026-11-02T15:00:00.000Z",
      "ends_at": "2026-11-02T16:00:00.000Z",
      "location": "Conference Room 4",
      "created_at": "2026-10-27T09:15:00.000Z",
      "updated_at": "2026-10-28T12:30:00.000Z",
      "organizer_id": 92120,
      "scheduled_at": "2026-10-28T12:30:00.000Z",
      "availability_received_at": null,
      "job_id": 2944102,
      "job_interview_id": 4368004,
      "all_day_start_on": null,
      "all_day_end_on": null,
      "video_conferencing_url": "https://example.zoom.us/j/1234567890",
      "status": "scheduled"
    }
  }
}
```

### Noteworthy response attributes

| Attribute | Note |
|-----------|------|
| `interview.application_id` | The application the interview is for. Use this ID with the [Harvest API](https://harvestdocs.greenhouse.io/) to get the application and its candidate. |
| `interview.job_id` | The job the interview is for. |
| `interview.job_interview_id` | The interview step set up on the job. This is not the same as `interview.id`. |
| `interview.status` | One of `to_be_scheduled`, `scheduled`, `awaiting_feedback`, `complete`, `skipped`, `collect_feedback`, `to_be_sent`, `sent`, or `received`. `to_be_sent`, `sent`, and `received` apply to take-home tests. |
| `interview.starts_at`, `interview.ends_at` | The start and end time, in UTC. For an all-day interview, use `interview.all_day_start_on` and `interview.all_day_end_on` instead. |
| `interview.all_day_start_on`, `interview.all_day_end_on` | The start and end date of an all-day interview, as `YYYY-MM-DD`. Both are `null` for an interview that is not all-day. |
| `interview.location` | The location text from the calendar event. This can be `null`. |
| `interview.external_event_id` | The ID of the calendar event, such as a Google Calendar or Outlook event ID. |
| `interview.video_conferencing_url` | The video join link for the interview. This is `null` if the interview has no link. |
| `interview.organizer_id` | The ID of the Greenhouse user who scheduled the interview. |
| `interview.scheduled_at` | The date and time the interview was first scheduled. |
| `interview.availability_received_at` | The date and time Greenhouse first received the candidate's availability for the interview's stage. This is `null` if no availability was received. |

## Scorecard deleted

This webhook only fires when individual scorecards are destroyed.  This occurs when the Harvest API delete endpoint is used, or when the delete scorecard link is used in the application. This will not fire when a candidate or application is deleted. A candidate being deleted implies all their scorecards have been deleted with them. An application being deleted does not cause scorecards to be deleted.

```json
{
  "action": "scorecard_deleted",
  "payload": {
    "scorecard": {
      "id": 6036088,
      "candidate_id": 29843272,
      "interviewed_at": "2016-12-28T17:00:00.000Z",
      "created_at": "2016-12-28T22:58:03.552Z",
      "updated_at": "2016-12-28T22:58:03.552Z",
      "scorecard_status": "complete"
    }
  }
}
```
