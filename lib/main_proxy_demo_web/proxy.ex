defmodule MainProxyDemoWeb.Proxy do
  # use MainProxy.NewRouter

  use Plug.Router

  plug :match
  plug :dispatch

  # @behaviour MainProxy.Proxy

  match _ do
    # IO.inspect(conn, label: "conn (new_router.ex:12)")
    IO.inspect(opts, label: "opts (new_router.ex:13)")
    IO.inspect(conn.host, label: "conn.host (proxy.ex:14)")
    case conn.host do
      "hello.localhost" ->
        IO.puts("calling HelloPhoenixWeb endpoint!!!")
        HelloPhoenixWeb.Endpoint.call(conn, opts)
      _ -> MainProxyDemoWeb.Router.call(conn, opts)
    end
    # send_resp(conn, 200, "new router!")
  end

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    IO.puts("INIT!!!")
    # backends = __MODULE__.backends()

    # children =
    #   if MainProxy.Proxy.server?() do
    #     MainProxy.Proxy.spec([backends: backends, callback_module: __MODULE__], __MODULE__)
    #   else
    #     []
    #   end

    # Supervisor.init(children, strategy: :one_for_one)
    # IO.inspect(backends, label: "backends (new_router.ex:33)")
    []
  end

  # use MainProxy.Proxy

  # @impl MainProxy.Proxy
  # def backends do
  #   [
  #     %{
  #       domain: "hello.localhost",
  #       phoenix_endpoint: HelloPhoenixWeb.Endpoint
  #     },
  #     %{
  #       phoenix_endpoint: MainProxyDemoWeb.Endpoint
  #     }
  #   ]
  # end
end
