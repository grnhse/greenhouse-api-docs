# Organization Events

## Department deleted

This webhook fires when departments are deleted from the Greenhouse system from the Configure &raquo; Organization screen. This only happens when the "Remove" button is clicked after clicking the "X" next to an office name.

```json
{
  "action": "department_deleted",
  "payload": {
    "department": {
      "id": 106,
      "name": "Creative",
      "child_ids": [
        23328
      ],
      "parent_id": 5,
      "external_id": "ex-office-1"
    }
  }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `id` | The Greenhouse id for the department |
| `name` | The name of the department deleted |
| `child_ids` | Any former child department ids (this includes all descendants); will be [] if empty |
| `parent_id` | The department's parent department id; will be null if empty |

## Office deleted

This webhook fires when offices are deleted from the Greenhouse system from the Configure &raquo; Organization screen. This only happens when the "Remove" button is clicked after clicking the "X" next to an office name.

```json
{
  "action": "office_deleted",
  "payload": {
    "office": {
      "id": 16492,
      "name": "New York",
      "location": {
        "name": "New York, NY"
      },
      "child_ids": [
        123,
        456
      ],
      "parent_id": 789,
      "external_id": "ex-dep-1"
    }
  }
}
```

### Noteworthy response attributes

| Attribute | Note |
|------------|--------|
| `id` | The Greenhouse id for the office |
| `name` | The name of the office deleted |
| `location` | The location for the office |
| `child_ids` | Any former child office ids; will be [] if empty  |
| `parent_id` | The office's parent office id; will be null if empty  |
