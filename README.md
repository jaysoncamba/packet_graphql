# Packet Graphql

A simple integration of packet api with graphql server in rails api

My objective here is to provide simplified api structure to be consumed by the client and the staff portal. I've adapt the bare minimum requirement which is deploying a server, getting the status of it and destroying it.


## Getting Started

### Prerequisites

- [Git](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org/en/) 2.5.3
- [Rails](http://rubyonrails.org/) 5.2.2

### Developing

1. Run `bundle install` to install dependencies.
2. Run `bundle exec rake graphql:schema:dump` to define and dump graphql schema (when necessary).
3. Run `rails s` to start development server.
4. Open the client to your browser via `http://localhost:3000/graphiql` to access graphiql web interface
5. To add authentication token add `x_app_id` parameter in the request url (http://localhost:3000/graphiql?x_app_id=api_key_here) (only on development mode)

deployed in - [Heroku](https://packet-graphql.herokuapp.com/)

### Accessing Using Curl

```
curl -v -H "X-APP-ID: API_TOKEN_HERE" -H "Content-Type: application/json" -d '{"query":"query { operatingSystems() { edges { node { slug } } } }"}' https://packet-graphql.herokuapp.com//graphql | json_pp

```

### Testing

Run `bundle exec rspec spec` to test the app.


### Things to improve
1. Add more test coverage (sad path).
2. More features integrations like adding ssh-keys as well as events for devices.
3. Integrate CI/CD
4. Publish documentation page using - [Graphdoc](https://github.com/2fd/graphdoc)
