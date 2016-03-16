# Applications

## Submit an application

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
  <!-- "location" is any geocode-able string -->
  <label>Location <input type="text" name="location" /></label><br/>
  <!-- If using a geocoding service, include the longitude and latitude -->
  <input type="hidden" name="longitude" />
  <input type="hidden" name="latitude" />
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

Use this endpoint to submit a new application. This endpoint accepts a multipart form POST representing a job application. Application forms are job-specific and will be constrcuted via the "questions" array available via the [Job method](#retrieve-a-job). 

Please note that when submitting an application through this method, Greenhouse will not confirm the inclusion of required fields. Validation for required fields must be done on the client side, as Greenhouse will not reject applications that are missing required fields.

<aside class="warning">
  This method requires HTTP Basic Auth over SSL/TLS: the Basic Auth username is your API key (found on the API Credentials page). No password is required. 
</aside>

<aside class="notice">
  In general, we would encourage customers to make use of the Embedded Job Application before going to the trouble of building their own form. Our application form is well tested, validated, battle hardened, and has built-in spam protection measures--building your own form can introduce a number of challenges which are typically not worth the additional effort.
</aside>

### HTTP Request

`POST https://api.greenhouse.io/v1/applications/`

### Form Parameters

Parameter | Description
--------- | -----------
id | Job post ID
mapped_url_token | *(optional)* If present, the `gh_src` URL parameter, which is used to indicate the referral source of this application.
first_name | Applicant's first name
last_name | Applicant's last name
email | Applicant's email adress
phone | Applicant's phone number 
location | Applicant's location.  Accepts any geocode-able string.
longitude | If using a geocoding service, include longitude
latitude | If using a geocoding service, include latitude

