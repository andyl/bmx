defmodule Marcom.PageControllerTest do
  use Marcom.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Marcom"
  end
end
