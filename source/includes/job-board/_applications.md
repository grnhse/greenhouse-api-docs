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

> cURL equivalent:

```
curl -X POST \
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6" \
  -H "Content-Type: multipart/form-data" \
  -F "first_name=Sammy" \
  -F "last_name=McSamson" \
  -F "email=sammy@example.com" \
  -F "phone=3337778888" \
  -F "location=110 5th Ave New York, NY, 10011" \
  -F "latitude=40.7376671" \
  -F "longitude=-73.9929196" \
  -F "resume=@/path/to/resume/ADA084551.pdf" \
  -F "cover_letter=@/path/to/coverletter/blah.pdf" \
  "https://api.greenhouse.io/v1/boards/very_awesome_inc/jobs/127817"
```

> or, you can POST a JSON encoded body (with `Content-Type: application/json`):

```
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6" \
  -d '{
    "first_name": "Sammy",
    "last_name": "McSamson",
    "email": "sammy@example.com",
    "phone": "3337778888",
    "location": "110 5th Ave New York, NY, 10011",
    "latitude": "40.7376671",
    "longitude": "-73.9929196",
    "resume_text": "I have many years of experience as an expert basket weaver...",
    "cover_letter_text": "I have a very particular set of skills, skills I have acquired over a very long career. Skills that make me...",
    "educations": [
      {
        "school_name_id" : "1403524",
        "degree_id": "1403534",
        "discipline_id": "1403605",
        "start_date": { "month": "1", "year": "1989"},
        "end_date": { "month": "2", "year": "1990"}
      },
      {
        "school_name_id" : "1401063",
        "degree_id": "1403525",
        "discipline_id": "1403608",
        "start_date": { "month": "1", "year": "2011"},
        "end_date": { "month": "2", "year": "2012"}
      }
    ]
  }' \
  "https://api.greenhouse.io/v1/boards/very_awesome_inc/jobs/127817"
```

Use this endpoint to submit a new application. This endpoint accepts a multipart form POST representing a job application. Application forms are job-specific and will be constrcuted via the "questions" array available via the [Job method](#retrieve-a-job). Please see the [Job method](#retrieve-a-job) documentation for instructions on submitting location information through the API.

Note that when submitting an application through this method, Greenhouse will not confirm the inclusion of required fields. Validation for required fields must be done on the client side, as Greenhouse will not reject applications that are missing required fields.

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
*latitude | Applicant's home latitude. This is a *hidden* field and should not be exposed directly to the applicant.
*longitude | Applicant's home longitude. This is a *hidden* field and should not be exposed directly to the applicant.
*resume_text | Plaintext resume body
*cover_letter_text | Plaintext cover letter body
*resume | Resume file contents.  *Only allowed in `multipart/form-data` requests*
*cover_letter | Cover letter file contents.  *Only allowed in `multipart/form-data` requests*
*educations | An array of educations. Each education should has five fields. school_name_id, degree_id, discipline_id, start_date with a hash of month and year, end_date with a hash of month and year. You can get the school_name_id, degree_id, discipline_id from our [List Schools](#list-schools), [List Degrees](#list-degrees), [List Disciplines](#list-disciplines) apis.

### Collecting Applicant Location

Here is the suggested workflow for populating `location`, `latitude` and `longitude`:

1. The applicant begins typing a location in your `location` text box.
2. As the applicant types, your app makes a call to the [Google Places Autocomplete API](https://developers.google.com/maps/documentation/javascript/places-autocomplete)
to retrieve suggested location names (e.g. New York, NY, United States)
and the `place_id` associated with each location (e.g. `ChIJOwg_06VPwokRYv534QaPC8g`).
3. Your app displays the suggested location names to the applicant.
4. The applicant selects a suggested location.
5. Your app uses the `place_id` from the previous API call to retrieve the latitude and
longitude for the selected location using the [Google Place Details API](https://developers.google.com/maps/documentation/javascript/places#place_details).
6. Your app populates the hidden `latitude` and `longitude` fields with the result of
this API call.

Note that all 3 fields must be included. If only `location` is sent and `latitude` and `longitude` are omitted, `location` will be ignored entirely.
