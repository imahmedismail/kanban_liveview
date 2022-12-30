defmodule KanbanLiveview.Boards do
  import Ecto.Query
  alias KanbanLiveview.{Repo, Board}

  def get_boards() do
    Repo.all(Board)
  end

  def get_board_by_id(id) do
    Repo.get(Board, id)
  end

  def get_first_board() do
    from(b in Board, order_by: [asc: b.id], limit: 1)
    |> Repo.one()
  end
end
