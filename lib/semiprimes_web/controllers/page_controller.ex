defmodule SemiprimesWeb.PageController do
  use SemiprimesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def check(conn, %{"check" => number}) do
  end
end
