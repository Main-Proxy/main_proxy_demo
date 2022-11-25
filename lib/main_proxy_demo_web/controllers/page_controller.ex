defmodule MainProxyDemoWeb.PageController do
  use MainProxyDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
