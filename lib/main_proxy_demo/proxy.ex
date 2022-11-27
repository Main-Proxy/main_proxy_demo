defmodule MainProxyDemoWeb.Proxy do
  use MainProxy.Proxy

  @impl MainProxy.Proxy
  def backends do
    [
      %{
        domain: "makeup.localhost",
        phoenix_endpoint: MakeupLiveWeb.Endpoint
        # phoenix_endpoint: MainProxyDemoWeb.Endpoint
      },
      %{
        phoenix_endpoint: MainProxyDemoWeb.Endpoint
      }
    ]
  end
end
