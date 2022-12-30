defmodule KanbanLiveviewWeb.PageController do
  use KanbanLiveviewWeb, :controller
  alias KanbanLiveview.Boards

  def index(conn, _params) do
    board = Boards.get_first_board()
    render(conn, "index.html", board: board)
  end
end
