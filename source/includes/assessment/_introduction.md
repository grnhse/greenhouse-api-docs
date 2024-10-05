# Introduction

Greenhouse integrates with many candidate testing platforms, including code testing, video interviewing, personality testing, and more. We've created the Assessment Partner API to allow our customers to seamlessly integrate our Partners' assessments into their Greenhouse interview workflow. This document outlines the end-user experience with the integration and the technical details of how to implement it.

### Working with Greenhouse to implement the integration

To begin the integration process, please send the following information to us at partners@greenhouse.io:

1. URL for your `list_tests` API call
2. URL for your `send_test` API call
3. URL for your `test_status` API call
4. URL for your `response_error` API call
5. A sample API key

The Partnerships team will configure endpoint URLs for creating assessment stages and provide next steps on receiving access to a Sandbox account to test the integration. If you are building an integration for use by mutual customers, we will need documentation on the integration for the Greenhouse Help Center.

## Workflow

The Assessment Partner will provide an org-level API key to the customer. The organization will provide this API key to their Greenhouse Account Manager, who will input it into our system.

### Selecting the Test

Once Greenhouse enters the API key for the organization, a new partner interview stage will be available for use. The user can add this stage to the Hiring Plan of any job that has access to the new Assessment Partner stage. Greenhouse will then make an API call to the [List Tests endpoint](#list-tests) to determine what tests the organization has configured.

<img src="/images/add-stage.png" alt="Add Stage Image">

### Sending the Test

When a candidate reaches this Interview Stage, the user will click the "Send Test" button to send the test to the candidate via the [Send Test endpoint](#send-test). Greenhouse will send the Test ID and candidate email to the Assessment Partner, who will email the test to the candidate. The Assessment Partner will then send Greenhouse the ID for this unique test instance.

<img src="/images/send-test.png" alt="Add Stage Image">

### Receiving the Test Results

Greenhouse will periodically poll the [Test Status endpoint](#test-status) to retrieve the candidate's test status and results. When the candidate completes the test, Greenhouse will notify the appropriate user that the test is complete. The user will be able to view the candidate's score, navigate to the partner site to see more details, and make an advance or reject decision within Greenhouse. The user will also be able to filter candidates by score and advance or reject candidates in bulk.

Alternatively, Greenhouse's Assessment API now includes the ability to notify Greenhouse of completed tests via the [PATCH - Mark Test as Completed endpoint](#patch-mark-test-as-completed) to avoid long polling!

**Note**: You can only update test statuses for active, unhired candidates.

## Authentication

Every request Greenhouse sends to a Assessment Partner’s API will utilize HTTP Basic Authentication over HTTPS. As such, we require each of the API endpoints to use HTTPS.

When an organization decides to utilize a Assessment Partner’s integration, they will provide their Greenhouse Account Manager with their API key for that Assessment Partner.

Greenhouse will then make all requests for the organization using that API key as the username in Basic Authentication. Greenhouse will append a : (colon) to the API token and then Base64 encode the resulting string.

Note: The API key sent to Greenhouse must be less than 171 characters.

Upon receiving a request, the Assessment Partner should inspect the API key to determine whether the request should be permitted and which data should be returned.

### Example Situation

- _Assessment Partner A_ provided _Customer 1_ with an API key.
- _Customer 1_ provided this key to Greenhouse.
- _Assessment Partner A_ provided the following URL for its `list_tests` endpoint:

      	*https://www.testing-partner-a.com/api/list_tests*

- Greenhouse would make the following request to retrieve the list of available tests:

      	*GET https://www.testing-partner-a.com/api/list_tests*
      	*Authorization: Basic < base-64-encoded-credentials >*

## General considerations

Unless otherwise specified, API methods generally conform to the following:

- Properties without a value will use `null` instead of being undefined
- "Snake Case" is used for attribute names (e.g. `first_name`)
- We reserve the right to add more properties to objects, but will never change or remove them

## Assessment API Change Log

The timestamps below are Eastern Time.

| Date                    | Description																																																											  |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Oct 4, 2024 3:30:00PM | Updated guidelines around API key character length in [Introduction](#introduction) |
| Sep 18, 2024 10:45:00AM | Added `sent_by` to the [Send Test](#send-test) request example                                                                 	  |
| Oct 19, 2023 12:30:00PM | Clarified use of Assessment API for active, unhired candidates in [Introduction](#introduction) and [Test Status](#test-status)	  |
| Oct 13, 2023 3:00:00PM  | Added URL for `response_error` as a requirement in [Introduction](#introduction)        																					|
| Aug 22, 2023 3:00:00PM  | Fixed URL expiry timing in [Send Test](#send-test)                                      																					|
| Aug 21, 2019 2:00:00PM  | Added Change Log and General Consideration sections to the Assessment API documentation 																					|
| Aug 21, 2019 2:00:00PM  | Added [PATCH - Mark Test as Completed](#patch-mark-test-as-completed) endpoint          																					|
