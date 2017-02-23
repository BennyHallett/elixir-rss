defmodule RSS.Item do

  defstruct ~w(title link description author category comments enclosure guid pub_date source)a

  def new(map) do
    struct(__MODULE__, map)
  end

end
