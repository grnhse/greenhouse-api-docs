## Pagination

```graphql
{
  employees(first: 2, after: "NQ==") { # Please fetch the next 2 records, starting after the "NQ==" cursor
    pageInfo {
      endCursor
      hasNextPage
    }
    edges {
      node {
        email
      }
    }
  }
}

# Returns:

{
  "data": {
    "employees": {
      "pageInfo": {
        "endCursor": "MTA=",
        "hasNextPage": true
      },
      "edges": [
        {
          "node": {
            "email": "kima@example.com"
          }
        },
        {
          "node": {
            "email": "omar@example.com"
          }
        }
      ]
    }
  }
}

```

For performance reasons, some result sets will be limited in size.  For example, when requesting employee profile
information we limit the number of employees returned in a single query.  The API will return a "page" of
records along with an object that describes how to get the next page.

We are using the pagination system recommended by the [GraphQL documentation](http://graphql.org/learn/pagination/).
Paginated connections return the following pieces of information:

* `edges`: You'll find your records in here.
* `pageInfo`: This has information about the current page.

To fetch the next page of information, pass the `endCursor` value into the `after` filter on the
connection.  To the right you can see an example on how to fetch employees via the 
[employees](#employees-employeeconnection) connection.

When requesting a paginated resource, you will always need to provide a value for either the `first` or `last` arguments.
You'll use these arguments to specify the number of records that should be included on a page. If you provide a value larger
than our maximum of 25, you will receive the maximum of 25 records.

As a general rule, we attempt to avoid nested sets of pagination.  For example, the list of CustomFieldValue records
for each employee will be a simple array instead of another paginated connection.