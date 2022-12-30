defmodule KanbanLiveview.BoardsTest do
  use KanbanLiveview.DataCase
  alias KanbanLiveview.{Repo, Board, Boards}
  use Timex

  setup do
    insert_some_boards()

    [
      boards: Repo.all(Board)
    ]
  end

  describe "get_boards/0 action" do
    test "returns all the inserted boards" do
      assert Boards.get_boards() |> Enum.count() == 2
    end

    test "returns 0 boards, when no boards exists" do
      remove_all_boards()
      assert Boards.get_boards() |> Enum.count() == 0
    end
  end

  describe "get_board_by_id/1 action" do
    test "returns any specific board", %{boards: boards} do
      board = Boards.get_board_by_id(hd(boards).id)
      assert board.title == "Test Title 1"
    end

    test "returns nil when any invalid id is passed" do
      assert Boards.get_board_by_id(11_11_22_44) == nil
    end
  end

  describe "get_first_board/0 action" do
    test "returns only the first inserted board" do
      board = Boards.get_first_board()
      assert board.title == "Test Title 1"
    end

    test "returns nil when no db-record exists" do
      remove_all_boards()
      board = Boards.get_first_board()
      assert board == nil
    end
  end

  defp insert_some_boards() do
    boards_params = [
      %{
        title: "Test Title 1",
        inserted_at: Timex.now() |> Timex.to_naive_datetime() |> NaiveDateTime.truncate(:second),
        updated_at: Timex.now() |> Timex.to_naive_datetime() |> NaiveDateTime.truncate(:second)
      },
      %{
        title: "Test Title 2",
        inserted_at: Timex.now() |> Timex.to_naive_datetime() |> NaiveDateTime.truncate(:second),
        updated_at: Timex.now() |> Timex.to_naive_datetime() |> NaiveDateTime.truncate(:second)
      }
    ]

    Repo.insert_all(Board, boards_params)
  end

  defp remove_all_boards() do
    Repo.delete_all(Board)
  end
end
