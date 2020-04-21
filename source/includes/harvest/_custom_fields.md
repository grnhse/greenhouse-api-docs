# Custom Fields

An organization's custom_fields.

## The custom field object

```json
{
  "id": 123456,
  "name": "Custom Field Name",
  "field_type": "job",
  "priority": 1,
  "value_type": "single_select",
  "private": true,
  "required": false,
  "require_approval": true,
  "trigger_new_version": false,
  "name_key": "custom_field_name",
  "custom_field_options": [
    {
      "id": 123,
      "name": "Name One",
      "priority": 1,
      "external_id": "name-one"
    },
    {
      "id": 234,
      "name": "Name Two",
      "priority": 2,
      "external_id": null
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The custom field's unique identifier |
| name | The field's name in Greenhouse |
| active | Boolean value which is false if the custom field has been deleted, true otherwise. |
| field_type | One of job, candidate, application, offer, rejection_question, referral_question. This is also included in the URL as an argument, which will return only custom fields that match the given type.
| priority | Numeric field used for ordering in Greenhouse.
| value_type | One of short_text, long_text, yes_no, single_select, multi_select, currency, currency_range, number, number_range, date, url, or user
| private | Boolean value to say if this field is private in Greenhouse.
| required | The object this field exists on can not be saved if this value is not set.
| require_approval | Only applicable to job custom fields, changes to this fields requires an approval flow in Greenhouse to be re-done.
| trigger_new_version | Only applicable to offer custom fields, changes to this field creates a new offer version.
| name_key | Listed as "immutable field key" in Greenhouse, this value is based of the name of the field when it is created and does not change as the field's name is later updated.
| custom_field_options | For single_select and multi_select field_types, this is the list of options for that select.
| custom_field_options.priority | Numeric value used for ordering the custom field options.
| custom_field_options.external_id | String value, the external_id for the custom field option


## GET: List Custom Fields

```shell
curl 'https://harvest.greenhouse.io/v1/custom_fields/{field_type}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 123456,
    "name": "Custom Field Name",
    "active": true,
    "field_type": "job",
    "priority": 1,
    "value_type": "single_select",
    "private": true,
    "required": false,
    "require_approval": true,
    "trigger_new_version": false,
    "name_key": "custom_field_name",
    "custom_field_options": [
      {
        "id": 123,
        "name": "Name One",
        "priority": 1
      },
      {
        "id": 234,
        "name": "Name Two",
        "priority": 2
      }
    ]
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/custom_fields/{field_type}`

### URL parameters

| Parameter | Description |
|-----------|-------------|
| *field_type | Returns only custom fields of this type. For example, if “offer” is included in the URL as the field_type, the endpoint will only return custom fields with the “offer” field type.  One of: `offer`, `candidate`, `application`, `job`, `rejection_question`, `referral_question`.

### Querystring parameters   

| Parameter | Description |   
|-----------|-------------|   
| include_inactive | When `true`, include inactive custom fields. Otherwise excludes inactive custom fields.  Defaults to `false`.

<br>
[See noteworthy response attributes.](#the-custom-field-object)

This endpoint supports pagination. See the [Pagination](#pagination) section for more detail.

## GET: Retrieve Custom Field

```shell
curl 'https://harvest.greenhouse.io/v1/custom_field/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 123456,
  "name": "Custom Field Name",
  "active": true,
  "field_type": "job",
  "priority": 1,
  "value_type": "single_select",
  "private": true,
  "required": false,
  "require_approval": true,
  "trigger_new_version": false,
  "name_key": "custom_field_name",
  "custom_field_options": [
    {
      "id": 123,
      "name": "Name One",
      "priority": 1
    },
    {
      "id": 234,
      "name": "Name Two",
      "priority": 2
    }
  ]
}
```
### HTTP Request

`GET https://harvest.greenhouse.io/v1/custom_field/{id}`


### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the custom field to retrieve

<br>
[See noteworthy response attributes.](#the-custom-field-object)

## The custom field options object

Refers to the options available for single-select and multi-select custom fields.

```json
{
  "id": 123456,
  "name": "Option A",
  "priority": 0
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| priority | Numeric field used for ordering in Greenhouse.


## GET: List Custom Field Options

```shell
curl 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 123456,
    "name": "Option A",
    "priority": 0
  },
  {
    "id": 123457,
    "name": "Option B",
    "priority": 1
  },
  {
    "id": 123458,
    "name": "Option C",
    "priority": 2
  }
]
```
Given a single select or multi select custom field, return all its options.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| type | One of all, active, or inactive.  Inactive returns only custom field options that have been deleted.  Active is the default and returns all custom field options currently active.  All returns both active and inactive.  If this isn't included, active fields will be returned.

<br>

This endpoint supports pagination. See the [Pagination](#pagination) section for more detail.


## POST: Create Custom Field Options

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "options": [
    {"name": "Option A", "priority": 5},
    {"name": "Option B", "priority": 6},
    {"name": "Option C", "priority": 7}
  ]
}
```

> The above returns a success message on success with a 201 response.

```
{
    "success": true
}
```

Add additional options to a single select or multi select custom field.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
| options | Yes | array | An array of one or many new custom field options.
| name | Yes | string | The name of the new custom field option.  If a new field is added with the same name as an existing custom field option in this custom field, it will be ignored.  No error will be raised in this case.
| priority | Yes | integer | This is used to order the custom fields in Greenhouse.

<br>

**This returns a 201 on success.  It does not return the objects created.


## PATCH: Update Custom Field Options

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "options": [
    {
      "id": 123, 
      "name": "Option A", 
      "priority": 5
    },
    {
      "id": 234, 
      "name": "Option B", 
      "priority": 6
    },
    {
      "id": 345, 
      "name": "Option C", 
      "priority": 7
    }
  ]
}
```

> The above request returns a JSON success message.

```
{
    "success": true
}
```

Update the names or priorities of existing options in a single select or multi select custom field.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
| options | Yes | array | An array of one or many new custom field options.
| id | Yes | integer | The ID of the custom field option that will be updated.
| name | No | string | If included, the custom field option with this ID will be updated to this name.  This can not duplicate the name of any other option in this field or any option in this request.
| priority | No | integer | If included, The custom field option with this ID will be updated with this value.

<br>

## DELETE: Remove Custom Field Options

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
  -H "On-Behalf-Of: {greenhouse user ID}"
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "option_ids": [
    85709, 85710
  ]
}
```

> The above request is idempotent.  It will return a message with a 200 response and a message stating how many of the IDs were deleted and how many were not found.

```
{
  "message": "3 option(s) deleted. 1 option(s) not found."
}
```

Destroy custom field options

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
option_ids | Yes | array | An array of the custom field option ids to be removed.

<br>

\* Note this does not return a list of option_ids that were not found. It only returns a number of options that were not processed.  If you were to run the same exact command twice in a row, the only difference would be that on the second run, the message would inform you that an ID was not found.
