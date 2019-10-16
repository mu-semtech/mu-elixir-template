defmodule Elixirtemplate.Application do
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Service.App, options: [port: 80] }
    ]

    opts = [strategy: :one_for_one, name: Elixirtemplate.Supervisor]

    Logger.info("Starting microservice...")
    Supervisor.start_link(children, opts)
  end
end
