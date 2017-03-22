# Schools

## List Schools


```json
{
  "items": [
    {
      "id": 1,
      "text": "CUNY - New York City College of Technology"
    },
    {
      "id": 2,
      "text": "Metropolitan College of New York"
    },
    {
      "id": 3,
      "text": "New York Institute of Technology"
    },
    {
      "id": 4,
      "text": "New York University"
    },
    {
      "id": 5,
      "text": "Polytechnic Institute of New York University"
    },
    {
      "id": 6,
      "text": "St. Joseph's College New York"
    }
  ],
  "meta": {
    "total_count": 6,
    "per_page": 30
  }
}
```

Returns a list of all of your organization's schools.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/education/schools`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
term | No | string | A string returns any schools containing this string in their name.
page | No | string | A cursor for use in pagination. Returns the n-th chunk of objects (30 per page).

