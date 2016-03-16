# Departments

## List departments

```json
{
  "departments":[
    {
      "id":33333,
      "name":"Engineering",
      "jobs":[
        {
          "id":44444,
          "title":"Product Engineer",
          "updated_at":"2013-07-02T19:39:23Z",
          "location":{
            "name":"San Francisco, CA"
          },
          "absolute_url":"http://your.co/careers?gh_jid=444444"
        },
        {
          "id":55555,
          "title":"Mobile Engineer - iOS",
          "updated_at":"2013-07-02T19:39:23Z",
          "location":{
            "name":"San Francisco, CA"
          },
          "absolute_url":"http://your.co/careers?gh_jid=55555"
        }
  ]
}
```

Returns a list of your organization's departments and jobs.


### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/embed/departments`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

## Retrieve a department

```json
{
  "id":33333,
  "name":"Engineering",
  "jobs":[
    {
      "id":44444,
      "title":"Product Engineer",
      "updated_at":"2013-07-02T19:39:23Z",
      "location":{
        "name":"San Francisco, CA"
      },
      "absolute_url":"http://your.co/careers?gh_jid=444444"
    },
    {
      "id":55555,
      "title":"Mobile Engineer - iOS",
      "updated_at":"2013-07-02T19:39:23Z",
      "location":{
        "name":"San Francisco, CA"
      },
      "absolute_url":"http://your.co/careers?gh_jid=55555"
    }
  ]
}
```

Returns a list of jobs for a given `department_id`.

### HTTP Request

`GET https://api.greenhouse.io/v1/boards/{board_token}/embed/department?id={department_id}`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

### Querystring Parameters
department_id | ID of the department to retrieve