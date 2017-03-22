# Degrees

## List Degrees
```json
{
  "items": [
    {
      "id": 1403525,
      "text": "High School"
    },
    {
      "id": 1403526,
      "text": "Associate's Degree"
    },
    {
      "id": 1403527,
      "text": "Bachelor's Degree"
    },
    {
      "id": 1403528,
      "text": "Master's Degree"
    },
    {
      "id": 1403529,
      "text": "Master of Business Administration (M.B.A.)"
    },
    {
      "id": 1403534,
      "text": "Other"
    }
  ],
  "meta": {
    "total_count": 6,
    "per_page": 30
  }
}

```

Returns a list of all of your organization's degrees.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/education/degrees`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
term | No | string | A string returns any degrees containing this string in their name.
page | No | string | A cursor for use in pagination. Returns the n-th chunk of objects (30 per page).
