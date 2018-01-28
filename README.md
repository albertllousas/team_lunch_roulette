# TeamLunchRoulette

Are you tired to create the typical todo-list project? 

Here not another todo list app, a real world application just to try Vue and Elixir in a real world application.

This app is a simple tool that allow teams to choose where to eat everyday randomly.

    
## Development requirements

- Elixir 1.5.1
- Docker 17.09.1 
- npm 5.6.0

## Run in your local machine

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Pull mongo docker image with `docker pull mongo`
  * Run mongo image with `docker run --name mongo-team-lunch-roulette -p 27017:27017 -it --rm -d mongo` 
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Packaging for prod

```
cd assets && node_modules/cross-env/dist/bin/cross-env.js NODE_ENV=production node_modules/webpack/bin/webpack.js
```

Ready to run in production? Please [check deployment guides](http://www.phoenixframework.org/docs/deployment).

## Tech stack

- Front-end: 
    - vue 2 
    - vue blue 
    - Web pack
    - scss
    - ES6
    - Jest & vue-test-utils
    
- Back-end:
    - Elixir
    - Phoenix
    - Mix
    
- Repository:
    - MongoDB
    

## Test

 Running the frontend tests:
 ```
 cd assets && npm test
 ```
 Running the backend tests:
  ```
  mix test
  ```

## Implementation guidelines 
 
### Frontend

 All the front is located at /assets
 
### Backend

   * Official website: http://www.phoenixframework.org/
   * Guides: http://phoenixframework.org/docs/overview
   * Docs: https://hexdocs.pm/phoenix
   * Source: https://github.com/phoenixframework/phoenix
