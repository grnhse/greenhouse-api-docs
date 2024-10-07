# Introduction

The Candidate Ingestion API enables sourcing partners with whom Greenhouse shares mutual customers to submit prospects and candidates.

The API allows partners to:

1. Send candidates from the partner application to Greenhouse.
2. Retrieve the current stage and status of candidates.
3. Retrieve jobs on which the Greenhouse user is allowed to operate.

Note: The organization must be able to create prospects in order to create prospects using the Candidate Ingestion API.

## Authentication

This API offers two methods of authentication: OAuth 2.0 and Basic Auth.

### Authentication via OAuth 2.0

If the mutual customer’s users have accounts in both Greenhouse and the partner’s system, the preferred authentication method is [OAuth 2.0](https://tools.ietf.org/html/rfc6749). In this case, the partner would place an integration option on their website which would allow the user to authenticate in to Greenhouse via the partner’s application. This is similar to allowing people to register for a website using Facebook credentials. For a partner to configure this, they must supply Greenhouse with the following information:

1. **Application Name**: The name of the application as it would appear in Greenhouse.
2. **Application URL**: The URL to the primary application.
3. **Callback URL**: This is the URL to which Greenhouse will send
   authenticated users.
4. **Logo Image**: This is a 128x128 image that will be included in the
   permissions modal.

When Greenhouse receives this information, we will supply the partner with a consumer key, a consumer secret, a token URL, and an authorize URL. For example:

| Attribute       | Example Value                             |
| --------------- | ----------------------------------------- |
| Consumer Key    | bMipe4KWf987654321GrLG1Nfk1234567UshvloD  |
| Consumer Secret | LQdulabcdefghijklEZok2fE5xGzeBcDa123gNXtN |
| Token URL       | https://api.greenhouse.io/oauth/token     |
| Authorize URL   | https://api.greenhouse.io/oauth/authorize |

<aside class="notice">
Your Consumer Secret is confidential, and is best kept private. Greenhouse will request to encrypt the Consumer Secret before we send it to you via email. 
</aside>

The partner should use this information to initiate an OAuth 2.0 flow in their application. Note the customer user can rescind this at any time.

When the user attempts to connect with Greenhouse, they will see a prompt asking them to confirm the connection. This prompt will then associate the user’s account in the partner system with their Greenhouse account.

<img src="/images/prompt.png" alt= "Prompt Image" max-width>

Once the OAuth process is complete and the user grants the partner permission to access their data on Greenhouse, the partner will receive an access token. This access token must be included in the Authorization header:

`Authorization: Bearer <access_token>`

### Authentication via Basic Auth

If your users only have an account in Greenhouse and you will be submitting candidates as a partner (and not sourced by a user), you will likely want to authenticate via HTTP Basic Authentication. Users do not have to take any action to authorize your application to modify Greenhouse data. When using basic auth, you are required to set the On-Behalf-Of header for every request. The value should be the e-mail address of the user on behalf of whom you are taking action. For example:

`On-Behalf-Of: john.smith@example.com`

Normally, this will be a service user created specifically for this purpose. If this header is missing, or Greenhouse doesn't recognize the address, the API will issue a _401 Unauthorized_ response. The application must also supply the API key. Via basic auth, you will include the API key as the basic auth username and nothing as the password. Since only a username needs to be provided in our case, you’ll need to append a : (colon) to the API token and then Base64 encode the resulting string. This may be included via URL:

`https://<base64_encoded_api_key>:@api.greenhouse.io/v1/partners/candidates`

or as an authorized header:

`Authorization: Basic base64_encoded_api_key:`

In all cases, the customer will have supplied the partner with a Partner API Key and a service user. Both items are required to submit candidates.

### Note: Capabilities with the Ingestion API will be limited to the permissions of the On-Behalf-Of user

There are four user types, **Site Admin**, **Job Admin**, **Interviewer**, and **Basic**.

Site Admins have access to all jobs by default, whereas Job Admins/Interviewers are assigned to specific jobs. Job Admins/Interviewers will only be able to retrieve jobs via the API that they are assigned access to, or that are live on the company's job board. However they can add Candidates to jobs they have access to, as well as jobless Prospects to Greenhouse.

Because all user permissions are job-based, in order to retrieve jobless Prospects from the API, Site Admins, Job Admins, and Interviewers need the additional Greenhouse permission to manage jobless Prospects. Otherwise, they can only add Prospects, and not retrieve them. This is true of the UI as well.

Basic users have the most restrictions, since their abilities in the UI are also very limited:

Basic users can:

* Retrieve jobs
* Retrieve information about the current user
* Create prospects on no jobs 
* Create candidates on jobs

They can't:

* Retrieve prospects
* Retrieve candidates
* Create a tracking link

<aside class="warning">
All user accounts must be active. Disabled users won't be able to do anything with the Ingestion API.
</aside>



## OAuth Scopes

If you use OAuth for authentication, there are 3 permission scopes to be aware of. Some endpoints will require a specific permission scope while others require none.

- `candidates.create`: Create new candidates or prospects
- `candidates.view`: View candidates imported via this partner
- `jobs.view`: View my jobs.

<aside class="warning">
These scopes do not apply if you are authenticating via Basic Auth.
</aside>

## General considerations

Unless otherwise specified, API methods generally conform to the following:

- Properties without a value will use `null` instead of being undefined
- "Snake Case" is used for attribute names (e.g. `first_name`)
- We reserve the right to add more properties to objects, but will never change or remove them

## Ingestion API Change Log

The timestamps below are Eastern Time.

| Date                    | Description                                                                            |
|-------------------------|----------------------------------------------------------------------------------------|
| Oct 7, 2024             | Updated favicon, github mark, and color palette. Fixed typos and formatting errors.    |
| Apr 15, 2021 03:00:00PM | Added `full_name` and `id` to the [GET current_user] response                          |
| Aug 22, 2019 11:00:00AM | Added Change Log and General Consideration sections to the Ingestion API documentation |
