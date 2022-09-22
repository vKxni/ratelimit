defmodule RatelimitWeb.PageController do
  use RatelimitWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 200, "Hello there!")
  end
end
