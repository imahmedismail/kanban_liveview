# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KanbanLiveview.Repo.insert!(%KanbanLiveview.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

board = KanbanLiveview.Repo.insert!(%KanbanLiveview.Board{title: "Awesome project"})

backlog =
  KanbanLiveview.Repo.insert!(%KanbanLiveview.Column{title: "Backlog", board_id: board.id})

_in_progress =
  KanbanLiveview.Repo.insert!(%KanbanLiveview.Column{title: "In progress", board_id: board.id})

_done = KanbanLiveview.Repo.insert!(%KanbanLiveview.Column{title: "Done", board_id: board.id})

_card =
  KanbanLiveview.Repo.insert!(%KanbanLiveview.Card{
    content: "Put some nice cat picture on the homepage",
    column_id: backlog.id
  })
