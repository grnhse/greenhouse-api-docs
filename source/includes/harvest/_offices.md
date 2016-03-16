# Offices

## The office object

Your organization’s offices.

```json
{
  "id": 175,
  "name": "San Francisco",
  "location": {
    "name": "San Francisco, CA"
  }
}
```

### Noteworthy attributes 

| Attribute | Description |
|-----------|-------------|
| id | The office's unique identifier |
| name | The office's name |

## List offices

```shell
curl 'https://harvest.greenhouse.io/v1/offices' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 175,
    "name": "San Francisco",
    "location": {
      "name": "San Francisco, CA"
    }
  },
  {
    "id": 344,
    "name": "Bangkok",
    "location": {
      "name": "Bangkok Thailand"
    }
  },
  {
    "id": 145,
    "name": "Remote Locations",
    "location": {
      "name": null
    }
  }
]
```

List all of your organization's offices.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/offices`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.] (#the-office-object)


## Retrieve an office

```shell
curl 'https://harvest.greenhouse.io/v1/offices/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 175,
  "name": "San Francisco",
  "location": {
    "name": "San Francisco, CA"
  }
}
```

Retrieve an office by its ID.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/offices/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the office to retrieve

<br>
[See noteworthy response attributes.] (#the-office-object)
