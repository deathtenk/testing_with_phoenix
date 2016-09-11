defmodule TestingWithPhoenix.PageController do
  use TestingWithPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
