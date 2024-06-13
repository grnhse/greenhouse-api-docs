# Tags

Some resource types allow tags to be assigned to them. Tags are useful for grouping resources.  Currently, only candidates can be tagged from the Harvest API.

## The candidate tag object

```json
{
  "id": 230,
  "name": "New York"
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The candidate tag's unique identifier |
| name | The name of the tag |

## GET: List Candidate Tags

List all of an organization's candidate tags.

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/tags/candidate'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 365,
    "name": "Ruby"
  },
  {
    "id": 366,
    "name": "Rails"
  },
  {
    "id": 367,
    "name": "Junior"
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/tags/candidate`

### Querystring parameters

| Parameter   | Description |
|-------------|-------------|
| *per_page   | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page       | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| *skip_count | If `true`, the performance of retrieving candidate tags will improve. This will remove `last` from the `link` response header.

<br>

[See noteworthy response attributes.](#the-candidate-tag-object)

## POST: Add New Candidate Tag

Add a new candidate tag to this organization

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/tags/candidate'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
   "name": "New tag name"
}
```

> The above command returns a JSON response, structured like this:

```json
{
    "id": 123456,
    "name": "New tag name"
}
```

### HTTP Request

`POST https://harvest.greenhouse.io/v1/tags/candidate`

Name is required and case insensitive. If a tag is supplied that already exists in Greenhouse with any combination of casing, a 200 response code will be returned. If the tag does not exist in Greenhouse, a 201 response code will be returned. The JSON response structure will be the same regardless of the success response code.

## DELETE: Destroy a candidate tag

Removes a candidate tag from this organization

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/tags/candidate/{tag id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
### HTTP Request

`DELETE 'https://harvest.greenhouse.io/v1/tags/candidate/{tag id}`

This endpoint creates an asynchronous job to remove this tag from all candidates to whom it is applied before removing the tag itself from Greenhouse. This data cannot be recovered. Due to the number of candidates that may have any given tag, it may take up to 24 hours for this job to process completely. A success message from this endpoint only states a deletion job has been enqueued, not that the job has been completed.

## GET: List tags applied to candidate

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/candidates/{id}/tags'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 239759,
    "name": "Don't have a job open for them now"
  }
]
```

Retrieve the list of tags applied to a given candidate

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates/{id}/tags`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the candidate whose tags you want to retrieve

<br>

[See noteworthy response attributes.](#the-candidate-tag-object)

## DELETE: Remove tag from candidate

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/candidates/{candidate_id}/tags/{tag_id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "message": "Tag 365 has been removed from candidate 29555013"
}
```

Remove a tag from a candidate

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/candidates/{candidate_id}/tags/{tag_id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL Parameters

Parameter | Description
--------- | -----------
candidate_id | The ID of the candidate to whom you want to apply the tag
tag_id | The ID of the tag you wish to apply

<br>

[See noteworthy response attributes.](#the-candidate-tag-object)

### JSON Body Parameters

No body parameters.

## PUT: Add a candidate tag

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/candidates/{candidate_id}/tags/{tag_id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "message": "Tag 365, 'Ruby', has been applied to candidate 29555013"
}
```

Apply a tag to a given candidate

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/candidates/{candidate_id}/tags/{tag_id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL Parameters

Parameter | Description
--------- | -----------
candidate_id | The ID of the candidate to whom you want to apply the tag
tag_id | The ID of the tag you wish to apply

<br>

[See noteworthy response attributes.](#the-candidate-tag-object)

### JSON Body Parameters

No body parameters.
