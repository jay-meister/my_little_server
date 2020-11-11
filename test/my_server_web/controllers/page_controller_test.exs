defmodule MyServerWeb.PageControllerTest do
  use MyServerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Your input"
  end

  test "POST /", %{conn: conn} do
    conn = post(conn, "/", %{"check" => "0"})
    assert html_response(conn, 200) =~ "Your input"
    assert html_response(conn, 200) =~ "enter a positive integer less than"
  end
end
