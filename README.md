# Elixirtemplate

Alpha version for a template for writing mu.semte.ch services in Elixir using plug_cowboy 2.1.

## Beware
*This repository contains an alpha version for a template. This is not endorsed by mu.semte.ch!*

## TODOS
The following items still need to be done to make this service a proper microservice template:
1. SPARQL query support
2. UUID support
3. SPARQL Escaping

### Nice to have
1. Live Reload

## Docker Compose
To add an service based on this template to a mu.semte.ch app you can add the following snippet to your docker compose file. This snippet assumes you have created a new folder called my-new-service and have at the very least added an app.ex file in that folder as outlined in 'creating a new microservice' below.
```
  newService:
    flowofcontrol/elixir-template:alpha
    volumes:
      - ./my-new-service:/app/project
```

## Creating a new microservice
Create a new folder. Add the following Dockerfile:
```
FROM flowofcontrol/elixir-template:alpha
LABEL maintainer="flowofcontrol@gmail.com"
ADD . /app/project/
```

Create your microservice in app.ex:
```
defmodule Service.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Welcome")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
```

## Dependencies
If you want to add dependencies you will need to provide a complete mix.exs file for this project.
Create a mix.exs file with the following content:
```
defmodule Elixirtemplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixirtemplate,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Elixirtemplate.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.1"}
    ]
  end
end
```

## Custom Modules
If you want to create your own custom modules just add a folder called lib/ in the root folder for the microservice. Then you can create modules here an import/use them in your app.ex as normal.

### Custom Module Example
For instance if I wanted to create a module called TestModule then I would do:
```
mkdir lib
cd lib
touch TestModule.ex
```
And then add the following in the TestModule.ex file:
```
defmodule TestModule do
  def test_function() do
    "..."
  end
end
```
After this I could have a route in app.ex such as:
```
  get "/testmodule" do
    send_resp(conn, 200, TestModule.test_function())
  end
```

## Advanced use
If you have dependencies that you want compiled before the service is launched with docker-compose you can use the following Dockerfile:
```
FROM flowofcontrol/elixir-template:alpha
LABEL maintainer="flowofcontrol@gmail.com"
ADD . /app/project/
RUN mix run
```
