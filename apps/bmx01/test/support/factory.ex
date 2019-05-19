defmodule Bmx01.Factory do
  use ExMachina.Ecto, repo: Bmx01.Repo
  alias Bmx01.Dm.Tracker

  def tracker_factory do
    %Tracker{
      name: "asdf",
      exid: "qwer",
      type: "ZZZ"
    }
  end
end
