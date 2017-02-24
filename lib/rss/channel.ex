defmodule RSS.Channel do

  @moduledoc """
  Defines an RSS Channel

  Available fields are:
  * title
  * link
  * description
  * language
  * copyright
  * managing_editor
  * web_master
  * pub_date
  * last_build_date
  * category
  * generator
  * docs
  * cloud
  * ttl
  * image
  * text_input
  * skip_hours
  * skip_days
  """

  defstruct ~w(title link description language copyright managing_editor web_master pub_date last_build_date category generator docs cloud ttl image text_input skip_hours skip_days)a

  @spec new(map()) :: %__MODULE__{}
  @doc "Generate a new `RSS.Channel` with field values"
  def new(map) do
    struct(__MODULE__, map)
  end


end
