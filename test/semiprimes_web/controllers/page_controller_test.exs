defmodule SemiprimesWeb.PageControllerTest do
  use SemiprimesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Your input"
  end

  test "POST /", %{conn: conn} do
    conn = post(conn, "/", %{"check" => "0"})
    assert html_response(conn, 200) =~ "Your input"
  end
end
