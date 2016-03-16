# Introduction

```
  _          _ _             
 | |__   ___| | | ___        
 | '_ \ / _ \ | |/ _ \       
 | | | |  __/ | | (_) |      
 |_| |_|\___|_|_|\___/     _ 
 __      _____  _ __| | __| |
 \ \ /\ / / _ \| '__| |/ _` |
  \ V  V / (_) | |  | | (_| |
   \_/\_/ \___/|_|  |_|\__,_|
```

With Harvest, you have access to most of your Greenhouse data!

The Harvest API was designed to allow our customers to export their data from Greenhouse. However, it can also be used to...

 1. Update candidate information.
 2. Add attachments to candidate profiles.
 3. Advance, move, and reject applications.

We have usage examples for cURL (and soon, Ruby)! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This documentation is open source! Feel free to leave feedback as issues in the [GitHub repo](https://github.com/capablemonkey/greenhouse-api-docs) or fork it and contribute changes!

## Authentication

> To authorize, use this code:

```ruby
require 'base64'
api_token = 'a7183e1b7e9ab09b8a5cfa87d1934c3c'
credential = Base64.strict_encode64(api_token + ':')
# => "YTcxODNlMWI3ZTlhYjA5YjhhNWNmYTg3ZDE5MzRjM2M6"

headers = {
  "Authorization" => "Basic " + credential
}
```

```shell
# Note the trailing colon after the username (API token):
$ curl https://harvest.greenhouse.io/v1/candidates/ -u a7183e1b7e9ab09b8a5cfa87d1934c3c:
...

> GET /v1/candidates/ HTTP/1.1
> Host: harvest.greenhouse.io
> Authorization: Basic YTcxODNlMWI3ZTlhYjA5YjhhNWNmYTg3ZDE5MzRjM2M6

...
```

Harvest uses Basic Auth over HTTPS for authentication. The username is your Greenhouse API token and the password should be blank. Unauthenticated requests will return an HTTP 401 response.

### Authorization header

> Your `Authorization` header should look like this:

```
Authorization: Basic YTcxODNlMWI3ZTlhYjA5YjhhNWNmYTg3ZDE5MzRjM2M6
```

Most HTTP clients will automatically use a given username and password to generate the required Authorization header. However, you may need to explicity set this header. The header has the following format:

`Authorization: Basic <base64("username:password")>`

Since only a username needs to be provided in our case, you'll need to append a `:` (colon) to your Greenhouse API token and then Base64 encode the resulting string.

<aside class="success">
<b>Important</b>: Use HTTPS for all requests. Requests made over HTTP will always return an HTTP 403 response. Keep your API key a secret!
</aside>

### Setting credentials with cURL

If you're making test API requests with cURL you can use the `-u` flag to set the username and password (which is blank). cURL will automatically generate the `Authorization` header.

## Throttling

```
Status: 200 OK
X-RateLimit-Limit: 50
X-RateLimit-Remaining: 49
```

API requests may be throttled. Check the `X-RateLimit-Limit` and `X-RateLimit-Remaining` headers to see how many requests you are allowed until throttling kicks in. Making too many requests in a short time frame will cause Harvest to return an `HTTP 429` response.

## Pagination

```
Link: <https://harvest.greenhouse.io/v1/candidates?page=2&per_page=2>; rel="next",
<https://harvest.greenhouse.io/v1/candidates?page=474&per_page=2>; rel="last"
```

API methods that return a collection of results are always paginated. You can specify the current page and number of items per page with the `page` and `per_page` query parameters. Paginated results include a `Link` response header that specifies the location of the next and last pages:

## Validation

```json
{
  "message": "Validation error",
  "errors": [
    {
        "message": "Must be one of: candidate, prospect",
        "field": "type"
    }
  ]
}
```

Methods that take input will validate all parameters. Any parameter that fails validation will trigger an error response with status `HTTP 422`. The response body will be a JSON object that includes a message as well as a list of fields that failed validation.

## General considerations

Unless otherwise specified, API methods generally conform to the following:

- Properties without a value will use `null` instead of being undefined
- "Snake Case" is used for attribute names (e.g. `first_name`)
- Timestamps are rendered in ISO-8601 format (e.g. `2013-11-21T18:35:22Z`)
- URLs to external resources are valid for 30 days
- We reserve the right to add more properties to objects, but will never change or remove them

## Errors

Error Code | Meaning
---------- | -------
401 | Unauthorized -- Invalid Harvest API key.  Check to make sure you've passing it in via the `Authorization` header (Basic Auth)
403 | Forbidden -- You do not have access to that record.
404 | Not Found -- Resource not found
500 | Server Error -- We had a problem with our server. Try again later or contact us: support@greenhouse.io