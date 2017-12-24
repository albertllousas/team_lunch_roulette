# TeamLunchRoulette

## Description

Are you tired to create the typical todo-list project? 

- Home view: Simple form to create team(address, company, team name, background, photo)
- Team view: Restaurant card with map and props
    - Choose another
    - Add restaurant
    - Delete
    - Edit team
    - Check: http://bashooka.com/coding/cool-css-card-ui-examples/ + animated backgrounds depending on type

## Run in your local machine

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Packaging for prod

```
cd assets && node_modules/cross-env/dist/bin/cross-env.js NODE_ENV=production node_modules/webpack/bin/webpack.js
```

## Requirements Versions
elixir 
docker 
npm 


## Tech stack

- Front-end: 
    - vue 2 
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


falta
-----

vue-router and mas tests, ver si se puede acceder directamente a la siguiente vista
https://router.vuejs.org/en/essentials/nested-routes.html

http://blog.plataformatec.com.br/2015/10/mocks-and-explicit-contracts/
https://github.com/ankhers/mongodb
https://tomjoro.github.io/2017-02-09-ecto3-mongodb-phoenix/

solo poner con auth en config y un supervisor ! el resto mongo con :mongo


Mongo.startup() con ensure etc
hacer algo parecido a esto
https://github.com/ankhers/mongodb_ecto

def show(conn, %{"id" => id}) do
  case Accounts.get_user(id) do
    nil ->
      conn
      |> put_status(:not_found)
      |> json(%{error: "User not found"})
    user ->
      render(conn, "show.json", user: user)
  end
end

test
https://hexdocs.pm/phoenix/testing_controllers.html
just follow https://vue-test-utils.vuejs.org/en/
https://vuejs.org/v2/guide/unit-testing.html

otro readme para el frontend en assets 

Tech stack: 


añadir 
https://www.flaticon.com/free-icon/pizza_168307#term=pizza&page=1&position=45

añadir en alt tag
añadir en el svg 

## Test

types and how to run it

create script. run_all_tests.sh

docker pull mongo

docker run --name mongo-team-lunch-roulette -p 27017:27017 -it --rm -d mongo 

docker ps

docker inspect <id>

docker exec -t -i <id> /bin/bash

https://docs.docker.com/engine/reference/run/#foreground 

check params



## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
