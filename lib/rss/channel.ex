defmodule RSS.Channel do

  defstruct ~w(title link description language copyright managing_editor web_master pub_date last_build_date category generator docs cloud ttl image text_input skip_hours skip_days)a

  def new(map) do
    struct(__MODULE__, map)
  end


end
