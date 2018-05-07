# Introduction

Our Greenhouse Onboarding API allows you to query and modify your employee, task, and company information.

If you are not using our Onboarding product and would like to know more, 
[please visit our site.](https://greenhouse.io/onboarding)

This documentation is open source! Feel free to leave feedback as issues in the 
[GitHub repo](https://github.com/grnhse/greenhouse-api-docs) or fork it and contribute changes!

## GraphQL
Greenhouse Onboarding only supports [GraphQL](http://graphql.org/); we do not have a traditional REST API.
We made the decision to use GraphQL because it allows us to:

* Increase throughput by requesting only the data you are interested in.
* Use introspection to know precisely what our schema looks like.  Tools like 
[GraphiQL App](https://github.com/skevy/graphiql-app) will allow you to quickly and easily explore our entire API.  It even
supports autocomplete!
* Program against an industry-wide standard supported by a variety of tools and organizations.

## Authentication

```shell
$ curl https://onboarding-api.greenhouse.io/graphql \
  -X POST \
  -u your_access_key:your_secret_key \
  -d '{"query":"{\n  rateLimit {\n    limit\n  }\n}"}' \
  -H "Content-Type: application/json"

...

> GET /graphql HTTP/1.1
> Host: onboarding-api.greenhouse.io
> Authorization: Basic eW91cl9hY2Nlc3Nfa2V5OnlvdXJfdmFsdWU=
```
The Greenhouse Onboarding API is secured with HTTP Basic Authentication over HTTPS.  Clients are required to supply
both a username and password.  Credentials can be generated inside of the Greenhouse Onboarding product on the
[Settings > API Management screen](https://onboarding.greenhouse.io/settings/api_management).  Only Super Admins can
generate or revoke API keys.  Use the `Access Key` field as the username and the `Secret Key` field as the password.

<img src="/images/gho/api-management.png" alt="API Management">

Using the Greenhouse Onboarding API provides access to _all_ of your company's information.  There is no way to limit
the scope of an API key.  Only share your API key with people that you trust.  API keys can be revoked at any time
on the API Management screen.

## Rate Limiting

The Greenhouse Onboarding API imposes limits on the the number of requests a single client can send us, as well as the
complexity of these requests.  This is done to ensure our servers can always service requests as quickly as possible.

### Request Costs

```json
{
  "errors": [
    {
      "message": "Rate limit reached.",
      "limit": 100,
      "remaining": 0,
      "resetAt": "2018-01-01T01:00:00Z"
    }
  ]
}
```

GraphQL gives clients the ability to specify the exact data to be returned in each request.  This means that some
requests can query lots of data, while others are much simpler and only return a handful of fields.  For this reason,
a simple rate-limiting protocol of "X requests per hour" is not a good fit.

Instead, each API key is given a budget of "API points" that can be spent on requests.  Each request can have a separate
cost.  Once the API key has run out of points, all further requests will return an error message stating that requests
are now being throttled.

This message indicates the total number of API points this API key has in its budget and when the API points will
be restored to the maximum limit.

```graphql
{
  employee(id: 1) {
    email
  }

  rateLimit {
    cost
    limit
    remaining
  }
}
```

```json
{
  "data": {
     "employee": {
       "email": "test@example.com"
    },
    "rateLimit": {
      "cost": 1,
      "limit": 100,
      "remaining": 99
    }
  }
}
```
Clients can ask for this information before their requests have been throttled by querying for the `rateLimit` object.
In general, the more complex a query, the higher its cost.  We reserve the right to change the costs for each query,
and the budgets for API keys, at any time.

### Maximum Depth

The Greenhouse Onboarding API limits the maximum depth of any request to 10.
