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
