# Candidates

## Retrieve Candidates

```shell
curl 'https://api.greenhouse.io/v1/partner/candidates'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
	"candidate_ids": 17681532
}
```

>API Response


```json
{
	"id": 17681532,
	"name": "Harry Potter",
	"external_id": "24680",
	"applications": [
		{
			"id": 59724,
			"job": "Auror",
			"status": "Active",
			"stage": "Application Review",
			"profile_url": "https://app.greenhouse.io/people/17681532?application_id=26234709"
		}
	]
}
```

Retrieve a candidate's data. Note that this call will only return candidates that the current user has permission to view.

`GET https://api.greenhouse.io/v1/partner/candidates`


*scope: candidates.view*

### Request Parameters

The request should contain a single query parameter that specifies a comma-delimited list of candidate IDs or a single candidate ID. If you provide any candidate ids that don't exist or to which you do not have access, this endpoint will ignore them and only return the candidates that exist to this API key or Bearer token, or will return an empty response if you have only supplied one candidate ID.

An empty array will be returned for "Retrieve Candidates" requests with a single candidate ID for the following use-cases:

1. Permissions changes made on a Greenhouse user account associated to the email address used to authenticate the request (e.g. User has been disabled or deprovisioned). 
2. The candidate is on a job that the user account/email address doesn't have access to. Note that the user account must be at least a job admin on the job associated to the candidate ID. If added as a prospect, the user must have the permission to manage unattached prospects.
3. The candidate profile was manually deleted by the organization.
4. The source on the candidate profile was manually changed to a new source different from the original partner source.
5. The candidate has been merged with another profile generating a new candidate ID.

If you would like more information about why you are not able to access a specific candidate ID, please contact the customer for more details, as Greenhouse Support will not share candidate details without the permission of the organization that owns the candidate record.

Query Parameter Name | Required | Description
-------------- | -------------- | --------------  | --------------
candidate_ids | Yes | Comma-delimited list of Candidate IDs (e.g. 123, 456)


### Response Parameters

The response will always be an array of objects, even if only one `candidate_id` is provided.

