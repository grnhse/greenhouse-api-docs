# Departments

## List departments

> With `render_as=list` (default)

```json
{
  "departments":[
    {
      "id":77777,
      "name":"R & D",
      "jobs":[
      ],
      "parent_id":null,
      "child_ids":[
        33333
      ]
    },
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
      "parent_id":77777,
      "child_ids":[
      ]
    },
    {
      "id":22222,
      "name":"Account Management",
      "jobs":[
      ],
      "parent_id":null,
      "child_ids":[
      ]
    },
    // { ... } All departments are listed
  ]
}
```

> With `render_as=tree`

```json
{
  "departments":[
    {
      "id":77777,
      "name":"R & D",
      "jobs":[
      ],
      "children":[
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
          "children":[
          ]
        },
      ]
    },
    {
      "id":22222,
      "name":"Account Management",
      "jobs":[
      ],
      "children":[
      ]
    },
    // { ... } All departments are listed
  ]
}
```

Returns a list of your organization's departments and jobs.


### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/departments`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
render_as | No | string | This parameter defines how to represent the list of departments. The default value is 'list'.

Allowed `render_as` values:

| Value | Description |
|-------|--------------|
| list | (Default). The departments are returned as a list of objects and they include `parent_id` and `child_ids`. |
| tree | The departments are returned as a list of trees with `children`. |

## Retrieve a department

> With `render_as=list` (default)

```json
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
  "child_ids":[
    77777
  ]
}
```

> With `render_as=tree`

```json
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
  "children":[
    {
      "id":77777,
      "name":"Mobile Development",
      "jobs":[
      ],
      "children":[
      ]
    }
  ]
}
```

Returns a list of jobs for a given `department_id`.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/departments/{department_id}`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token
department_id | ID of the department to retrieve

### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
render_as | No | string | This parameter defines how to represent the list of departments. The default value is 'list'.

Allowed `render_as` values:

| Value | Description |
|-------|--------------|
| list | (Default).
| tree | The children departments are returned as a tree. |
