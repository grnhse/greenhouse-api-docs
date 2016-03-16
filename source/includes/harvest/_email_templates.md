# Email Templates

Your organization's email templates.

## The email template object

```json
{
  "id": 230,
  "name": "Default Scorecard Due",
  "description": null,
  "default": true,
  "type": "scorecard_reminder",
  "from": null,
  "cc": [],
  "body": "Just a friendly reminder to please submit feedback for your interview with  earlier today.",
  "html_body": null,
  "user": null
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The email template's unique identifier |
| type | One of: `new_candidate`, `weekly_status`, `daily_recruiting`, `stage_transition`, `new_scorecard`, `new_referral`, `agency_candidate_status`, `agency_candidate_stage`, `take_home_test_email`, `candidate_auto_reply`, `candidate_rejection`, `scorecard_reminder`, `interviewer_invite`, `candidate_email`, `team_email`, `none`, `extending_offer`, `new_agency_submission`, `non_admin_welcome`, `job_admin_welcome`, `site_admin_welcome`, `prospect_referral_receipt`, `candidate_referral_receipt`, `candidate_availability_request`, `candidate_availability_confirmation`
| user |  The user this template belongs to. If null, this is an 'organization wide' template available to everyone.
| body | The plain text body of the e-mail (may be null).
| html_body | The body of the e-mail with html styling code (may be null).

## List email templates

```shell
curl 'https://harvest.greenhouse.io/v1/email_templates/' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 230,
    "name": "Default Scorecard Due",
    "description": null,
    "default": true,
    "type": "scorecard_reminder",
    "from": null,
    "cc": [],
    "body": "Just a friendly reminder to please submit feedback for your interview with  earlier today.",
    "html_body": null,
    "user": null
  },
  {
    "id": 1978,
    "name": "Candidate On-site Confirmation",
    "description": "",
    "default": false,
    "type": "none",
    "from": "ben.linus@example.com",
    "cc": ["coordinator@example.com"],
    "body": "Hi , it's go time!",
    "html_body": "<p><b>Hi </b>,</p> <p><i>it's go time!</i></p>",
    "user": {
      "id": 442,
      "name": "Ben Linus"
    }
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/email_templates`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>

[See noteworthy response attributes.](#the-email-template-object)

## Retrieve an email template

```shell
curl 'https://harvest.greenhouse.io/v1/email_templates/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 230,
  "name": "Default Scorecard Due",
  "description": null,
  "default": true,
  "type": "scorecard_reminder",
  "from": null,
  "cc": [],
  "body": "Just a friendly reminder to please submit feedback for your interview with  earlier today.",
  "html_body": null,
  "user": null
}
```

Retrieves your organization's email templates.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/email_templates/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the email template to retrieve

<br>

[See noteworthy response attributes.](#the-email-template-object)