defmodule GildedRose.Item.BackstagePasses do
  def update_item(%GildedRose.Item{name: "Backstage passes", sell_in: sell_in, quality: _quality})
      when sell_in <= 0 do
    %GildedRose.Item{name: "Backstage passes", sell_in: sell_in - 1, quality: 0}
  end

  def update_item(%GildedRose.Item{name: "Backstage passes", sell_in: sell_in, quality: quality})
      when sell_in > 10 do
    %GildedRose.Item{name: "Backstage passes", sell_in: sell_in - 1, quality: quality + 1}
  end

  def update_item(%GildedRose.Item{name: "Backstage passes", sell_in: sell_in, quality: quality})
      when sell_in > 5 do
    %GildedRose.Item{name: "Backstage passes", sell_in: sell_in - 1, quality: quality + 2}
  end

  def update_item(%GildedRose.Item{name: "Backstage passes", sell_in: sell_in, quality: quality})
      when sell_in >= 0 do
    %GildedRose.Item{name: "Backstage passes", sell_in: sell_in - 1, quality: quality + 3}
  end
end
