# Departments

## The department object

Your organization's departments.

```json
{
	"id": 1,
	"name": "Technology"
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The department's unique identifier |
| name | The department's name

## List departments

List all of your organization's departments.

```shell
curl 'https://harvest.greenhouse.io/v1/departments' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Technology"
  },
  {
    "id": 2,
    "name": "Administration"
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/departments`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.


<br>
[See noteworthy response attributes.](#the-department-object)

## Retrieve a department

```shell
curl 'https://harvest.greenhouse.io/v1/departments/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"name": "Technology"
}
```

Retrieves your organization's departments.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/departments/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the department to retrieve

<br>
[See noteworthy response attributes.](#the-department-object)
