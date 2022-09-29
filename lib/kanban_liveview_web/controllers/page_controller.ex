defmodule KanbanLiveviewWeb.PageController do
  use KanbanLiveviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
