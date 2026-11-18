# Introduction

With our Job Board API, you will have easy access to a simple JSON representation of your company's offices, departments, and published jobs. Since we give you access to the raw data, you can build careers pages with a unique look and feel, construct department-level pages, and more!


We support JSONP callbacks, and have a POST method which can be used to build your own online job application form.

## JSONP
```html
<script
  type="text/javascript"
  src="https://boards-api.greenhouse.io/v1/example/method/url?callback=">
</script>
```

To call a method via JSONP (http://en.wikipedia.org/wiki/JSONP), insert the script tag below into your HTML document with an appropriate method URL and provide your own method name in the "callback" querystring parameter. NOTE: The callback name may only contain numbers, letters, underscore, and period.

## Authentication

<aside class="success">
Requests may be rate limited for security and traffic reasons.
</aside>
Only the application submission endpoint
(`POST https://boards-api.greenhouse.io/v1/boards/{board_token}/jobs/{id}`) requires Basic Auth. The Job Board API Key must be **Base64 encoded** before it can be used to post applications.
[Read more](#submit-an-application).
