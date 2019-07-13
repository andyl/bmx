defmodule BmxWeb.PageControllerTest do
  use BmxWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "BMX"
  end
end
