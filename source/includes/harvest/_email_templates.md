# Email Templates

An organization's email templates.

## The email template object

```json
{
  "id": 48765,
  "name": "Default Scorecard Reminder",
  "description": "To be sent to an interviewer when their scorecard is due.",
  "default": true,
  "updated_at": "2018-06-01T17:04:13.598Z",
  "created_at": "2015-11-18T22:26:32.154Z",
  "type": "scorecard_reminder",
  "from": null,
  "cc": [
      "example.user@example.com"
  ],
  "body": null,
  "html_body": "<p>Hello,</p>\r\n<p>Please help us keep our hiring on track!</p>\r\n<p>Send in your feedback now for the interview you conducted earlier today with {{CANDIDATE_NAME}}.</p>\r\n<p>It's easy - just visit the following link to fill out your scorecard online: {{SCORECARD_LINK}}</p>\r\n<p>Thanks,<br /> {{ORGANIZER_NAME}}</p>",
  "user": null
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The email template's unique identifier |
| type | One of: `new_candidate`, `weekly_status`, `daily_recruiting`, `stage_transition`, `new_scorecard`, `new_referral`, `agency_candidate_status`, `agency_candidate_stage`, `take_home_test_email`, `candidate_auto_reply`, `candidate_rejection`, `scorecard_reminder`, `interviewer_invite`, `candidate_email`, `team_email`, `none`, `extending_offer`, `new_agency_submission`, `non_admin_welcome`, `job_admin_welcome`, `site_admin_welcome`, `prospect_referral_receipt`, `candidate_referral_receipt`, `candidate_availability_request`, `candidate_availability_confirmation`
| from | The user who is set to send the email. If the from address can change based on which user took an action in Greenhouse (e.g. scorecard reminders sent from the person who scheduled the interview), this field will be `null`.
| body | The plain text body of the e-mail (may be `null`).
| user |  The user this template belongs to. If null, this is an 'organization wide' template available to everyone.
| html_body | The body of the e-mail with html styling code (may be `null`).

## GET: List Email Templates

List all of an organization's email templates.

```shell
curl 'https://harvest.greenhouse.io/v1/email_templates/' 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 48765,
    "name": "Default Scorecard Reminder",
    "description": "To be sent to an interviewer when their scorecard is due.",
    "default": true,
    "updated_at": "2018-06-01T17:04:13.598Z",
    "created_at": "2015-11-18T22:26:32.154Z",
    "type": "scorecard_reminder",
    "from": null,
    "cc": [
        "example.user@example.com"
    ],
    "body": null,
    "html_body": "<p>Hello,</p>\r\n<p>Please help us keep our hiring on track!</p>\r\n<p>Send in your feedback now for the interview you conducted earlier today with {{CANDIDATE_NAME}}.</p>\r\n<p>It's easy - just visit the following link to fill out your scorecard online: {{SCORECARD_LINK}}</p>\r\n<p>Thanks,<br /> {{ORGANIZER_NAME}}</p>",
    "user": null
  },
  {
    "id": 200008,
    "name": "Personal Candidate Email Template",
    "description": "To email candidates",
    "default": false,
    "updated_at": "2018-06-01T17:08:03.320Z",
    "created_at": "2018-06-01T17:08:03.320Z",
    "type": "candidate_email",
    "from": "{{MY_EMAIL_ADDRESS}}",
    "cc": [],
    "body": null,
    "html_body": "Hi&nbsp;{{CANDIDATE_FIRST_NAME}},<br /><br />Please let me know if you're still interested in&nbsp;{{JOB_NAME}}.<br /><br />Thank you!<br /><br />{{MY_SIGNATURE}}",
    "user": {
        "id": 297349,
        "first_name": "Jane",
        "last_name": "Smith",
        "name": "Jane Smith",
        "employee_id": "12345"
    }
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/email_templates`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| *per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| *skip_count | If `true`, the performance of retrieving email templates will improve. This will remove `last` from the `link` response header.
| created_before | Return only email templates that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only email templates that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before | Return only email templates that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after | Return only email templates that were updated at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.

<br>

[See noteworthy response attributes.](#the-email-template-object)

## GET: Retrieve Email Template

```shell
curl 'https://harvest.greenhouse.io/v1/email_templates/{id}' 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 48765,
  "name": "Default Scorecard Reminder",
  "description": "To be sent to an interviewer when their scorecard is due.",
  "default": true,
  "updated_at": "2018-06-01T17:04:13.598Z",
  "created_at": "2015-11-18T22:26:32.154Z",
  "type": "scorecard_reminder",
  "from": null,
  "cc": [
      "example.user@example.com"
  ],
  "body": null,
  "html_body": "<p>Hello,</p>\r\n<p>Please help us keep our hiring on track!</p>\r\n<p>Send in your feedback now for the interview you conducted earlier today with {{CANDIDATE_NAME}}.</p>\r\n<p>It's easy - just visit the following link to fill out your scorecard online: {{SCORECARD_LINK}}</p>\r\n<p>Thanks,<br /> {{ORGANIZER_NAME}}</p>",
  "user": null
}
```

Retrieve an email template by its `id`.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/email_templates/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the email template to retrieve

<br>

[See noteworthy response attributes.](#the-email-template-object)