defmodule Todoapp do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http, plug: Router, options: [port: Application.get_env(:todoapp, :port)]},
       {Mongo, [
        name: :mongo,
        database: Application.get_env(:todoapp, :database),
        pool_size: Application.get_env(:todoapp, :pool_size),
        show_sensitive_data_on_connection_error: true
       ]}
    ]

    opts = [strategy: :one_for_one, name: Todoapp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
