defmodule RSS.Feed do

  @moduledoc """
  Representation of the `feed` section of an RSS feed.
  """

  defstruct channel: nil, items: []

  @spec new(map()) :: %__MODULE__{}
  @doc "Generate a new `RSS.Item` with field values"
  def new(map) do
    struct(__MODULE__, map)
  end

end
