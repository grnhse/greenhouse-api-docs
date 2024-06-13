# Sources

## The source object 

An organization's sources.

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

## GET: List Sources

```shell
curl 'https://harvest.greenhouse.io/v1/sources'
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

### Querystring parameters

| Parameter   | Description |
|-------------|-------------|
| *per_page   | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page       | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| *skip_count | If `true`, the performance of retrieving sources will improve. This will remove `last` from the `link` response header.

<br>
[See noteworthy response attributes.] (#the-source-object)

