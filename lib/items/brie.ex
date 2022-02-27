defmodule GildedRose.Item.AgedBrie do
  def update_item(%GildedRose.Item{name: "Aged Brie", sell_in: sell_in, quality: quality})
      when sell_in <= 0 do
    %GildedRose.Item{name: "Aged Brie", sell_in: sell_in - 1, quality: quality + 2}
  end

  def update_item(%GildedRose.Item{name: "Aged Brie", sell_in: sell_in, quality: quality}) do
    %GildedRose.Item{name: "Aged Brie", sell_in: sell_in - 1, quality: quality + 1}
  end
end
