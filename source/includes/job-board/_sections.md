# Prospect Post Sections

## List sections

```json
{
  "sections":[
    {
      "id":14128,
      "name":"Don't see a job you like?",
      "jobs":[
        {
          "id":44444,
          "title":"Engineer",
          "location":{
            "name":"San Francisco, CA"
          },
          "updated_at":"2013-07-02T19:39:23Z",
          "absolute_url":"http://your.co/careers?gh_jid=444444",
          "language":"en"
        },
        {
          "id":55555,
          "title":"Product Manager",
          "location":{
            "name":"San Francisco, CA"
          },
          "updated_at":"2013-07-02T19:39:23Z",
          "absolute_url":"http://your.co/careers?gh_jid=55555",
          "language":"en"
        }
      ]
    },
  {
      "id":85764,
      "name":"General Application",
      "jobs":[
        {
          "id":888888,
          "title":"Prospect",
          "location":{
            "name":"San Francisco, CA"
          },
          "updated_at":"2013-07-02T19:39:23Z",
          "absolute_url":"http://your.co/careers?gh_jid=888888",
          "language":"en"
        }
      ]
    }
  ]
}
```

Returns a list of your organization’s sections and prospect posts. Prospect posts can be listed under a specific department or section. To view all prospect posts, list jobs and filter results by null `internal_job_id`


### HTTP Request

`GET https://boards-api.greenhouse.io/v1/boards/{board_token}/sections`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token

## Retrieve a section

```json
{
  "id":14128,
  "name":"Don't see a job you like?",
  "jobs":[
    {
      "id":44444,
      "title":"Engineer",
      "location":{
        "name":"San Francisco, CA"
      },
      "updated_at":"2013-07-02T19:39:23Z",
      "absolute_url":"http://your.co/careers?gh_jid=444444",
      "language":"en"
    },
    {
      "id":55555,
      "title":"Product Manager",
      "location":{
        "name":"San Francisco, CA"
      },
      "updated_at":"2013-07-02T19:39:23Z",
      "absolute_url":"http://your.co/careers?gh_jid=55555",
      "language":"en"
    }
  ]
}
```

Returns a list of prospect posts for a given `section_id`

### HTTP Request

`GET https://boards-api.greenhouse.io/v1/boards/{board_token}/sections/{section_id}`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token
section_id | ID of the section to retrieve
