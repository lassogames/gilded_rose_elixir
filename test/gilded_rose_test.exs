defmodule GildedRoseTest do
  use ExUnit.Case

  # Standard Item Tests
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


  # Sulfuras Tests
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

  # Tests for Aged Brie
  describe "when item is 'Aged Brie'" do
    test "increase quality by 1" do
      fixed = [%GildedRose.Item{name: "Aged Brie", sell_in: 9, quality: 1}]
      expected = [%GildedRose.Item{name: "Aged Brie", sell_in: 8, quality: 2}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "increase quality by 2 when sell_in is less than 0" do
      fixed = [%GildedRose.Item{name: "Aged Brie", sell_in: 0, quality: 5}]
      expected = [%GildedRose.Item{name: "Aged Brie", sell_in: -1, quality: 7}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "don't increase quality by 2 when sell_in is 0 if quality is 50" do
      fixed = [%GildedRose.Item{name: "Aged Brie", sell_in: 0, quality: 49}]
      expected = [%GildedRose.Item{name: "Aged Brie", sell_in: -1, quality: 50}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "don't increase quality at all when sell_in is less than 0 if quality is 50" do
      fixed = [%GildedRose.Item{name: "Aged Brie", sell_in: -1, quality: 50}]
      expected = [%GildedRose.Item{name: "Aged Brie", sell_in: -2, quality: 50}]

      assert GildedRose.update_quality(fixed) == expected
    end
  end

  # Tests for Backstage Passes
  describe "when item is 'Backstage passes'" do
    test "increase quality by 1 when sell_in is more than 11" do
      fixed = [%GildedRose.Item{name: "Backstage passes", sell_in: 11, quality: 5}]
      expected = [%GildedRose.Item{name: "Backstage passes", sell_in: 10, quality: 6}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "increase quality by 2 when sell_in is 10 days or less" do
      fixed = [%GildedRose.Item{name: "Backstage passes", sell_in: 9, quality: 1}]
      expected = [%GildedRose.Item{name: "Backstage passes", sell_in: 8, quality: 3}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "increase quality by 3 when sell_in is 5 days or less" do
      fixed = [%GildedRose.Item{name: "Backstage passes", sell_in: 5, quality: 7}]
      expected = [%GildedRose.Item{name: "Backstage passes", sell_in: 4, quality: 10}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "quality drops to 0 after the concert, when sell_in is below 0" do
      fixed = [%GildedRose.Item{name: "Backstage passes", sell_in: 0, quality: 40}]
      expected = [%GildedRose.Item{name: "Backstage passes", sell_in: -1, quality: 0}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "don't increase quality if it is 50" do
      fixed = [%GildedRose.Item{name: "Backstage passes", sell_in: 5, quality: 50}]
      expected = [%GildedRose.Item{name: "Backstage passes", sell_in: 4, quality: 50}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "doen't increase quality over 50" do
      fixed = [%GildedRose.Item{name: "Backstage passes", sell_in: 5, quality: 49}]
      expected = [%GildedRose.Item{name: "Backstage passes", sell_in: 4, quality: 50}]

      assert GildedRose.update_quality(fixed) == expected
    end
  end

  # Tests for Conjured items
  describe "when item is 'Conjured'" do
    test "degrade quality by 2" do
      fixed = [%GildedRose.Item{name: "Conjured", sell_in: 9, quality: 10}]
      expected = [%GildedRose.Item{name: "Conjured", sell_in: 8, quality: 8}]

      assert GildedRose.update_quality(fixed) == expected
    end

    test "degrade quality by 4 if sell_in is below 0" do
      fixed = [%GildedRose.Item{name: "Conjured", sell_in: 0, quality: 10}]
      expected = [%GildedRose.Item{name: "Conjured", sell_in: -1, quality: 6}]

      assert GildedRose.update_quality(fixed) == expected
    end
  end

end
