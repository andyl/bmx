defmodule Bmx01.Factory do
  use ExMachina.Ecto, repo: Bmx01.Repo
  alias Bmx01.Dm.{Tracker, User, Issue}

  def tracker_factory do
    %Tracker{
      name: "asdf",
      exid: "qwer",
      type: "ZZZ"
    }
  end

  def issue_factory do
    %Issue{
      exid: "qwer",
      type: "ZZZ" ,
      tracker: insert(:tracker)
    }
  end

  def user_factory do
    %User{
      name: "asdf",
      mobile: "408-555-1212"
    }
  end
end
