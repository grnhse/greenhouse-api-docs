# Sources

## The source object 

Your organization's sources.

```json
{
  "id": 632,
  "name": "Other",
  "type": {
    "id": 5,
    "name": "Prospecting"
  }
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The source's unique identifier |
| type.name | One of: `attend_events`, `referrals`, `third_party_boards`, `candidate_search`, `other`, `social_media`, `company_marketing`, `agencies`, `prospecting`

## List sources

```shell
curl 'https://harvest.greenhouse.io/v1/sources' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 632,
    "name": "Other",
    "type": {
      "id": 5,
      "name": "Prospecting"
    }
  },
  {
    "id": 928,
    "name": "Destiny",
    "type": {
      "id": 7,
      "name": "Supernatural Means"
    }
  }
]
```

Lists an organization's sources, grouped by strategy.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/sources`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.] (#the-source-object)

## Retrieve a source 

```shell
curl 'https://harvest.greenhouse.io/v1/sources/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 632,
  "name": "Other",
  "type": {
    "id": 5,
    "name": "Prospecting"
  }
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/sources/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the source to retrieve

<br>
[See noteworthy response attributes.] (#the-source-object)