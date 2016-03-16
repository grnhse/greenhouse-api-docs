# Offers

## The offer object

Your organization's offers.

```json
{
  "id": 4949,
  "version": 1,
  "application_id": 1234,
  "created_at": "2014-02-13T22:30:58Z",
  "resolved_at": null,
  "sent_at": "sent_on",
  "status": "deprecated",
  "custom_fields": {
    "employment_type": "Contractor",
    "favorite_station": "The Swan",
    "best_seasons": null,
    "start_date": null,
    "willing_to_negotiate": null,
    "salary": null,
    "notes": null
  }
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The offer's unique identifier |
| version | The version number of this offer.  When an existing offer is updated, a new one is typically created with an incremented version.
| application_id | The ID of the associated [application](#applications).
| created_at | Date whe this offer was created.
| resolved_at | Date when this offer was resolved (e.g. when it was accepted, rejected).
| sent_at | Date when this offer was sent to the candidate.
| status | One of: `unresolved`, `accepted`, `rejected`, `deprecated`.
| custom_fields | Contains a hash of the custom fields configured for this resource. The properties in this hash reflect the active custom fields as of the time this method is called.

## List all offers 

All offers made by your organization ordered by application_id.

```shell
curl 'https://harvest.greenhouse.io/v1/offers' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 4949,
    "version": 1,
    "application_id": 1234,
    "created_at": "2014-02-13T22:30:58Z",
    "resolved_at": null,
    "sent_at": "sent_on",
    "status": "deprecated",
    "custom_fields": {
      "employment_type": "Contractor",
      "favorite_station": "The Swan",
      "best_seasons": null,
      "start_date": null,
      "willing_to_negotiate": null,
      "salary": null,
      "notes": null
    }
  },
  {
    "id": 5318,
    "version": 1,
    "application_id": 2345,
    "created_at": "2014-05-12T18:02:34Z",
    "resolved_at": "2014-05-12T20:52:35Z",
    "sent_at": "sent_on",
    "status": "accepted",
    "custom_fields": {
      "employment_type": "Part-Time",
      "favorite_station": "The Looking Glass",
      "best_seasons": ["Season 1", "Season 2"],
      "start_date": "2014-05-01",
      "willing_to_negotiate": true,
      "salary": {
        "value": 42000,
        "currency": "EUR"
      },
      "notes": "Very excited to start working with this candidate"
    }
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/offers`

### Optional querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.](#the-offer-object)


## List offers for application

```shell
curl 'https://harvest.greenhouse.io/v1/applications/{application_id}/offers' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 4949,
    "version": 1,
    "application_id": 1234,
    "created_at": "2014-02-13T22:30:58Z",
    "resolved_at": null,
    "sent_at": "sent_on",
    "status": "deprecated",
    "custom_fields": {
      "employment_type": "Contractor",
      "favorite_station": "The Swan",
      "best_seasons": null,
      "start_date": null,
      "willing_to_negotiate": null,
      "salary": null,
      "notes": null
    }
  },
  {
    "id": 5318,
    "version": 2,
    "application_id": 1234,
    "created_at": "2014-05-12T18:02:34Z",
    "resolved_at": "2014-05-12T20:52:35Z",
    "sent_at": "sent_on",
    "status": "accepted",
    "custom_fields": {
      "employment_type": "Part-Time",
      "favorite_station": "The Looking Glass",
      "best_seasons": ["Season 1", "Season 2"],
      "start_date": "2014-05-01",
      "willing_to_negotiate": true,
      "salary": {
        "value": 42000,
        "currency": "EUR"
      },
      "notes": "Very excited to start working with this candidate"
    }
  }
]
```

List the offers associated with an application. Greenhouse keeps offer history as updates are made over time. 

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{application_id}/offers`

### URL Parameters

Parameter | Description
--------- | -----------
application_id | ID of the application whose offers you want to retrieve

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response.  Must be an integer between 1 and 100.  Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.

<br>
[See noteworthy response attributes.](#the-offer-object)


## Retrieve an offer

```shell
curl 'https://harvest.greenhouse.io/v1/offers/{id}' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 4949,
  "version": 1,
  "application_id": 1234,
  "created_at": "2014-02-13T22:30:58Z",
  "resolved_at": null,
  "sent_at": "sent_on",
  "status": "deprecated",
  "custom_fields": {
    "employment_type": "Contractor",
    "favorite_station": "The Swan",
    "best_seasons": null,
    "start_date": null,
    "willing_to_negotiate": null,
    "salary": null,
    "notes": null
  }
}
```

Retrieve an offer by its ID.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/offers/{id}`

### Query Parameters

Parameter | Description
--------- | -----------
id | ID of the offer to retrieve

<br>
[See noteworthy response attributes.](#the-offer-object)


## Retrieve current offer for application

```shell
curl 'https://harvest.greenhouse.io/v1/applications/{application_id}/offers/current_offer' \
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 4949,
  "version": 1,
  "application_id": 1234,
  "created_at": "2014-02-13T22:30:58Z",
  "resolved_at": null,
  "sent_at": "sent_on",
  "status": "deprecated",
  "custom_fields": {
    "employment_type": "Contractor",
    "favorite_station": "The Swan",
    "best_seasons": null,
    "start_date": null,
    "willing_to_negotiate": null,
    "salary": null,
    "notes": null
  }
}
```

Fetch the current offer for an application.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{application_id}/offers/current_offer`

### URL Parameters

Parameter | Description
--------- | -----------
application_id | ID of the application whose current offer you want to retrieve

<br>
[See noteworthy response attributes.](#the-offer-object)