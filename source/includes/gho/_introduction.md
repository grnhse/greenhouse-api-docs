# Introduction

Our Greenhouse Onboarding API allows you to query and modify your employee, and query company information.

If you are not using our Onboarding product and would like to know more, 
[please visit our site.](https://greenhouse.io/onboarding)

This documentation is open source! Feel free to leave feedback as issues in the 
[GitHub repo](https://github.com/grnhse/greenhouse-api-docs) or fork it and contribute changes!

## GraphQL

Greenhouse Onboarding only supports [GraphQL](http://graphql.org/); we do not have a traditional REST API.  
We made the decision to use GraphQL because it allows you to:

* Increase throughput by requesting only the data you are interested in.
* Use introspection to know precisely what our schema looks like.  Tools like 
[GraphiQL](https://github.com/skevy/graphiql-app) will allow you to quickly and easily explore our entire API.  It even
supports autocomplete!
* Program against an industry-wide standard supported by a variety of tools and organizations.

## General Concepts
Term | Meaning
---------- | -------
Query | Similar to GET requests, queries return data (the return type is in parentheses). They can take arguments (listed in a table under the Query name).
Mutations | Mutate data (similar to POST, PUT, PATCH, DELETE). They also return data (type in parentheses). They can also take arguments (listed in table under the Mutation name).
Type | Each type describes an object in GHO (e.g. Employee or Department). Each type has its own set of fields which contain the information (e.g. Employee has a first name, Department contains a name).
Input Objects | Queries and Mutations take input objects as arguments. These arguments have names and values. The value will either be a scalar or a more complex structured input.
Scalars | The most basic data type. All types (e.g. Employee) have fields that contain scalars or other types that eventually boil down to scalars.
Enums | ENUMs are hard-coded values. They are strings that must be a certain value. E.g. a Signature Request's "status" can only be one of [BEING_PROCESSED CANCELED COMPLETED ERROR WAITING_FOR_COUNTER_SIGNATURE WAITING_FOR_SIGNATURE].

## Authentication

shell
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

```
# When the rate limit is reached, ensuing requests will result 
# in the following response (until the next time period begins):
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

The Greenhouse Onboarding API imposes limits on the amount of data a single client can request over time, as well as the
complexity of individual requests.  This is done to ensure our servers can always service requests as quickly as possible.

### Request Limits

```
# To request the current rate limit information:
{
  rateLimit {
    resetAt
    limit
    remaining
  }
}

# rateLimit response:
{
  "data": { 
    "rateLimit": {
      "resetAt": "2018-09-12T18:00:00Z",
      "limit": 100,
      "remaining": 99
    }
  }
}
```

In order to ensure API stability, we limit the number of requests that can made within a given time window. Consumers can access this rate limit information by querying the `rateLimit` type (see example to the right). The number of remaining requests is indicated by the value in the `remaining` field. When this request limit has been reached, every ensuing request will fail until the next time window begins (indicated by the `resetAt` field). Then, once the next time window starts, the number of requests will be replenished (to the number indicated by the `limit` property). 

### Maximum Complexity

```
# Say we had the following query:
{
  employee(id: 25) {
    email
  }
}

# To request the complexity score of this query, simply 
# include complexityInfo as such:
{
  employee(id: 25) {
    email
  }
  complexityInfo {
    score
    maximum
  }
}

# The response:
{
  "data": {
    "employee": {
      "email": "email_address@example.com"
    },
    "complexityInfo": {
      "score": 1,
      "maximum": 2500
    }
  }
}
```

In addition to limiting the number of requests used in a given time period, we limit the "complexity" of any given 
request. If this score exceeds our maximum, the request will be rejected and an error response will be returned.

We reserve the right to adjust the complexity score of any given field at any time. However, for the time being, a 
query's complexity score can be estimated like so:

* For non-connections (e.g. an employee or a department query): simply add up each field being requested.
  
* For connections (e.g an employees or departments query): add up all requested fields and multiply by the number of 
requested records (e.g. the `first` or `last` argument)
  
Clients can also determine a query's complexity score by requesting the `complexityInfo` object (see example to the
right).

## A Basic Request
```graphql
# If we wanted to retrieve the email address of the employee 
# with ID 25, the GraphQL query would look like this:

{
  employee(id: 25) {
    email
  }
}
```

```graphql
# We then pack this query into a JSON object as a string

{
    "query": "{\n  employee(id: 25) {\n    email\n  }\n}"
}
```

```shell
# Here's what the final cURL request would look like

curl 'https://onboarding-api.greenhouse.io/graphql' \
  -X POST \
  -u your_access_key:your_secret_key \
  -d '{"query":"{\n  employee(id: 25) {\n    email\n  }\n}"}' \
  -H 'content-type: application/json'

# and here's what the response would look like

{"data":{"employee":{"email":"employee_25_email@example.com"}}}
```

GraphQL requests are simply POSTs made to our API endpoint.  In its most simple form, the request payload consists of a 
JSON object with a single key: "query". The corresponding value for the "query" key is the GraphQL query itself, and it 
is expressed as a string.