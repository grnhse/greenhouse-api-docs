# Introduction

<aside class="notice">
Onboarding webhooks are currently in beta and only available to customers that request access. If you would like to try them out, please contact <a href="https://support.greenhouse.io">support</a>.
</aside>

## What is a webhook?

A webhook is a simple event-notification system. When an event occurs in Greenhouse Onboarding, a payload of JSON data containing information about the event is sent via POST to a specified endpoint URL over HTTPS.

## Creating a webhook

Webhooks have three components. A name, an endpoint URL, and a secret key.

- **Name**: The name is simply a reference for you. It can contain any string value.
- **Endpoint URL**: This is the URL to which we will send the POST data when the event occurs. This must be a fully qualified and valid URL and must be https. Redirects will not be followed.
- **Secret Key**: After you create a webhook, a secret key will be generated and presented to you once. This secret key will be used to generate a signature header that you may use to verify the hook data was sent from Greenhouse and not a malicious third party. The secret key will be used in conjunction with the webhook's payload to generate a digital signature.

## Authentication

```
Signature: sha256 37d2725109df92747ffcee59833a1d1262d74b9703fa1234c789407218b4a4ef
```

> To compute the HMAC digest in Ruby:

```ruby
digest = OpenSSL::Digest.new('sha256')
signature = OpenSSL::HMAC.hexdigest(digest, secret_key, body)
```

> To compute the HMAC digest in PHP:

```php
<?php
  // Requires PHP >= 5.1.2 and PECL hash >= 1.1
  $signature = hash_hmac('sha256', $body, $secret_key);
?>
```

> The `body` variable in the above code samples refers to the entire content of the JSON response. Not just the `payload` attribute.

Greenhouse uses a digital signature which is generated using the secret key of a webhook and the body of the webhook's request. This data is contained within the Signature header.

The header contains: the SHA algorithm used to generate the signature, a space, and the signature. To verify the request came from Greenhouse, compute the HMAC digest using your secret key and the body and compare it to the signature portion (after the space) contained in the header. If they match, you can be sure the webhook was sent from Greenhouse.

## Request Body

```json
{
  "event_type": "string",
  "id": "string",
  "payload": {}
}
```

Webhooks have a json request body with `event_type`, `id`, and `payload`.

The `payload` will be a json object that varies based on the event type.

## Retry policy

In the event of a failed webhook request (due to timeout, a non HTTP 200 response, or network issues), Greenhouse will make up to 7 attempts over the course of 15 hours.


The table below outlines the estimated wait time for each attempt.

| Approx. Total waiting time | Attempt number | Next Attempt in |
| :-------------------------- | :--------------: | :--------------- |
|           0h  0m           |       1        |         1m       |
|           0h  1m           |       2        |         15m       |
|           0h 16m           |       3        |         60m       |
|           1h 16m           |       4        |         120m       |
|           3h 16m           |       5        |         240m       |
|           7h 16m           |       6        |         480m       |
|          15h 16m           |       7        |          --       |
