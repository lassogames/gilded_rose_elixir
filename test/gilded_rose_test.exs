defmodule GildedRoseTest do
  use ExUnit.Case

  describe "when standard item" do
    test "decrease quality and sell_in by 1" do
      fixed = [%GildedRose.Item{name: "Regular item", sell_in: 9, quality: 10}]
      expected = [%GildedRose.Item{name: "Regular item", sell_in: 8, quality: 9}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "don't decrease quality if it is already 0 when sell_in is positive" do
      fixed = [%GildedRose.Item{name: "Regular item", sell_in: 9, quality: 0}]
      expected = [%GildedRose.Item{name: "Regular item", sell_in: 8, quality: 0}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "don't decrease quality if it is already 0 when sell_in is 0 or less" do
      fixture = [%GildedRose.Item{name: "Regular item", sell_in: 0, quality: 0}]
      expected = [%GildedRose.Item{name: "Regular item", sell_in: -1, quality: 0}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "quality decreases by 2 when sell_in is 0 or less" do
      fixture = [%GildedRose.Item{name: "Regular item", sell_in: 0, quality: 5}]
      expected = [%GildedRose.Item{name: "Regular item", sell_in: -1, quality: 3}]

      assert GildedRose.update_quality(fixture) == expected
    end
  end


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
