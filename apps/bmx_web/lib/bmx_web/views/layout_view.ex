defmodule BmxWeb.LayoutView do
  use BmxWeb, :view

  def hdr_link(conn, lbl, path) do
    ~e"""
    <li class="nav-item">
      <%= active_link(conn, lbl, to: path, class_active: "nav-link active", class_inactive: "nav-link", active: :exclusive) %>
    </li>
    """
  end

  def ftr_link(conn, lbl, path) do
    ~e"""
    <li class="nav-item">
      <%= active_link(conn, lbl, to: path, class_active: "nav-link disabled", class_inactive: "nav-link") %>
    </li>
    """
  end

  def subnav_link(conn, lbl, path) do
    ~e"""
    <li class="nav-item">
      <%= active_link(conn, lbl, to: path, class_active: "nav-link active", class_inactive: "nav-link") %>
    </li>
    """
  end

  def controller_label(conn) do
    if Map.has_key?(conn.private, :phoenix_controller) do
      cname = conn.private.phoenix_controller |> to_string() |> String.replace("Elixir.", "")
      aname = conn.private.phoenix_action
      "#{cname}##{aname}"
    else
      "LIVE VIEW"
    end
  end
end
