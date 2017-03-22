# Disciplines

## List Disciplines
```json
{
  "items": [
    {
      "id": 1403541,
      "text": "Art"
    },
    {
      "id": 1403553,
      "text": "Earth Sciences"
    },
    {
      "id": 1403563,
      "text": "Fine Arts"
    },
    {
      "id": 1403569,
      "text": "Industrial Arts & Carpentry"
    }
  ],
  "meta": {
    "total_count": 4,
    "per_page": 30
  }
}
```

Returns a list of all of your organization's disciplines.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/education/disciplines`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
term | No | string | A string returns any disciplines containing this string in their name.
page | No | string | A cursor for use in pagination. Returns the n-th chunk of objects (30 per page).