Property Name            | Type           | Description
------------------------ | -------------- | --------------
id                       | Integer        | The ID of the candidate
external_id              | String         | The external ID that was provided in your initial candidate creation request. Can be null if you request the status of a candidate not associated with an external entity.
applications[]           | Array          | An array containing 0 or more applications representing the jobs to which this candidate has applied. Each of the sub-elements are required for each of the applications.
applications.id          | Integer        | The ID of the application.
applications.job         | String         | Name of the job this application is for (e.g. "Software developer).
applications.status      | String         | The candidate’s current status. Must be one of "rejected," "active," or "hired."
applications.stage       | String         | The applicant’s current stage in the interview pipeline (e.g. "Recruiter Phone Screen").
applications.profile_url | String         | A URL to the candidate’s profile in Greenhouse. You must be signed in to Greenhouse to view the profile.



## Post Candidates

```shell
curl -X POST 'https://api.greenhouse.io/v1/partner/candidates'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
-H "Content-Type: application/json"
```

```json
{
	"prospect": "true",
	"first_name": "Harry",
	"last_name": "Potter",
	"company": "Hogwarts",
	"title": "Student",
	"resume": "https://hogwarts.com/resume",
	"phone_numbers": [
		{
			"phone_number": "123-456-7890",
			"type": "home"
		}
	],
	"emails": [
		{
			"email": "hpotter@hogwarts.edu",
			"type": "other"
		}
	],
	"social_media": [
		{
			"url": "https://twitter.com/hp"
		}
	],
	"websites": [
		{
			"url": "https://harrypotter.com",
			"type": "blog"
		}
	],
	"addresses": [
		{
			"address": "4 Privet Dr",
			"type": "home"
		}
	],
	"job_id": 12345,
	"external_id": "24680",
	"notes": "Good at Quiddich",
	"prospect_pool_id": 123,
	"prospect_pool_stage_id": 456,
	"prospect_owner_email": "prospect_owners_email@example.com"
}
```


> API Response

```json
{
"id": 12345,
"application_id": 17681532,
"external_id": "24680",
"profile_url": "https://app.greenhouse.io/people/17681532?application_id=26234709"
}
```


Create one or more candidates or prospects


`POST https://api.greenhouse.io/v1/partner/candidates`


*scope: candidates.create*


### Request Parameters


Property Name  | Type | Required | Description
-------------- | -------------- | --------------  | --------------
prospect | Boolean | No | True if this candidate should be a prospect. The organization must be able to create prospects to set this field. (Default: true)
job_id | Integer | Mixed | Required only if prospect is false. The ID of the job to which this candidate or prospect should be added.
first_name | String | Yes
last_name | String | Yes
external_id | String | Yes | The unique id of this candidate in your application’s system.
company | String | No | Candidate's current company
title | String | No | Candidate's current title
resume | String | No | URL to the candidate’s resume. Greenhouse will attempt to ingest the document at this URL and add it to the candidate record.
phone_numbers[] | Array | No
phone_numbers.phone_number | String | Mixed | Only required if phone_number is included.
phone_numbers.type | String | Mixed | Must be "mobile", "home", "work", or "other." Only required if phone_number is included.
emails[] | Array | No
emails.email | String | Mixed | Note: Only required if email is included.
emails.type | String | Mixed | Must be "personal", "work", or "other". Only required if email is included.
addresses[] | Array | No
addresses.address | String | Mixed | A free form block of text, which may include newlines ("\n"). Only required if addresses are included.
addresses.type | String | Mixed | Must be "home", "work", or "other". Only required if addresses are included.
social_media[] | Array | No
social_media.url | String | Mixed | Note: Only required if social media urls are included.
websites[] | Array | No
websites.url | String | Mixed | Note: Only required if websites are included.
websites.type | String | Mixed | Must be either “personal”, “company”, “portfolio”, “blog”, or “other”. Only required if websites are included.
referrer | Object | No | If present, this value will be used to populate the "Who Gets Credit" field for the candidate’s application. If omitted, the "Who Gets Credit" field will be populated with the current user’s information.
referrer.email | String | Mixed | Used to match this referrer with an existing Greenhouse user, if possible. Only required if referrer is included.
referrer.first_name | String | Mixed | Used to create a new ‘Referrer’ in Greenhouse if referrer.email does not match an existing user. Only required if referrer is included.
referrer.last_name  | String | Mixed | Used to create a new ‘Referrer’ in Greenhouse if referrer.email does not match an existing user. Only required if referrer is included.
notes | String | No | Free-form plain-text notes about this candidate. One way for this to be used is to send secondary information that our API can’t capture as structured data. For example: "Skills: Java, C++, Python"
prospect_pool_id | Integer | Mixed | Used to put a prospect in the Prospect Pool with this id. Only required if prospect_pool_stage_id is included. "prospect" property must be set to true.
prospect_pool_stage_id | Integer | No | Used to put a prospect in the Prospect Pool Stage with this id. The stage must belong to the prospect pool provided in prospect_pool_id. "prospect" property must be set to true.
prospect_owner_email | String | No | Used to set the prospect owner for a prospect by providing a valid user's email that exists in Greenhouse. "prospect" property must be set to true.


### Response Parameters

 The API will respond with a single object if a single object was provided or an array of objects if an array was provided.

Property Name  | Type           | Description
-------------- | -------------- | --------------
id             | Integer        | The ID of the newly created candidate in Greenhouse.
application_id | Integer        | The ID of the application implicitly created in Greenhouse.
external_id    | String         | The external ID that was provided in your request.
profile_url    | String         | A URL to the candidate’s profile within Greenhouse. The user must be signed into Greenhouse to view the profile.
