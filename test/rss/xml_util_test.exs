defmodule RSS.XmlUtilTest do
  use ExUnit.Case
  alias RSS.{Item,XmlUtil}

  @item            Item.new(title: "An Item", author: "Me")
  @prepared_item   XmlUtil.prepare(:item, @item)

  test "prepare item" do
    {name, attrs, children} = @prepared_item
    assert name == :item
    assert attrs == %{}
    assert children == [{"author", %{}, "Me"}, {"title", %{}, "An Item"}]
  end

  test "generate item" do
    assert XmlUtil.generate(@prepared_item) == "<item>
\t<author>Me</author>
\t<title>An Item</title>
</item>"
  end
end
