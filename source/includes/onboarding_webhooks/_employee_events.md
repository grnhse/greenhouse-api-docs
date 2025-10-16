# Employee Events

## Employee updated (employee:updated)

The `employee:updated` event occurs when an employee is updated.

```json
{
  "event_type": "employee:updated",
  "id": "692df651-4558-453b-8745-1e75d4543efb",
  "payload": {
    "updated_employee_id": 1234567,
    "acting_employee_id": 1234567,
    "updated_at": "2025-10-15T16:37:17-07:00",
    "updated_fields": [
      {
        "id": "personal_email",
        "name": "Personal Email"
      },
      {
        "id": "phone_number",
        "name": "Phone Number"
      },
      {
        "id": "food_allergies",
        "name": "Food Allergies"
      },
      {
        "id": "desk_location",
        "name": "Desk Location"
      }
    ]
  }
}
```
