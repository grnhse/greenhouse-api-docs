# Introduction

With our Job Board API, you will have easy access to a simple JSON representation of your company's offices, departments, and published jobs. Since we give you access to the raw data, you can build careers pages with a unique look and feel, construct department-level pages, and more!


We support JSONP callbacks, and have a POST method which can be used to build your own online job application form.

## JSONP
```html
<script
  type="text/javascript"
  src="https://api.greenhouse.io/v1/example/method/url?callback=">
</script>
```

To call a method via JSONP (http://en.wikipedia.org/wiki/JSONP), insert the script tag below into your HTML document with an appropriate method URL and provide your own method name in the "callback" querystring parameter. NOTE: The callback name may only contain numbers, letters, underscore, and period.

## Authentication

<aside class="success">
Job Board data is publically available, so authentication is not required for any GET endpoints.
</aside>
Only the application submission endpoint
(`POST https://api.greenhouse.io/v1/boards/{board_token}/jobs/{id}`) requires Basic Auth.
[Read more](#submit-an-application).
