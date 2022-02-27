defmodule GildedRoseTest do
  use ExUnit.Case

  describe "when item is 'Sulfuras'" do
    test "quality or sell_in doesn't change" do
      fixed = [%GildedRose.Item{name: "Sulfuras", sell_in: 9, quality: 10}]
      expected = [%GildedRose.Item{name: "Sulfuras", sell_in: 9, quality: 10}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "quality doesn't change when sell_in is negative" do
      fixed = [%GildedRose.Item{name: "Sulfuras", sell_in: -1, quality: 10}]
      expected = [%GildedRose.Item{name: "Sulfuras", sell_in: -1, quality: 10}]

      assert GildedRose.update_quality(fixed) == expected
    end
  end
end
