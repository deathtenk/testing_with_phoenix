defmodule TestingWithPhoenix.Channels.RoomChannelSpec do
  use ESpec.Phoenix, channel: TestingWithPhoenix.RoomChannel

  before do
    Ecto.Adapters.SQL.Sandbox.mode(TestingWithPhoenix.Repo, {:shared, self()})
  end

  before do
    token = Phoenix.Token.sign(@endpoint, "user socket", 123)
    {:ok, socket} = connect(TestingWithPhoenix.UserSocket, %{"token" => token})

    {:shared, socket: socket}
  end


  before do
    {:ok, reply, socket} = subscribe_and_join(shared[:socket], "room:lobby", %{})
    {:shared, reply: reply, socket: socket}
  end

  it "should return the socket" do
    expect(shared[:socket].topic).to eq("room:lobby")
  end
end
