# Rejection Reasons

## The rejection reason object

Represents rejection reasons configured by an organization under the Custom Options section of Greenhouse.

```json
{
  "id": 262,
  "name": "Missing resume",
  "type": {
    "id": 1,
    "name": "We rejected them"
  }
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The rejection reason's unique identifier |
| name | The rejection reason's name
| type | One of `{"id": 1, "name": "We rejected them"}`, `{"id": 2, "name": "They rejected us"}`, `{"id": 3, "name": "None specified"}`

## List rejection reasons

```shell
curl 'https://harvest.greenhouse.io/v1/rejection_reasons' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 262,
    "name": "Missing resume",
    "type": {
      "id": 1,
      "name": "We rejected them"
    }
  },
  {
    "id": 280,
    "name": "Not in NYC",
    "type": {
      "id": 1,
      "name": "We rejected them"
    }
  },
  {
    "id": 230,
    "name": "Hiring Freeze",
    "type": {
      "id": 2,
      "name": "None specified"
    }
  }
]
```

Retrieves your organization's rejection reasons.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/rejection_reasons`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.] (#the-rejection-reason-object)