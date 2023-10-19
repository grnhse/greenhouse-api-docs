# Sending Updates to Greenhouse

### If you have implemented the polling option:
<aside class="warning">The polling option has been deprecated as of October 1, 2019. All Assessment API implementations after this date must use the PATCH Completed Test endpoint. However, existing integrations will continue to work with the original test status method.</aside>
After a successful `send_test` request, Greenhouse will check whether the test instance has been completed by polling the `test_status` endpoint hourly. We will discontinue polling the `test_status` endpoint after the candidate is marked as hired, after we receive a `partner_status` of `complete`, or after 8 weeks have passed since the test was sent.

### If you have implemented the PATCH Completed Test option:

After a successful `send_test` request, you can alert Greenhouse to updates of the test's status by sending a [PATCH Completed Test](#patch-mark-test-as-completed) request to the URL found in the `url` field of the `send_test` request. This will trigger a [Test Status](#test-status) request from Greenhouse. Active, unhired candidates will show the completed test status.

# Test Status

Tells Greenhouse the current status of a take home test.

`GET https://www.testing-partner.com/api/test_status?partner_interview_id=12345`

### Request

```shell
curl 'https://www.testing-partner.com/api/test_status?partner_interview_id=12345'
	
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

Greenhouse will send a `GET` request to the `test_status` endpoint provided by the Assessment Partner. The `GET` request will contain a single query string parameter: `partner_interview_id`.

Parameter Name | Type | Required | Description
-------------- | -------------- | -------------- | --------------
partner_interview_id | String | Yes | Identifies a test instance for a candidate. Initially provided as a response to the [Send Test request] (#send-test). 

<aside class="notice">
The partner_interview_id should not be confused with partner_test_id. While partner_test_id identifies the test, partner_interview_id identifies an instance of the test that was sent to a candidate.
</aside>


### Response

> API Response

```json
{
	"partner_status": "complete",
	"partner_profile_url": "http://example.com/tests/12345",
	"partner_score": 81,
	"metadata":
		{
			"Started At": "10:15 AM 26 March 2014",
			"Completed At": "10:15 AM 26 March 2014",
			"Notes": "This candidate did extremely well!"
		}

}
```

The response to a `test_status` request should contain a JSON object in its body with up to four keys: 
`partner_status`, `partner_profile_url`, `partner_score`, and `metadata`.

Property Name | Type | Required | Description
-------------- | -------------- | -------------- | --------------
partner_status | String | Yes | Describes the current state of the test instance. If the test has been completed and results are available, this value should be **"complete".** We will continue to poll until the status is "complete", or until 8 weeks has passed since the test was sent.
partner_profile_url| String | Required only if status is **complete**. | URL to the candidate’s page on the Test Partner’s website. 
partner_score | Number | No | Numerical score reflecting the candidate’s performance on the test.
metadata | Object | No | A non-nested object containing keys and values that will be displayed in our test results. All of the values must be Javascript primitives.

<aside class="notice">
When Greenhouse makes a test_status request, we may only receive the numerical score of the test. To allow an organization to access more information about the test, we will link to the partner’s site using the partner_profile_url. 
</aside>
