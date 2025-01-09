# Send Test

When a Greenhouse user sends a test to a candidate, Greenhouse will send a request to the Assessment Partner's `send_test` API endpoint. The Assessment Partner will then email the specified candidate the specified test.

### Request

```shell
curl -X POST 'https://www.testing-partner.com/api/send_test'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "partner_test_id": "12345",
  "candidate": {
    "first_name": "Harry",
    "last_name": "Potter",
    "preferred_name": "The Chosen One",
    "resume_url": "https://hogwarts.com/resume",
    "phone_number": "123-456-7890",
    "email": "hpotter@hogwarts.edu",
    "greenhouse_profile_url": "https://app.greenhouse.io/people/17681532?application_id=26234709"
  },
  "sent_by": "test_sender@example.org",
  "url": "https://app.greenhouse.io/integrations/testing_partners/take_home_tests/12345"
}
```

Greenhouse will initiate the process by sending a POST request to the `send_test` endpoint specified by the Assessment Partner. The body of the POST request will contain a JSON payload.

| Property Name          | Type   | Required | Description                                                                                                                |
| ---------------------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------------------- |
| partner_test_id        | String | Yes      | Identifies a test available to an organization. Initially provided as a response to the [List Tests request](#list-tests). |
| first_name             | String | Yes      | The first name of the candidate.                                                                                           |
| last_name              | String | Yes      | The last name of the candidate.                                                                                            |
| preferred_name         | String | Yes      | The preferred name of the candidate.                                                                                       |
| resume_url             | String | No       | A URL to the candidate’s resume. This URL will expire 7 days after the request.                                            |
| phone_number           | String | No       | The candidate’s phone number.                                                                                              |
| email                  | String | Yes      | The candidate’s email address. The test should be sent to this address.                                                    |
| greenhouse_profile_url | String | Yes      | URL to the candidate’s Greenhouse application. Allows the partner to link back to Greenhouse.                              |
| sent_by                | String | No       | Test sender's email address                                                                                                |
| url                    | String | Yes      | URL to which to send the [PATCH Completed Test](#patch-mark-test-as-completed) request, if using                           |

### Response

> The API Response

```json
{
  "partner_interview_id": "98765"
}
```

The response to the `send_test` request should contain a JSON payload in its body. This payload should be a single object that contains a single key: `partner_interview_id`.

| Property Name        | Type   | Required | Description                    |
| -------------------- | ------ | -------- | ------------------------------ |
| partner_interview_id | String | Yes      | Identifies a candidate’s test. |

<aside class="notice">
The partner_interview_id should not be confused with partner_test_id. While partner_test_id identifies the test, partner_interview_id identifies an instance of the test that was sent to a candidate.
</aside>
