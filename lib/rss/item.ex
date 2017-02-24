defmodule RSS.Item do

  defstruct ~w(title link description author category comments enclosure guid pub_date source)a

  @moduledoc """
  Defines an RSS Item

  Available fields are:
  * title
  * link
  * description
  * author
  * category
  * comments
  * enclosure
  * guid
  * pub_date
  * source
  """

  @spec new(map()) :: %__MODULE__{}
  @doc "Generate a new `RSS.Item` with field values"
  def new(map) do
    struct(__MODULE__, map)
  end

end
