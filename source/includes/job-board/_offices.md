# Offices

## List offices

```json
{
  "offices":[
    {
      "id":11111,
      "name":"San Francisco",
      "departments":[
        {
          "id":33333,
          "name":"Engineering",
          "jobs":[
            {
              "id":44444,
              "title":"Product Engineer",
              "location":{
                "name":"San Francisco, CA"
              },
              "updated_at":"2013-07-02T19:39:23Z",
              "absolute_url":"http://your.co/careers?gh_jid=444444"
            },
            {
              "id":55555,
              "title":"Mobile Engineer - iOS",
              "location":{
                "name":"San Francisco, CA"
              },
              "updated_at":"2013-07-02T19:39:23Z",
              "absolute_url":"http://your.co/careers?gh_jid=55555"
            }
          ],
          "parent_id":null,
          "child_ids":[]
        },
        {
          "id":22222,
          "name":"Account Management",
          "jobs":[

          ],
          "parent_id":null,
          "child_ids":[]
        },
        // { ... } Each dept is listed for each office
      ]
      "parent_id":null,
      "child_ids":[]
    },
    // { ... } More offices here
  ]
}
```

Returns a list of all of your organization's departments and jobs, grouped by office.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/offices`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
render_as | No | string | This parameter defines how to represent the list of offices. The default value is 'list'.

Allowed `render_as` values:

| Value | Description |
|-------|--------------|
| list | (Default). The offices are returned as a list of objects and they include `parent_id` and `child_ids`. |
| tree | The offices are returned as a list of trees with `children`. |

## Retrieve an office

```json
{
  "id":11111,
  "name":"San Francisco",
  "departments":[
    {
      "id":33333,
      "name":"Engineering",
      "jobs":[
        {
          "id":44444,
          "title":"Product Engineer",
          "location":{
            "name":"San Francisco, CA"
          },
          "updated_at":"2013-07-02T19:39:23Z",
          "absolute_url":"http://your.co/careers?gh_jid=444444"
        },
        {
          "id":55555,
          "title":"Mobile Engineer - iOS",
          "location":{
            "name":"San Francisco, CA"
          },
          "updated_at":"2013-07-02T19:39:23Z",
          "absolute_url":"http://your.co/careers?gh_jid=55555"
        }
	  ]
    },
    {
      "id":22222,
      "name":"Account Management",
      "jobs":[]
    }
  ]
}
```

Returns a list of your organization's departments and jobs for the given `office_id`.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/offices/{office_id}`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token
office_id | ID of the office to retrieve

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
render_as | No | string | This parameter defines how to represent the list of offices. The default value is 'list'.

Allowed `render_as` values:

| Value | Description |
|-------|--------------|
| list | (Default).
| tree | The children offices are returned as a tree. |
