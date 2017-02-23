defmodule RSS.Feed do

  @moduledoc """
  Representation of the `feed` section of an RSS feed.
  """

  defstruct channel: nil, items: []

  def new(map) do
    struct(__MODULE__, map)
  end

end
