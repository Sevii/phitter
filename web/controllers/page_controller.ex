defmodule Phitter.PageController do
  use Phitter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
