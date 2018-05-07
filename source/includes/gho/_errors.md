## Errors and Validation
```graphql
{
  employees(salary: 1) {
    edges {
      node {
        email
      }
    }
  }
}
```

```json
{
  "errors": [
    {
      "message": "Field 'employees' doesn't accept argument 'salary'",
      "locations": [
        {
          "line": 2,
          "column": 12
        }
      ],
      "fields": [
        "query",
        "employees",
        "salary"
      ]
    }
  ]
}
```
Unlike REST APIs, GraphQL will return an HTTP status of 200, even in cases where there are errors.  You can see an
example of an error message to the right.  The `data` and `errors` properties are siblings.  It's possible for a
mutation to generate a response that has _both_ `data` and `errors`.

The `message` will let you know what's wrong.  The `locations` property
has the line number and column where the error starts.  In this example, it's the second line, 12th column, which
is the start of the word `salary`.  The `fields` property is a breadcrumb trail of how to get to the problem.  Here,
we start at the root-level [Query](#queries) object, go into the `employees` connection, and finally encounter the error at the
`salary` property.
