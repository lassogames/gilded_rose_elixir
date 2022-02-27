defmodule GildedRoseTest do
  use ExUnit.Case

  test "interface specification" do
    gilded_rose = GildedRose.new()
    [%GildedRose.Item{} | _] = GildedRose.items(gilded_rose)
    assert :ok == GildedRose.update_quality(gilded_rose)
  end

  describe "when item is 'Sulfuras'" do
    test "doesn't change" do
      fixture = [%GildedRose.Item{name: "Sulfuras", sell_in: 9, quality: 10}]
      expected = [%GildedRose.Item{name: "Sulfuras", sell_in: 9, quality: 10}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't change when sell_in is negative" do
      fixture = [%GildedRose.Item{name: "Sulfuras", sell_in: -1, quality: 10}]
      expected = [%GildedRose.Item{name: "Sulfuras", sell_in: -1, quality: 10}]

      assert GildedRose.update_quality(fixture) == expected
    end
  end
end
