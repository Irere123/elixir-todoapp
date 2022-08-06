defmodule Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  get "/" do
    conn
    |> send_resp(200, "Hello world")
  end


  get "/knock" do
    case Mongo.command(:mongo, ping: 1) do
      {:ok, _res} -> send_resp(conn, 200, "Whose there?")
       {:error, _err} -> send_resp(conn, 500, "Something went wrong")
    end
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
