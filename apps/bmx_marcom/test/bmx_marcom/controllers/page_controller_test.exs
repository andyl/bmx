defmodule BmxMarcom.PageControllerTest do
  use BmxMarcom.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "BmxMarcom"
  end
end
