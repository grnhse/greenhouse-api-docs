# Applications

## Submit an application

> This endpoint can take a multipart form-data POST. You should use this if you need to upload a resume or cover letter.

```html 
<!--
EXAMPLE FORM BELOW (simplified):

Please keep in mind that the HTTP Basic Auth API token is a secret key.  Any form posts should be proxied by your own servers.  Any direct post to the /applications POST method would reveal your secret key to anybody that views source--which would be a very bad thing.
-->
<form method="POST" action="!!REQUEST MUST BE PROXIED ON YOUR SERVERS!!" enctype='multipart/form-data'>
  <!-- represents the ID of the job post -->
  <input type="hidden" name="id" value="55555" />
  <!-- place the value of the gh_src URL parameter in the field below -->
  <input type="hidden" name="mapped_url_token" />
  <label>First Name <input type="text" name="first_name" /></label><br/>
  <label>Last Name <input type="text" name="last_name" /></label><br/>
  <label>Email <input type="text" name="email" /></label><br/>
  <label>Phone <input type="text" name="phone" /></label><br/>
  <label>Resume <input type="file" name="resume" /></label><br/>
  <label>Cover Letter <input type="file" name="cover_letter" /></label><br/>
  <label>LinkedIn Profile <input type="text" name="question_5555" /></label><br/>
  <label>Some dropdown
    <select name="question_3333">
      <option></option>
      <option value="1">Yes</option>
      <option value="0">No</option>
    </select>
  </label><br/>
  <label>Multi select with checkboxes<br/>
    <label><input type="checkbox" name="question_2222[]" value="2" /> Red</label><br/>
    <label><input type="checkbox" name="question_2222[]" value="5" /> Orange</label>
  </label><br/>
  <input type="submit" />
</form>
```

> or, you can POST a JSON encoded body (with `Content-Type: application/json`):

```
{
  "first_name": "Sammy",
  "last_name": "McSamson",
  "email": "sammy@example.com",
  "phone": "3337778888",
  "location": "New York, NY",
  "latitude": "51.5034070",
  "longitude": "-0.1275920",
  "resume_text": "I have many years of experience as an expert basket weaver...",
  "cover_letter_text": "I have a very particular set of skills, skills I have acquired over a very long career. Skills that make me..."
}
```

Use this endpoint to submit a new application. This endpoint accepts a multipart form POST representing a job application. Application forms are job-specific and will be constrcuted via the "questions" array available via the [Job method](#retrieve-a-job). 

Please note that when submitting an application through this method, Greenhouse will not confirm the inclusion of required fields. Validation for required fields must be done on the client side, as Greenhouse will not reject applications that are missing required fields.

<aside class="warning">
  This method requires HTTP Basic Auth over SSL/TLS: the Basic Auth username is your API key (found on the API Credentials page). No password is required. 
</aside>

<aside class="notice">
  In general, we would encourage customers to make use of the Embedded Job Application before going to the trouble of building their own form. Our application form is well tested, validated, battle hardened, and has built-in spam protection measures. Building your own form can introduce a number of challenges which are typically not worth the additional effort.
</aside>

### HTTP Request

`POST https://api.greenhouse.io/v1/boards/{board_token}/jobs/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
board_token | Job Board URL token.  If you're submitting an application for a job post on an internal job board, use `"internal"`.
id | Job post ID. Both internal and external job posts are allowed.

### Request Parameters

Parameter | Description
--------- | -----------
*mapped_url_token | If present, the `gh_src` URL parameter, which is used to indicate the referral source of this application.
first_name | Applicant's first name
last_name | Applicant's last name
email | Applicant's email adress
*phone | Applicant's phone number
*location | Applicant's street address
*latitude | Applicant's home latitude
*longitude | Applicant's home longitude
*resume_text | Plaintext resume body
*cover_letter_text | Plaintext cover letter body
*resume | Resume file contents.  *Only allowed in `multipart/form-data` requests*
*cover_letter | Cover letter file contents.  *Only allowed in `multipart/form-data` requests*
