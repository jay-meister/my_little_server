defmodule SemiprimesWeb.PageController do
  use SemiprimesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def check(conn, %{"check" => number}) do
    case Programmai.semi_prime(number) do
      {:ok, result} ->
        render(conn, "index.html", result: result)

      {:error, result} ->
        # we would maybe want to send flash message
        render(conn, "index.html", result: result)
    end
  end
end
