# Introduction
Audit log offers a record of important events from the prior thirty days, providing insights to who accessed or edited information in Greenhouse Recruiting.

Use audit log to empower your teams to detect and minimize the impact of incidents when they occur, scrutinize configuration edits, and ensure sensitive data is only accessed by the people who truly need it. Learn more about [what to expect with audit log](https://support.greenhouse.io/hc/en-us/articles/15074318933275).

<aside class="success">
<b>Note</b>: Ready to enable audit log for your organization? <a href="mailto:accountmanagement+auditlog@greenhouse.io?subject=I%20want%20to%20learn%20more%20about%20audit%20log">Reach out to us</a> to get started.
</aside>

## Authentication
Audit log uses bearer authorization over HTTPS with a valid access token. You’ll need a Harvest API key to generate an access token, returned through the Harvest endpoint [POST: Authenticate audit log](#post-authenticate-audit-log). Use the access token as your bearer to authenticate audit log API requests.

### The authenticate audit log object
The authenticate audit log object returns an access token that is valid for 24 hours, which can be used to authenticate your requests to [the events object](#the-events-object).

### Attributes
Attribute | Definition
--------- | -----------
access_token | A JWT (JSON web token) that’s valid for 24 hours from the time of creation.
expires | The exact time the access token will expire in `ISO-8601` format, like `2024-02-03T16:38:46.985Z`.


### POST: Authenticate audit log
```shell
HTTP request

curl -X POST 'https://harvest.greenhouse.io/auth/jwt_access_token'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFmE2MWwNjdlMjQ6"

{
    "access_token": "MeyJhbGci.eyJhdWQiO",
    "expires": 2024-02-03T16:38:46.985Z
}
```
#### HTTP request

`POST https://harvest.greenhouse.io/auth/jwt_access_token`

<aside class="success">
<b>Note</b>: Use HTTPS for all requests. Requests made over HTTP will return an <code>HTTP 401</code> response.
</aside>

## Rate limiting
```shell
Status: 200 OK
X-RateLimit-Limit: 50
X-RateLimit-Remaining: 49
```

Audit log API requests are limited to 50 per 10 seconds, as specified in the returned `X-RateLimit-Limit` header. Paginated requests are limited to 3 per 30 seconds. Check the `X-RateLimit-Limit` and `X-RateLimit-Remaining` headers to see how many more requests are permitted until throttling kicks in. Exceeding the limit will return an `HTTP 429` response.

<aside class="success">
<b>Note</b>: An <code>HTTP 429</code> response will exclude the <code>X-RateLimit-Limit</code> and <code>X-RateLimit-Remaining</code> headers.
</aside>

## Pagination
Pagination on audit log API allows for retrieving the next page from your query results.

1. In the initial request:
    - Set the `paging` [query parameter](https://developers.greenhouse.io/audit-log.html#the-events-object) to `true` to receive a `paging` object with `pit_id` and `next_search_after` in the response
    - Use the `Size` header to specify the number of results you want to receive per page. The minimum value is `100`, and the maximum value is `500`
1. In subsequent requests:
    - Ensure that the query parameters remain consistent with the initial request
    - Set the `Pit-Id` header to the `paging.pit_id` value from the initial request
    - Set the `Search-After` header to the `paging.next_search_after` value from each response progressively
1. The last page of results will return `null` for the `paging.next_search_after` attribute, and an empty list of `results`


Audit log API requests are rate limited. Paginated requests are limited to 3 per 30 seconds, and overall requests are limited to 50 per 10 seconds. Exceeding the limit will result in [throttling](https://developers.greenhouse.io/audit-log.html#throttling).

## Validation
Any methods that take input will validate all parameters. Any parameter that fails validation will trigger an error response with status `HTTP 422`. The response body will be a JSON object that includes a message as well as a list of fields that failed validation.

## General considerations


Unless otherwise specified, audit log API methods generally conform to the following standards:

- Properties without a value will use `null` instead of being undefined.
- “Snake case” is used for attributes and headers, like `first_name`.
- Timestamps are rendered in `ISO-8601` format, like `2024-02-03T16:38:46.985Z`.
- URLs to external resources are valid for thirty days.
- Resumes, cover letters, and other document attachments are hosted on Amazon Web Services and are provided via signed, temporary URLs. Due to the temporary nature of these resources, you should download the documents immediately after your request is made. You shouldn’t rely on these URLs to be available in future requests. In the event AWS is experiencing issues, document attachments won’t be available in audit log.

## Errors

| Error Code | Meaning                                                                                                                                                                                                 |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 401        | Unauthorized -- Your access token is invalid or has expired. Access tokens expire 24 hours after generation. Ensure you’re sharing a [valid access token](#authentication) in the authorization header. |
| 403        | Forbidden -- You do not have access to that record.                                                                                                                                                     |
| 404        | Not Found -- Resource not found                                                                                                                                                                         |
| 422        | Not processed -- We’re not able to process your request. Validate your parameters.                                                                                                                      |
| 429        | Rate limit exceeded -- You’re being [throttled](#throttling) for exceeding our rate limit.                                                                                                              |
| 500        | Server Error -- We’re having a problem with our server. Give us a few minutes and try again, or check [our status page](https://status.greenhouse.io/).                                                 |

## Audit Log Change Log

| Date                          | Description                                                                                                                       |
|-------------------------------| --------------------------------------------------------------------------------------------------------------------------------- |
| Dec 12, 2023 | Fix bug with missing GET events in nav menu
| Nov 7, 2023 | Removed On-Behalf-Of header from the [events object](#events) sample payload
| Nov 6, 2023 | Updated Throttling section to Rate limiting and updated approach to rate limiting.
| Oct 26, 2023 | Updated Pagination to reflect new approach to returning `pit_ids`.
| July 14, 2023 | We added new query parameters to the Events endpoint, including `performer_ids`, `performer_types`, `performer_ip_addresses`, `event_types`, `event_target_ids`, `event_target_types`, `request_ids`, and `request_types`.
